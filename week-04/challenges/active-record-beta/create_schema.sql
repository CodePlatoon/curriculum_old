-- Schema
DROP TABLE IF EXISTS players;
CREATE TABLE players (
  id           serial PRIMARY KEY,
  first_name   varchar(255) NOT NULL,
  last_name    varchar(255) NOT NULL,
  position     varchar(255) NOT NULL,
  team_id      integer,
  birthdate    date
);

DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
  id           serial PRIMARY KEY,
  name         varchar(255) NOT NULL
);
