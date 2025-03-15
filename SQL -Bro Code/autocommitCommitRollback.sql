-- Auto commit is a mode by default Auto Commit is set to on.
-- Whenever we execute a transaction within mysql that transaction is SAVED!!
-- If we make a transaction and we need to undo that transaction.
-- Like we accidentally delete all of the rows of this table

DELETE FROM employees;

-- All our rows are now GONE!!
-- How do we undo these changes?

SET AUTOCOMMIT = OFF; -- with this setting set to off our transaction will not save automatically.

-- Create a save point

COMMIT;
SELECT * FROM employees;
DELETE FROM employees;
ROLLBACK;
SELECT * FROM employees;

-- By default auto commit is set to be on, Any transactions after executing are saved.
-- If that mode is set to off, we can commit any changes manually.
-- To UNDO any changes use ROLLBACK statement.
