# Docker Compose MySQL Guide

---

## 1. MySQL Docker Compose Setup

Here's a clean Docker Compose setup for MySQL:

```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: mysql_db
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: mydb
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypassword
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql  # optional: run SQL on startup
    networks:
      - db_network

volumes:
  mysql_data:

networks:
  db_network:
    driver: bridge
```

### Common Commands

```bash
# Start
docker compose up -d

# Stop
docker compose down

# View logs
docker compose logs -f mysql

# Connect via CLI
docker exec -it mysql_db mysql -u myuser -p
```

### Key Environment Variables

| Variable | Description |
|---|---|
| `MYSQL_ROOT_PASSWORD` | Root user password (required) |
| `MYSQL_DATABASE` | Creates a database on startup |
| `MYSQL_USER` / `MYSQL_PASSWORD` | Creates a non-root user |
| `MYSQL_ALLOW_EMPTY_PASSWORD` | Set to `yes` to allow no root password |

### With phpMyAdmin (optional UI)

```yaml
services:
  mysql:
    image: mysql:8.0
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: mydb
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypassword
    volumes:
      - mysql_data:/var/lib/mysql

  phpmyadmin:
    image: phpmyadmin:latest
    restart: unless-stopped
    ports:
      - "8080:80"
    environment:
      PMA_HOST: mysql
      PMA_USER: myuser
      PMA_PASSWORD: mypassword
    depends_on:
      - mysql

volumes:
  mysql_data:
```

Then visit `http://localhost:8080` for the UI.

> **Tip:** Use a `.env` file for secrets instead of hardcoding passwords, and add `.env` to your `.gitignore`.

---

## 2. Docker Compose File Name

The default filename Docker Compose looks for is:

```
compose.yaml        ← preferred (newer standard)
compose.yml
docker-compose.yaml
docker-compose.yml
```

Docker checks them **in that order** and uses the first one found.

### Custom Filename — use the `-f` flag

```bash
docker compose -f my-custom-file.yaml up -d
```

### Multiple Files (merged together)

```bash
docker compose -f docker-compose.yaml -f docker-compose.override.yaml up -d
```

### Common Convention

| File | Purpose |
|---|---|
| `compose.yaml` | Base config |
| `compose.override.yaml` | Auto-merged local overrides |
| `compose.prod.yaml` | Production-specific |
| `compose.dev.yaml` | Dev-specific |

> `compose.override.yaml` is **automatically merged** if it exists alongside `compose.yaml` — no `-f` needed.

---

## 3. `init.sql` and `/docker-entrypoint-initdb.d/`

```yaml
volumes:
  - ./init.sql:/docker-entrypoint-initdb.d/init.sql
```

This is a **special directory** built into the official MySQL Docker image. Any `.sql`, `.sh`, or `.sql.gz` file placed there is **automatically executed on first startup** (only when the data volume is empty/new).

### How It Works

```
Your machine                    MySQL Container
─────────────────               ──────────────────────────────────
./init.sql          ──mount──►  /docker-entrypoint-initdb.d/init.sql
                                        ↓
                                Auto-runs on first boot
                                        ↓
                                Database is ready with your schema/data
```

### Example 1 — Create Tables

```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  title VARCHAR(200),
  body TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### Example 2 — Create Tables + Seed Data

```sql
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  stock INT
);

INSERT INTO products (name, price, stock) VALUES
  ('Apple', 0.99, 100),
  ('Banana', 0.50, 200),
  ('Cherry', 2.99, 50);
```

### Example 3 — Multiple Files (run in alphabetical order)

```
init/
├── 01_schema.sql     ← runs first
├── 02_seed.sql       ← runs second
└── 03_indexes.sql    ← runs third
```

```yaml
volumes:
  - ./init:/docker-entrypoint-initdb.d/
```

### ⚠️ Important Notes

| Behaviour | Detail |
|---|---|
| **Only runs once** | Skipped if `/var/lib/mysql` already has data |
| **Order matters** | Files run alphabetically — prefix with `01_`, `02_` |
| **Targets `MYSQL_DATABASE`** | Runs in the database set by env var |
| **Reset to re-run** | Delete the volume: `docker compose down -v` |

---

## 4. `restart: unless-stopped` Explained

This controls **when Docker automatically restarts your container** if it stops.

### All Restart Policies Compared

| Policy | Restarts on crash? | Restarts on boot? | Restarts if manually stopped? |
|---|---|---|---|
| `no` (default) | ❌ | ❌ | ❌ |
| `always` | ✅ | ✅ | ✅ |
| `on-failure` | ✅ | ❌ | ❌ |
| `unless-stopped` | ✅ | ✅ | ❌ |

### `unless-stopped` Behaviour

```
Container crashes / server reboots
            ↓
    Docker auto-restarts ✅

You manually run: docker compose stop
            ↓
    Docker does NOT restart ❌
    (remembers you stopped it intentionally)
```

### When to Use What

**`unless-stopped`** — most common for databases, APIs, web servers
```yaml
restart: unless-stopped  # restart automatically, but respect manual stops
```

**`always`** — when you want it running no matter what
```yaml
restart: always  # even restarts if you manually stopped it, after daemon restart
```

**`on-failure`** — for one-off jobs or scripts
```yaml
restart: on-failure      # only restart if it crashed (non-zero exit code)
restart: on-failure:3    # max 3 retries
```

**`no`** — for dev/testing
```yaml
restart: "no"   # never auto-restart
```

### Practical Example

```yaml
services:
  mysql:
    image: mysql:8.0
    restart: unless-stopped   # ✅ survives server reboots
                              # ✅ recovers from crashes
                              # ❌ won't restart if you docker compose stop
```

> — `unless-stopped` means *"always keep it running, unless I explicitly tell you to stop."* It's the safest default for production services like MySQL.

---

## 5. Volumes & Persistent Storage

A **volume** keeps your data alive even when the container is removed or recreated.

### Without Volume ❌
```
docker compose down
      ↓
Container deleted → ALL MySQL data gone forever
```

### With Volume ✅
```
docker compose down
      ↓
Container deleted → Data stays in volume
docker compose up
      ↓
MySQL starts fresh with all your data intact
```

---

### Two Types of Volumes

#### 1. Named Volume (Recommended)
Docker manages the storage location automatically.

```yaml
services:
  mysql:
    image: mysql:8.0
    volumes:
      - mysql_data:/var/lib/mysql   # named_volume:container_path

volumes:
  mysql_data:   # declare it here
```

Storage location: `/var/lib/docker/volumes/mysql_data/_data`

---

#### 2. Bind Mount
You control the exact folder on your machine.

```yaml
services:
  mysql:
    image: mysql:8.0
    volumes:
      - ./mysql-data:/var/lib/mysql  # ./your_folder:container_path
```

Storage location: your project folder `./mysql-data/`

---

### Named Volume vs Bind Mount

| | Named Volume | Bind Mount |
|---|---|---|
| Location | Docker manages | You choose |
| Portability | ✅ Works anywhere | ❌ Path must exist |
| Performance | ✅ Faster | Slightly slower |
| Visibility | Hidden in Docker dir | Visible in project |
| Best for | **Production / DBs** | Dev / config files |

---

### Full Example with Persistent Volume

```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: mysql_db
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: mydb
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypassword
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql          # ✅ persistent DB data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql  # init script

volumes:
  mysql_data:
    driver: local   # default, can omit
```

---

### Useful Volume Commands

```bash
# List all volumes
docker volume ls

# Inspect a volume (see actual path)
docker volume inspect mysql_data

# Delete a specific volume
docker volume rm mysql_data

# Delete volume WITH containers (dangerous!)
docker compose down -v

# Backup a volume
docker run --rm \
  -v mysql_data:/data \
  -v $(pwd):/backup \
  alpine tar czf /backup/mysql_backup.tar.gz /data
```

---

### `/var/lib/mysql` — Why This Path?

This is where MySQL **inside the container** stores all its data files. By mounting a volume here, everything MySQL writes gets persisted outside the container.

```
Container                    Volume (your machine)
─────────────────            ──────────────────────
/var/lib/mysql/   ◄──────►  mysql_data volume
  ├── mydb/                    (survives restarts,
  ├── ibdata1                   rebuilds, updates)
  └── ib_logfile0
```

> — Always use a **named volume** for MySQL data. Never run a database container without one.