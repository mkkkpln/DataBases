insert into s368346.testbd(id,value) values (1,'test');
select * from s368346.testbd;

CREATE TABLE people
(
    id serial PRIMARY KEY,
    name varchar(30) NOT NULL,
    surname varchar(30) NOT NULL,
    skin_color varchar(30) NOT NULL,
    meeting_id int NOT NULL REFERENCES meeting(id) ON DELETE CASCADE
);
CREATE TABLE dino
(
    id serial PRIMARY KEY,
    name varchar(30) NOT NULL,
    existence_time varchar(30) NOT NULL,
    feeding_type varchar(30) NOT NULL,
    meeting_id int REFERENCES meeting(id) ON DELETE CASCADE,
    dino_type_id int REFERENCES dino_type(id) ON DELETE CASCADE
);
CREATE TABLE car
(
    id serial PRIMARY KEY,
    brand varchar(30) NOT NULL,
    model varchar(30) NOT NULL,
    year date NOT NULL,
    meeting_id int REFERENCES meeting(id) ON DELETE CASCADE NOT NULL,
    touch_id int REFERENCES touch(id) ON DELETE CASCADE
);
CREATE TABLE dino_type
(
    id serial PRIMARY KEY,
    name varchar(30) NOT NULL,
    size int NOT NULL,
    claws_num int CHECK ( claws_num > 0 )
);
CREATE TABLE meeting
(
    id serial PRIMARY KEY,
    location_name varchar(30) NOT NULL,
    coordinates varchar(30) NOT NULL
);
CREATE TABLE touch
(
    id serial PRIMARY KEY,
    intensity float NOT NULL,
    duration int NOT NULL
);
CREATE TABLE mouth
(
    id serial PRIMARY KEY,
    tongue_id int REFERENCES tongue(id) ON DELETE CASCADE,
    teeth_id int REFERENCES teeth(id) ON DELETE CASCADE
);
CREATE TABLE teeth
(
    id serial PRIMARY KEY,
    integrity boolean
);
CREATE TABLE tongue
(
    id serial PRIMARY KEY,
    wetness float NOT NULL,
    touch_id int REFERENCES touch(id) ON DELETE CASCADE
);
CREATE TABLE head
(
    id serial PRIMARY KEY,
    mouth_id int REFERENCES mouth(id) ON DELETE CASCADE
);
