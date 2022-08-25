-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.
TRUNCATE TABLE artists RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO albums (title, release_year, artist_id) VALUES ('Born this way', 2012, 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Best I ever had', 2009, 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Evergreen', 2019, 3);
INSERT INTO artists (name, genre) VALUES('Pixies', 'Rock');
INSERT INTO artists (name, genre) VALUES('The 1975', 'Rock');
INSERT INTO artists (name, genre) VALUES('Taylor Swift', 'Pop');


-- Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.