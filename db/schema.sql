CREATE DATABASE catalog_of_my_things;
CREATE TABLE item (
    id SERIAL PRIMARY KEY NOT NULL,
    publish_date DATE,
    archived BOOLEAN,
    genre  INTEGER REFERENCES genre(id),
    author INTEGER REFERENCES author(id),
    label INTEGER REFERENCES label(id)
);

CREATE TABLE label (
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL
);
CREATE TABLE book (
    id SERIAL PRIMARY KEY NOT NULL,
    publish_date DATE,
    archived BOOLEAN,
    publisher VARCHAR(50) NOT NULL,
    cover_state VARCHAR(50) NOT NULL,
    genre  INTEGER REFERENCES genre(id),
    author INTEGER REFERENCES author(id),
    label INTEGER REFERENCES label(id)
);