PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS customers (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT(16),
  first_name TEXT(64) NOT NULL,
  surname TEXT (64) NOT NULL,
  email TEXT (64)
);


INSERT INTO customers (
  title, first_name, surname, email
) VALUES (
  'Mr',
  'John',
  'Dove',
  'john.doe@domain.com'
);
