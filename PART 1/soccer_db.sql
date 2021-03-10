DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db

CREATE TABLE  teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL UNIQUE
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    winner INTEGER REFERENCES teams CHECK (winner = team1_id OR winner = team2_id)
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    NAME TEXT NOT NULL
);

CREATE TABLE referees_games
(
    id SERIAL PRIMARY KEY,
    ref_id INTEGER REFERENCES referees,
    game_id INTEGER REFERENCES games
);