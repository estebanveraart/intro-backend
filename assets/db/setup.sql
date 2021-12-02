CREATE TABLE events(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    event_name VARCHAR(255) NOT NULL,
    event_author VARCHAR(255) NOT NULL,
    event_description VARCHAR(255) NOT NULL
    -- creation_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- last_modification DATE,
    -- num_modification INTEGER NOT NULL DEFAULT (0)
);

CREATE TABLE dates_by_event(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    event_id INT NOT NULL,
    event_date DATE NOT NULL
);

CREATE TABLE attendees_by_date(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    date_id INT NOT NULL,
    attendee VARCHAR(255) NOT NULL,
    available TINYINT(1) NOT NULL
);

INSERT INTO events (event_name, event_author, event_description)
VALUES ("Mon anniversaire", "Esteban", "Petit bowling sympathique au Crosly");

INSERT INTO dates_by_event (event_id, event_date)
VALUES (1, "2021-12-17"), (1, "2021-12-20"), (1, "2021-12-22");

INSERT INTO attendees_by_date (date_id, attendee, available)
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
       