CREATE TABLE event(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    eventName VARCHAR(50) NOT NULL,
    eventAuthor VARCHAR(50) NOT NULL,
    eventDescription VARCHAR(50) NOT NULL
);

CREATE TABLE date_by_event(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    eventId INT NOT NULL,
    eventDate DATE NOT NULL
);

CREATE TABLE attendee_by_date(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    dateId INT NOT NULL,
    attendee VARCHAR(50) NOT NULL,
    available TINYINT(1) NOT NULL
);

INSERT INTO event (eventName, eventAuthor, eventDescription)
VALUES ("Mon anniversaire", "Esteban", "Petit bowling sympathique au Crosly");

INSERT INTO date_by_event (eventId, eventDate)
VALUES (1, "2021-12-17"), (1, "2021-12-20"), (1, "2021-12-22");

INSERT INTO attendee_by_date (dateId, attendee, available)
VALUES (1, "Natasha St-pierre", 1),
       (1, "Martin Garrix", 0),
       (1, "Will Smith", 1),
       (1, "Kennedy Machin", 0),
       (2, "Natasha St-pierre", 1),
       (2, "Martin Garrix", 1),
       (2, "Will Smith", 1),
       (2, "Kennedy Machin", 0),
       (3, "Natasha St-pierre", 1),
       (3, "Martin Garrix", 0),
       (3, "Will Smith", 0),
       (3, "Kennedy Machin", 1);
       