DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customers_id SERIAL4 REFERENCES customers(id) ON DELETE CASCADE,
  films_id SERIAL4 REFERENCES films(id) ON DELETE CASCADE
);
