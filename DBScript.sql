create table users (
 user_id	int(11) NOT NULL AUTO_INCREMENT,
 username	varchar(45) NOT NULL,
 password	varchar(45) NOT NULL,
 fullname	varchar(45) NOT NULL,
 email	varchar(45) NOT NULL,
 PRIMARY KEY (user_id)
);

create table trains (
 train_id	int(11) NOT NULL AUTO_INCREMENT,
 trainname	varchar(45) NOT NULL,
 `from`	varchar(45) NOT NULL,
 `to`	varchar(45) NOT NULL,
 `type`	varchar(45) NOT NULL,
 PRIMARY KEY (train_id)
);

create table stations (
 station_id	int(11) NOT NULL AUTO_INCREMENT,
 stationname	varchar(45) NOT NULL,
 aaa	varchar(45) NOT NULL,
 bbb	varchar(45) NOT NULL,
 ccc	varchar(45) NOT NULL,
 PRIMARY KEY (station_id)
);

create table books (
 book_id	int(11) NOT NULL AUTO_INCREMENT,
 username	varchar(45) NOT NULL,
 train	varchar(45) NOT NULL,
 station	varchar(45) NOT NULL,
 `time`	varchar(45) NOT NULL,
 PRIMARY KEY (book_id)
);


