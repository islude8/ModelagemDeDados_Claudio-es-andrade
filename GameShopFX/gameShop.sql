show databases;

create database gameShop;

use gameShop;
-- Creating Tables
drop table games;
-- drop table categories;
-- drop table clients;
drop table orders;

create table categories(
id_category int primary key not null auto_increment,
name_category varchar(50)
);

create table clients(
id_client int primary key not null auto_increment,
name_client varchar(50)
);

create table games(
id_game int primary key not null auto_increment,
name_game varchar(50),
price float,
constraint fk_id_category foreign key (id_game) references categories(id_category) ON DELETE CASCADE ON UPDATE CASCADE
);


create table orders(
id_order int not null auto_increment,
qty int,
constraint fk_id_client foreign key (id_order) references clients(id_client) ON DELETE CASCADE ON UPDATE CASCADE,
constraint fk_id_game  foreign key (id_order) references categories(id_category) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO games(id_game, name_game, price)
	VALUES(1, 'COD', '300.45'),
		  (2, 'NBA FK', '200.55'),
          (3, 'Among US', '100.95'),
          (4, 'Sonic', '200.45');

INSERT INTO clients(id_client, name_client)
	VALUES(1, 'João'),
          (2, 'Maria'),
          (3, 'Roberto'),
          (4, 'Paula');


INSERT INTO categories(id_category, name_category)
		VALUES(1, 'ACTION'),
              (2, 'ADVENTURE'),
              (3, 'SPORTS'),
              (4, 'FANTASY');


INSERT INTO orders(id_order , qty)
		VALUES(1,2),
              (2, 3),
              (3, 2),
              (4, 3);

DROP table  games;              
SELECT * FROM games;
SELECT * FROM categories;
SELECT * FROM clients;
SELECT * FROM orders;

SELECT clients.name_client, orders.qty, games.name_game, games.price * orders.qty AS TOTAL_PRICE, categories.name_category
FROM orders
INNER JOIN games ON orders.id_order = games.id_game
INNER JOIN clients ON orders.id_order = clients.id_client
INNER JOIN categories ON games.id_game = categories.id_category;

CREATE TABLE invoices(
	id_invoice int primary key not null auto_increment,
    qty_invoice int,
    invoice_name varchar(50),
    invoice_game_name varchar(50),
    invoice_totalPrice float,
    invoice_category varchar(50)
);
DROP TABLE invoices;
SELECT * FROM invoices;

 SELECT clients.id_client, clients.name_client, orders.qty, games.name_game, games.price * orders.qty AS TOTAL_PRICE, categories.name_category
FROM orders
INNER JOIN games ON orders.id_order = games.id_game
INNER JOIN clients ON orders.id_order = clients.id_client
INNER JOIN categories ON games.id_game = categories.id_category;



SELECT * FROM invoices;
DROP TABLE invoices;
