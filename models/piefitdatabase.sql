CREATE USER IF NOT exists piefituser@localhost IDENTIFIED BY 'test';

drop database if exists piefitdatabase;
create database piefitdatabase;
use piefitdatabase;

GRANT ALL privileges ON piefitdatabase.* TO piefituser@localhost;

CREATE TABLE theme
(
 theme_id int  AUTO_INCREMENT NOT NULL ,
 name     varchar(45) NOT NULL ,

PRIMARY KEY (theme_id)
);

CREATE TABLE user
(
 email       varchar(50) NOT NULL ,
 firstname   varchar(45) NOT NULL ,
 lastname    varchar(45) NOT NULL ,
 phonenumber int NOT NULL ,
 password    blob NOT NULL ,
 isadmin     boolean NOT NULL default 0,
 theme_id    int  NOT NULL default 1,

PRIMARY KEY (email),
FOREIGN KEY (theme_id) REFERENCES theme (theme_id)
);

CREATE TABLE category
(
 category_id int  AUTO_INCREMENT NOT NULL ,
 name        varchar(45) NOT NULL ,

PRIMARY KEY (category_id)
);

CREATE TABLE card
(
 card_id     int AUTO_INCREMENT  NOT NULL ,
 name        varchar(45) NOT NULL unique,
 difficulty  enum('1','2','3','4','5') NOT NULL ,
 video_url   varchar(100) NOT NULL ,
 type        varchar(45) NOT NULL ,
 category_id int  NOT NULL ,

PRIMARY KEY (card_id),
FOREIGN KEY (category_id) REFERENCES category (category_id)
);

CREATE TABLE statistic
(
 statistic_id   int AUTO_INCREMENT  NOT NULL ,
 date_completed date NOT NULL ,
 time_used      time NOT NULL ,
 card_id        int  NOT NULL ,

PRIMARY KEY (statistic_id),
FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE CASCADE
);

CREATE TABLE user_statistic
(
 statistic_id int NOT NULL ,
 email        varchar(50) NOT NULL ,

PRIMARY KEY (statistic_id, email),
FOREIGN KEY (statistic_id) REFERENCES statistic (statistic_id),
FOREIGN KEY (email) REFERENCES user (email) ON DELETE CASCADE
);

CREATE TABLE boxcollection
(
 boxcollection_id int AUTO_INCREMENT  NOT NULL ,
 name             varchar(45) NOT NULL ,
 description      varchar(800) NOT NULL ,
 description_long varchar(2000) NOT NULL,
 releasedate      date NOT NULL ,
 price            decimal(6,2) NOT NULL,

PRIMARY KEY (boxcollection_id)
);

CREATE TABLE cardcollection
(
 cardcollection_id int AUTO_INCREMENT  NOT NULL ,
 name              varchar(45) NOT NULL ,
 description       varchar(800) NOT NULL ,
 releasedate       date NOT NULL ,
 price            decimal(6,2) NOT NULL,
 boxcollection_id  int  NOT NULL ,

PRIMARY KEY (cardcollection_id),
FOREIGN KEY (boxcollection_id) REFERENCES boxcollection (boxcollection_id)
);

CREATE TABLE cardcollection_card
(
 cardcollection_id int NOT NULL ,
 card_id           int NOT NULL ,

PRIMARY KEY (cardcollection_id, card_id),
FOREIGN KEY (cardcollection_id) REFERENCES cardcollection (cardcollection_id),
FOREIGN KEY (card_id) REFERENCES card (card_id)
);

CREATE TABLE user_cardcollection
(
 email             varchar(50) NOT NULL ,
 cardcollection_id int  NOT NULL ,

PRIMARY KEY (email, cardcollection_id),
FOREIGN KEY (email) REFERENCES user (email),
FOREIGN KEY (cardcollection_id) REFERENCES cardcollection (cardcollection_id)
);

CREATE TABLE exercise
(
 exercise_id int AUTO_INCREMENT  NOT NULL ,
 name        varchar(45) NOT NULL ,

PRIMARY KEY (exercise_id)
);

CREATE TABLE benchmark
(
 benchmark_id int AUTO_INCREMENT  NOT NULL ,
 level        enum('beginner', 'intermediate', 'advanced', 'elite') NOT NULL ,

PRIMARY KEY (benchmark_id)
);


CREATE TABLE workandrest
(
 workandrest_id int AUTO_INCREMENT  NOT NULL ,
 timeactive     time NOT NULL ,
 timerest       time NOT NULL ,
 rounds         int NOT NULL ,
 card_id        int  NOT NULL ,

PRIMARY KEY (workandrest_id),
FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE CASCADE
);

CREATE TABLE workandrest_exercise
(
 workandrest_id int  NOT NULL ,
 exercise_id    int  NOT NULL ,

PRIMARY KEY (workandrest_id, exercise_id),
FOREIGN KEY (workandrest_id) REFERENCES workandrest (workandrest_id) ON DELETE CASCADE,
FOREIGN KEY (exercise_id) REFERENCES exercise (exercise_id)
);

CREATE TABLE repsandrounds
(
 repsandrounds_id int AUTO_INCREMENT  NOT NULL ,
 rounds           int NOT NULL ,
 card_id          int  NOT NULL ,

PRIMARY KEY (repsandrounds_id),
FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE CASCADE
);

CREATE TABLE repsandrounds_exercise
(
 repsandrounds_id int  NOT NULL ,
 exercise_id      int  NOT NULL ,
 reps             int NOT NULL ,
 ordernumber      int NOT NULL ,

PRIMARY KEY (repsandrounds_id, exercise_id),
FOREIGN KEY (repsandrounds_id) REFERENCES repsandrounds (repsandrounds_id) ON DELETE CASCADE,
FOREIGN KEY (exercise_id) REFERENCES exercise (exercise_id)
);

CREATE TABLE repsandrounds_benchmark
(
 repsandrounds_id int  NOT NULL ,
 benchmark_id     int  NOT NULL ,
 time             time NOT NULL ,

PRIMARY KEY (repsandrounds_id, benchmark_id),
FOREIGN KEY (repsandrounds_id) REFERENCES repsandrounds (repsandrounds_id) ON DELETE CASCADE,
FOREIGN KEY (benchmark_id) REFERENCES benchmark (benchmark_id)
);

CREATE TABLE amrap
(
 amrap_id int AUTO_INCREMENT  NOT NULL ,
 time     time NOT NULL ,
 card_id  int  NOT NULL ,

PRIMARY KEY (amrap_id),
FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE CASCADE
);

CREATE TABLE amrap_exercise
(
 amrap_id    int  NOT NULL ,
 exercise_id int  NOT NULL ,
 reps        int NOT NULL ,

PRIMARY KEY (amrap_id, exercise_id),
FOREIGN KEY (amrap_id) REFERENCES amrap (amrap_id) ON DELETE CASCADE,
FOREIGN KEY (exercise_id) REFERENCES exercise (exercise_id)
);

CREATE TABLE amrap_benchmark
(
 amrap_id     int  NOT NULL ,
 benchmark_id int  NOT NULL ,
 rounds       int NOT NULL ,

PRIMARY KEY (amrap_id, benchmark_id),
FOREIGN KEY (amrap_id) REFERENCES amrap (amrap_id) ON DELETE CASCADE,
FOREIGN KEY (benchmark_id) REFERENCES benchmark (benchmark_id)
);
SHOW TABLES;
SHOW COLUMNS FROM theme;
SHOW COLUMNS FROM user;
SHOW COLUMNS FROM category;
SHOW COLUMNS FROM card;
SHOW COLUMNS FROM statistic;
SHOW COLUMNS FROM user_statistic;
SHOW COLUMNS FROM boxcollection;
SHOW COLUMNS FROM cardcollection;
SHOW COLUMNS FROM cardcollection_card;
SHOW COLUMNS FROM user_cardcollection;
SHOW COLUMNS FROM exercise;
SHOW COLUMNS FROM benchmark;
SHOW COLUMNS FROM workandrest;
SHOW COLUMNS FROM workandrest_exercise;
SHOW COLUMNS FROM repsandrounds;
SHOW COLUMNS FROM repsandrounds_exercise;
SHOW COLUMNS FROM repsandrounds_benchmark;
SHOW COLUMNS FROM amrap;
SHOW COLUMNS FROM amrap_exercise;
SHOW COLUMNS FROM amrap_benchmark;

