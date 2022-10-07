-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here.

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.
TRUNCATE TABLE artists RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO artists (name, genre) VALUES ('Harry Styles', 'Pop');
INSERT INTO artists (name, genre) VALUES ('Taylor Swift', 'Pop');
INSERT INTO artists (name, genre) VALUES ('Billie Eilish', 'Pop');
INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Harrys House', '2022', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Fine Line', '2019', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Red', '2012', '2');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Happier Than Ever', '2021', '3');
