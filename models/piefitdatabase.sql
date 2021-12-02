drop database if exists piefitdatabase;
create database piefitdatabase;
use piefitdatabase;

CREATE TABLE theme
(
 name     varchar(45) NOT NULL ,
 theme_id int  AUTO_INCREMENT NOT NULL ,

PRIMARY KEY (theme_id)
);

CREATE TABLE user
(
 email       varchar(50) NOT NULL ,
 firstname   varchar(45) NOT NULL ,
 lastname    varchar(45) NOT NULL ,
 phonenumber int NOT NULL ,
 password    varchar(45) NOT NULL ,
 isadmin     boolean NOT NULL ,
 theme_id    int  NOT NULL ,

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
 statistic_id int AUTO_INCREMENT  NOT NULL ,
 email        varchar(50) NOT NULL ,

PRIMARY KEY (statistic_id, email),
FOREIGN KEY (statistic_id) REFERENCES statistic (statistic_id),
FOREIGN KEY (email) REFERENCES user (email) ON DELETE CASCADE
);

CREATE TABLE boxcollection
(
 boxcollection_id int AUTO_INCREMENT  NOT NULL ,
 name             varchar(45) NOT NULL ,
 description      varchar(300) NOT NULL ,
 releasedate      date NOT NULL ,

PRIMARY KEY (boxcollection_id)
);

CREATE TABLE cardcollection
(
 cardcollection_id int AUTO_INCREMENT  NOT NULL ,
 name              varchar(45) NOT NULL ,
 description       varchar(300) NOT NULL ,
 releasedate       date NOT NULL ,
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
 level        enum('beginner, intermediate, advanced, elite') NOT NULL ,

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
 serialno         int AUTO_INCREMENT  NOT NULL ,
 workandrest_id int  NOT NULL ,
 exercise_id    int  NOT NULL ,

PRIMARY KEY (serialno, workandrest_id, exercise_id),
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
 serialno           int  NOT NULL ,
 reps             int NOT NULL ,
 repsandrounds_id int  NOT NULL ,
 exercise_id      int  NOT NULL ,

PRIMARY KEY (serialno, repsandrounds_id, exercise_id),
FOREIGN KEY (repsandrounds_id) REFERENCES repsandrounds (repsandrounds_id) ON DELETE CASCADE,
FOREIGN KEY (exercise_id) REFERENCES exercise (exercise_id)
);

CREATE TABLE repsandrounds_benchmark
(
 time             time NOT NULL ,
 repsandrounds_id int  NOT NULL ,
 benchmark_id     int  NOT NULL ,

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
 reps        int NOT NULL ,
 serialno    int AUTO_INCREMENT  NOT NULL ,
 amrap_id    int  NOT NULL ,
 exercise_id int  NOT NULL ,

PRIMARY KEY (serialno, amrap_id, exercise_id),
FOREIGN KEY (amrap_id) REFERENCES amrap (amrap_id) ON DELETE CASCADE,
FOREIGN KEY (exercise_id) REFERENCES exercise (exercise_id)
);

CREATE TABLE amrap_benchmark
(
 rounds       int NOT NULL ,
 amrap_id     int  NOT NULL ,
 benchmark_id int  NOT NULL ,

PRIMARY KEY (amrap_id, benchmark_id),
FOREIGN KEY (amrap_id) REFERENCES amrap (amrap_id) ON DELETE CASCADE,
FOREIGN KEY (benchmark_id) REFERENCES benchmark (benchmark_id)
);