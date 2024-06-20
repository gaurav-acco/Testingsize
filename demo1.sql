/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      library database.dm1
 *
 * Date Created : Thursday, June 06, 2024 17:30:11
 * Target DBMS : Databricks
 */

/* 
 * TABLE: book 
 */

CREATE TABLE book
(
    title             string       NOT NULL,
    author            string       NOT NULL,
    available         boolean,
    language          string,
    pages             int,
    published_date    date,
    name              string,
    chapter           array<struct<
        `Chapter Number`  string      NOT NULL,
        heading           string      NOT NULL,
        `page count`      int,
        title             string      NOT NULL,
        author            string      NOT NULL,
        section           array<struct<
            section_number          string      NOT NULL,
            `number of paragraphs`  int,
            `word count`            int,
            `Chapter Number`        string      NOT NULL,
            title                   string      NOT NULL,
            author                  string      NOT NULL
        >>
    >>,
    checkout          array<struct<
        date              date,
        title             string      NOT NULL,
        author            string      NOT NULL,
        duration          int,
        patron_number     string      NOT NULL,
        library_number    string      NOT NULL
    >>,
    CONSTRAINT PK3 PRIMARY KEY (title, author) 
)
;

/* 
 * TABLE: library 
 */

CREATE TABLE library
(
    library_number    string      NOT NULL,
    `library name`    string,
    `address id`      string      NOT NULL,
    address           array<struct<
        `address id`  string      NOT NULL,
        street        string,
        city          string,
        state         string,
        zip           string
    >>,
    CONSTRAINT PK36 PRIMARY KEY (library_number) 
)
;

/* 
 * TABLE: patron 
 */

CREATE TABLE patron
(
    patron_number    string      NOT NULL,
    name             string,
    `address id`     string      NOT NULL,
    address          array<struct<
        `address id`  string      NOT NULL,
        street        string,
        city          string,
        state         string,
        zip           string
    >>,
    CONSTRAINT PK4 PRIMARY KEY (patron_number) 
)
;

/* 
 * TABLE: publisher 
 */

CREATE TABLE publisher
(
    name          string      NOT NULL,
    founded       date,
    location      string,
    `address id`  string      NOT NULL,
    address       array<struct<
        `address id`  string      NOT NULL,
        street        string,
        city          string,
        state         string,
        zip           string
    >>,
    CONSTRAINT PK5 PRIMARY KEY (name) 
)
;

