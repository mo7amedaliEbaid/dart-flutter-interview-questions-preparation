### SQL (Structured Query Language) is a domain-specific language used for managing and manipulating relational databases. Here are some SQL basics to help you get started:

-  Creating a Database:
- To create a new database, you use the CREATE DATABASE statement:
```
CREATE DATABASE mydatabase;
```
- Switching to a Database:
- To switch to a specific database, you use the USE statement:

```
USE mydatabase;
```
- 3. Creating Tables:
- Tables are used to store data in a relational database. You create tables using the CREATE TABLE statement:

```
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);
```
- This example creates a table named users with columns id, username, and email.

- 4. Inserting Data:
- To insert data into a table, you use the INSERT INTO statement:

```
INSERT INTO users (id, username, email)
VALUES (1, 'john_doe', 'john@example.com');
```
- 5. Selecting Data:
- To retrieve data from a table, you use the SELECT statement:

```
SELECT * FROM users;
```
- This query retrieves all columns (*) from the users table.

- 6. Filtering Data:
- You can filter data using the WHERE clause:

```
SELECT * FROM users
WHERE username = 'john_doe';
```
- 7. Updating Data:
- To update existing data in a table, you use the UPDATE statement:

```
UPDATE users
SET email = 'john.doe@example.com'
WHERE id = 1;
```
- 8. Deleting Data:
- To delete data from a table, you use the DELETE FROM statement:

```
DELETE FROM users
WHERE id = 1;
```
- 9. Constraints:
- Constraints are rules applied to columns to ensure data integrity. Common constraints include PRIMARY KEY, UNIQUE, NOT NULL, and FOREIGN KEY.

- 10. Joins:
- Joins are used to combine rows from two or more tables based on a related column:

```
SELECT users.username, orders.order_id
FROM users
JOIN orders ON users.id = orders.user_id;
```
- This query retrieves the username from the users table and the corresponding order_id from the orders table where the id in users matches the user_id in orders.

- 11. Grouping and Aggregations:
- You can group data using the GROUP BY clause and perform aggregations using functions like COUNT, SUM, AVG, etc.:
```
SELECT department, COUNT(*) as employee_count
FROM employees
GROUP BY department;
```
- This query counts the number of employees in each department.

- 12. Sorting Data:
- To sort data, you use the ORDER BY clause:
```
SELECT * FROM users
ORDER BY username ASC;
```
- This query retrieves all users and sorts them in ascending order based on the username.

- These are just some fundamental SQL basics. SQL is a powerful language with a rich set of features for working with relational databases. Depending on the specific database system you're using (e.g., MySQL, PostgreSQL, SQLite), there may be some variations in syntax and supported features.

---

## Using sqflite in Flutter

`sqflite` is the SQLite plugin for Flutter, allowing interaction with SQLite databases from Dart.

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  // Open the database
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'example.db');
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // Create the table
    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, other_value REAL)');
  });

  // Insert records using a transaction
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, other_value) VALUES("some name", 1234, 456.789)');
    print('Inserted row id: $id1');
    int id2 = await txn.rawInsert(
        'INSERT INTO Test(name, value, other_value) VALUES(?, ?, ?)',
        ['another name', 12345678, 3.1416]);
    print('Inserted row id: $id2');
  });

  // Query the database
  List<Map> list = await database.rawQuery('SELECT * FROM Test');
  list.forEach((row) {
    print('Record: ${row['id']}, ${row['name']}, ${row['value']}, ${row['other_value']}');
  });

  // Close the database
  await database.close();
}
```

### sqflite Key Operations
- **openDatabase()**: Open (or create) a database at a given path.
- **execute()**: Run SQL DDL statements (CREATE TABLE, etc.).
- **rawInsert()**: Insert records using raw SQL.
- **rawQuery()**: Query records using raw SQL.
- **transaction()**: Group multiple operations in an atomic transaction.
- **close()**: Close the database connection.

### sqflite vs Hive
- **sqflite**: Full relational database (SQL queries, transactions, indexes, complex relationships).
- **Hive**: Lightweight key-value store (simple data, fast, no SQL knowledge required).

