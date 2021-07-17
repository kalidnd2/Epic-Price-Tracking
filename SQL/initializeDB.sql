
CREATE DATABASE epic_price_tracking;

USE epic_price_tracking;

Create TABLE tb_user(
    id INT AUTO_INCREMENT,
    username VARCHAR(15) NOT NULL,
    password VARCHAR(215) NOT NULL,
	email VARCHAR(50) NOT NULL,

    PRIMARY KEY (id)
);

Create TABLE phone_number(
    userId INT,
    phoneNo INT(12),
    PRIMARY KEY (userId, phoneNo),
    FOREIGN KEY (userId) REFERENCES tb_user(id)
);

Create Table game(
    id INT AUTO_INCREMENT,
    name VARCHAR(215) NOT NULL,
    thumbnail VARCHAR(512),
    price INT,

    PRIMARY KEY (id)
);

CREATE TABLE price_record(
    id INT AUTO_INCREMENT,
    gameId INT,
    timestamp DATETIME NOT NULL,
    currentPrice BIGINT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (gameId) REFERENCES game(id)
);


CREATE TABLE genre(
    id INT AUTO_INCREMENT,
    genreName VARCHAR(215) NOT NULL,
    parentGenre INT,

    PRIMARY KEY (id),
    FOREIGN KEY (parentGenre) REFERENCES Genre (id)
);

CREATE TABLE publisher(
    id INT AUTO_INCREMENT,
    publisherName VARCHAR(215) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_genre(
    gameId INT,
    genreId INT,
    PRIMARY KEY (gameId, genreId),
    FOREIGN KEY (gameId) REFERENCES game(id),
    FOREIGN KEY (genreId) REFERENCES genre(id)
);

CREATE TABLE user_interested_game(
    gameId INT,
    userId INT,
    PRIMARY KEY (gameId, userId),
    FOREIGN KEY (gameId) REFERENCES game(id),
    FOREIGN KEY (userId) REFERENCES tb_user(id)
);

CREATE TABLE game_publisher(
    gameId INT,
    publisherId INT,
    PRIMARY KEY (gameId, publisherId),
    FOREIGN KEY (gameId) REFERENCES game(id),
    FOREIGN KEY (publisherId) REFERENCES publisher(id)
);

CREATE TABLE alert_log(
    id INT AUTO_INCREMENT,
    userId INT,
    gameId INT,
    timestamp DATETIME NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (userId) REFERENCES tb_user(id),
    FOREIGN KEY (gameId) REFERENCES game(id)
)


