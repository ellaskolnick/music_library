DROP TABLE IF EXISTS "public"."movies";

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  genre text,
  release_year int
);
