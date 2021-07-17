
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
    user_id INT,
    phoneNo INT(12),
    PRIMARY KEY (user_id, phoneNo),
    FOREIGN KEY (user_id) REFERENCES tb_user(id)
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
    game_id INT,
    timestamp DATETIME NOT NULL,
    current_price BIGINT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (game_id) REFERENCES game(id)
);


CREATE TABLE genre(
    id INT AUTO_INCREMENT,
    genre_name VARCHAR(215) NOT NULL,
    parent_genre INT,

    PRIMARY KEY (id),
    FOREIGN KEY (parent_genre) REFERENCES Genre (id)
);

CREATE TABLE publisher(
    id INT AUTO_INCREMENT,
    publisher_name VARCHAR(215) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_genre(
    game_id INT,
    genre_id INT,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES game(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE user_interested_game(
    game_id INT,
    user_id INT,
    PRIMARY KEY (game_id, user_id),
    FOREIGN KEY (game_id) REFERENCES game(id),
    FOREIGN KEY (user_id) REFERENCES tb_user(id)
);

CREATE TABLE game_publisher(
    game_id INT,
    publisher_id INT,
    PRIMARY KEY (game_id, publisher_id),
    FOREIGN KEY (game_id) REFERENCES game(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE alert_log(
    id INT AUTO_INCREMENT,
    user_id INT,
    game_id INT,
    timestamp DATETIME NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES tb_user(id),
    FOREIGN KEY (game_id) REFERENCES game(id)
)


