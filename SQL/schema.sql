CREATE TABLE train(
id int,
PRIMARY KEY (id)
);

CREATE TABLE station(
id int,
name VARCHAR(20),
city VARCHAR(20),
state VARCHAR(20),
PRIMARY KEY (id)
);

CREATE TABLE schedule(
name varchar(30),
train int,
origin int,
destination int,
stopsat int,
departure TIME,
arrival TIME,
traveltime int,
fare FLOAT
PRIMARY KEY (name),
FOREIGN KEY (train) REFERENCES train,
FOREIGN KEY (origin) REFERENCES station,
FOREIGN KEY (destination) REFERENCES station,
FOREIGN KEY (stopsat) REFERENCES stops
);

CREATE TABLE stops(
schedule varchar(30),
stop int,
PRIMARY KEY (schedule, station),
FOREIGN KEY (schedule) REFERENCES schedule,
FOREIGN KEY (stop) REFERENCES stop
);

CREATE TABLE stop(
id int,
time TIME,
PRIMARY KEY (id)
);

CREATE TABLE reservation(
number int,
date DATE,
passenger varchar(20),
fare float,
origin int,
destination int,
discount float,
roundtrip boolean,
PRIMARY KEY (number),
FOREIGN KEY (passenger) REFERENCES customer,
FOREIGN KEY (origin) REFERENCES station,
FOREIGN KEY (destination) REFERENCES station
);

CREATE TABLE user(
firstname varchar(20),
lastname varchar(20),
username varchar(20),
password varchar(20),
PRIMARY KEY (username)
);

CREATE TABLE customer(
email varchar(20),
username varchar(20),
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES user
);

CREATE TABLE reserves(
customer varchar(20),
reservation int,
PRIMARY KEY (customer, reservation),
FOREIGN KEY (customer) REFERENCES customer,
FOREIGN KEY (reservation) REFERENCES reservation
);


CREATE TABLE employee(
ssn varchar(12),
username varchar(20),
rank varchar(20), --used to denote if an employee is a manager or not
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES user
);

CREATE TABLE post(
id int,
asker varchar(20),
response int,
question varchar(1000),
PRIMARY KEY (id),
FOREIGN KEY (asker) REFERENCES customer
)

CREATE TABLE response(
id int,
responder varchar(20),
response varchar(1000),
question int,
PRIMARY KEY (id),
FOREIGN KEY (responder) REFERENCES employee,
FOREIGN KEY (question) REFERENCES post
)