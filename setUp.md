# Create a Docker Volume
A Docker volume ensures that MySQL data persists even after the container is removed.

docker volume create mysql_data

# Run MySQL Container with Persistent Storage
Use the following command to start a MySQL container using the created volume:

docker run -d \
  --name mysql_container \
  -e MYSQL_ROOT_PASSWORD=my-secret-password \
  -e MYSQL_DATABASE=mydb \
  -e MYSQL_USER=myuser \
  -e MYSQL_PASSWORD=mypassword \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:latest

# Verify Running Container
Check if the MySQL container is running:

docker ps

# Connect to MySQL
To access MySQL inside the container:


docker exec -it mysql_container mysql -u root -p

# Check Volume Persistence
Even if the container is removed, the data remains in the volume:

docker rm -f mysql_container
docker run -d \
  --name mysql_container \
  -e MYSQL_ROOT_PASSWORD=my-secret-password \
  -e MYSQL_DATABASE=mydb \
  -e MYSQL_USER=myuser \
  -e MYSQL_PASSWORD=mypassword \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:latest

The data will still be available because it’s stored in the mysql_data volume.

# Alternative: Using a Bind Mount
If you need better portability and management, use Docker Volumes. If you want direct control over data storage, use a bind mount.

If you prefer storing MySQL data in a specific directory on your host machine:

docker run -d \
  --name mysql_container \
  -e MYSQL_ROOT_PASSWORD=my-secret-password \
  -e MYSQL_DATABASE=mydb \
  -e MYSQL_USER=myuser \
  -e MYSQL_PASSWORD=mypassword \
  -v /path/to/mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:latest

  # For ME (Windows)

  docker run -d `
  --name mysql_container `
  -e MYSQL_ROOT_PASSWORD=mypassword `
  -e MYSQL_DATABASE=mydb `
  -e MYSQL_USER=myuser `
  -e MYSQL_PASSWORD=mypassword `
  -v "D:\MySQL Tutorial for Beginners\mysql_data:/var/lib/mysql" `
  -p 3306:3306 `
  mysql:latest

# For DBMS (MySQL Workbench)

My mySQL docker container is running locally:

IP: 127.0.0.1
Port: 3306
User: myuser
Password: mypassword