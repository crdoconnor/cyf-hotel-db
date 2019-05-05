drop database if exists hotel;

create database hotel;

\connect hotel;


DROP table IF EXISTS customers;
CREATE TABLE
IF NOT EXISTS customers
(
  id serial primary key,
  title varchar, 
  firstname varchar, 
  surname varchar, 
  email varchar
);

INSERT INTO customers
  (title, firstname, surname, email) VALUES ('Mr', 'John', 'Dove', 'john.doe@domain.com');
  INSERT INTO customers
  (title, firstname, surname, email) VALUES ('Mr', 'Jim', 'Frilton', 'jim.f@domain.com');
  INSERT INTO customers
  (title, firstname, surname, email) VALUES ('Mr', 'Keke', 'Lili', 'keke.lili@domain.com');

INSERT INTO customers (title, firstname, surname, email) VALUES ('Ms',    'Joanna','Smith','j.smith@domain.com');
INSERT INTO customers (title, firstname, surname, email) VALUES ('Ms',    'Anna','Kolen','a.col@domain.com');
INSERT INTO customers (title, firstname, surname, email) VALUES ('Ms',    'Marie','Niki','m.niki@domain.com');
INSERT INTO customers (title, firstname, surname, email) VALUES ('Ms',    'Cherie','Mart','c.mart@domain.com');

select * from customers;

DROP table IF EXISTS room_types;
CREATE TABLE
IF NOT EXISTS room_types
(
  id serial primary key,
  type_name varchar not null,
  original_price decimal,
  current_price decimal
);



INSERT INTO room_types (type_name, original_price, current_price) VALUES ('Single room', 40, 50.50 );

INSERT INTO room_types (type_name, original_price, current_price) VALUES ('Double room', 60, 80 );

INSERT INTO room_types (type_name, original_price, current_price) VALUES ('Suite', 100, 120 );

select * from room_types;

CREATE TABLE
IF NOT EXISTS rooms
(
  id serial primary key,
  room_type_id integer NOT NULL,  
  seaview boolean,
  foreign key(room_type_id) references room_types(id)
);

INSERT INTO rooms (room_type_id, seaview) VALUES (1, 0);
INSERT INTO rooms (room_type_id, seaview) VALUES (2, 0);
INSERT INTO rooms (room_type_id, seaview) VALUES (2, 1);
INSERT INTO rooms (room_type_id, seaview) VALUES (1, 1);
INSERT INTO rooms (room_type_id, seaview) VALUES (2, 0);
INSERT INTO rooms (room_type_id, seaview) VALUES (2, 1);
INSERT INTO rooms (room_type_id, seaview) VALUES (1, 1);


select * from rooms;

create table IF NOT EXISTS reservations (
    id serial primary key,
    customer_id integer not null,
    room_id integer not null,
    check_in_date timestamp not null,
    check_out_date timestamp,
    room_price decimal,
    foreign key (customer_id) references customers (id),
    foreign key (room_id) references rooms (id)
);

  INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date, room_price) VALUES (1,2,'2018/07/10', '2018/07/12',100);
  INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date,room_price) VALUES (2,3,'2018/07/10', '2018/07/12',200);
  INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date,room_price) VALUES (3,4,'2018/07/10', '2018/07/12',300);
  INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date,room_price) VALUES (4,1,'2018/07/10', '2018/07/12',100);

  INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date,room_price) VALUES (1,2,'2018/07/10', '2018/07/12',200);
  INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date,room_price) VALUES (2,3,'2018/07/10','2018/07/12', 500);
  INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date,room_price) VALUES (3,4,'2018/07/10','2018/07/11', 200);
  INSERT INTO reservations (customer_id, room_id, check_in_date, room_price) VALUES (4,1,'2018/07/10',700);

select * from reservations;

create table IF NOT EXISTS invoices (
      id serial primary key,
      reservation_id integer not null,
      total decimal,
      surcharges  decimal,
      invoice_date_time timestamp,
      paid  boolean,
      foreign key (reservation_id) references reservations (id)
  );

INSERT INTO invoices (reservation_id, total, surcharges, invoice_date_time, paid) VALUES (1, 700, 50, '2018/05/01',1);
INSERT INTO invoices (reservation_id, total, surcharges, invoice_date_time, paid) VALUES (2, 1000, 550, '2018/06/08',0);
INSERT INTO invoices (reservation_id, total, surcharges, invoice_date_time, paid) VALUES (3, 200, 50, '2018/03/25',1);
INSERT INTO invoices (reservation_id, total, surcharges, invoice_date_time, paid) VALUES (4, 7700, 50, '2018/08/07',1);
INSERT INTO invoices (reservation_id, total, surcharges, invoice_date_time, paid) VALUES (5, 600, 50, '2018/04/14',0);

select * from invoices;

DROP table IF EXISTS reviews;

create table IF NOT EXISTS reviews (
    id serial primary key,
    customer_id integer not null,
    room_type_id integer not null,
    rating   integer,
    comment text,
    review_date   datetime,
    foreign key
    (customer_id) references customers (id),
    foreign key (room_type_id) references room_types (id)
);
  INSERT into reviews (customer_id, room_type_id, rating, comment, review_date) VALUES (1, 2, 4, "Great room and beautiful hotel", '2018/05/01');
  INSERT into reviews (customer_id, room_type_id, rating, comment, review_date) VALUES (2, 3, 3, "Beautiful hotel", '2018/05/01');
  INSERT into reviews (customer_id, room_type_id, rating, comment, review_date) VALUES (4, 1, 5, "Wonderful service", '2018/05/01');
  INSERT into reviews (customer_id, room_type_id, rating, comment, review_date) VALUES (3, 1, 4, "Great hotel", '2018/05/01');
  select * from reviews;
