DROP DATABASE IF EXISTS craiglist_db;

CREATE DATABASE craiglist_db;

\c craiglist_db

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state TEXT,
    Country TEXT NOT NULL
);
CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password INTEGER,
    prefered_region_id REFERENCES regions
);
CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    text TEXT NOT NULL,
    user_id REFERENCES users,
    region_id REFERENCES regions,
    user_id REFERENCES users,
    category_id REFERENCES categories
)