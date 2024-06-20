/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      library database.dm1
 *
 * Date Created : Thursday, June 06, 2024 11:08:59
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
    language1         string,
    pages             int,
    published_date    date,
    name              string,
    checkout          array<struct<
        date              date,
        duration          int,
        patron_number     string,
        library_number    string
    >>   NOT NULL,
    chapter           array<struct<
        Chapter_Nmber    string,
        heading          string,
        page_count       int,
        section          array<struct<
            section_number        string,
            numberofparagraphs    int,
            wordcount             int
        >>
    >>   NOT NULL,
    computed          string GENERATED ALWAYS AS (language1),
    CONSTRAINT PK3 PRIMARY KEY (title, author) 
)
;

/* 
 * TABLE: library 
 */

CREATE TABLE library
(
    library_number    string        NOT NULL,
    library_name      string       DEFAULT 'testlibraryname',
    address           array<struct<
        address_id    string,
        street        string,
        city          string,
        state         string,
        zip           string
    >>   NOT NULL,
    identity          bigint      GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) DEFAULT 123456L NOT NULL,
    map               array<map<string, binary>>,
    interval          array<interval day to second>,
    struct            array<struct<
        map         map<int, string>,
        interval    interval year to month
    >>   NOT NULL,
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
    address          array<struct<
        address_id    string,
        street        string,
        city          string,
        state         string,
        zip           string
    >>   NOT NULL,
    CONSTRAINT PK4Patron PRIMARY KEY (patron_number) NOT ENFORCED DEFERRABLE INITIALLY DEFERRED NORELY 
)
PARTITIONED BY (name)
;

/* 
 * TABLE: publisher 
 */

CREATE TABLE publisher
(
    name        string MASK ManagedSchema.square3   NOT NULL,
    location    string,
    founded     date MASK ManagedSchema.square3,
    address     array<struct<
        address_id    string,
        street        string,
        city          string,
        state         string,
        zip           string
    >>   NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (name) 
)
USING DELTA
CLUSTER BY (name ,location)
;

/* 
 * INDEX: Index1 
 */

CREATE BLOOMFILTER INDEX 
ON TABLE book 
FOR COLUMNS (title)
OPTIONS (fpp = 0.1, numItems = 1000000, maxExpectedFpp = 1)
;
/* 
 * INDEX: Index11 
 */

CREATE BLOOMFILTER INDEX 
ON TABLE library 
FOR COLUMNS (library_name)
OPTIONS (fpp = 0.1, numItems = 1000000, maxExpectedFpp = 1)
;
