--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Branch_test.DM1
--
-- Date Created : Wednesday, June 19, 2024 18:07:20
-- Target DBMS : PostgreSQL 10.x-12.x
--

CREATE TABLE "ChildDomain"(
    primarycol    character(10)    NOT NULL,
    domaincol     integer          DEFAULT 100 NOT NULL,
    CHECK (domaincol =10),
    CONSTRAINT "PK19" PRIMARY KEY (primarycol, domaincol)
)
;



CREATE TABLE "Entity1"(
    id      character(10)    NOT NULL,
    name    character(10),
    CONSTRAINT "PK1" PRIMARY KEY (id)
)
;



CREATE TABLE "ParentDomain"(
    domaincol     integer        DEFAULT 100 NOT NULL,
    colvarchar    varchar(10),
    CHECK (domaincol =10),
    CONSTRAINT "PK18" PRIMARY KEY (domaincol)
)
;



CREATE TABLE test2(
    p2            character(10)    DEFAULT 'p2value' NOT NULL,
    col3char      character(10)    DEFAULT 'col3value',
    col4char      character(10)    DEFAULT 'col4value',
    p1identity    integer          DEFAULT 111 NOT NULL,
    CONSTRAINT constrain2 CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT p2c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT col3c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT col4c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT p1c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT "PK2" PRIMARY KEY (p2)
)
;



ALTER TABLE "ChildDomain" ADD CONSTRAINT "RefParentDomain1" 
    FOREIGN KEY (domaincol)
    REFERENCES "ParentDomain"(domaincol)
;


ALTER TABLE test2 ADD CONSTRAINT test1test2 
    FOREIGN KEY (p1identity)
    REFERENCES test1(p1identity)
;


