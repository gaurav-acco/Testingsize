--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Branch_test.DM1
--
-- Date Created : Wednesday, June 19, 2024 18:06:11
-- Target DBMS : PostgreSQL 10.x-12.x
--

CREATE TABLE "Entity1"(
    id      character(10)    NOT NULL,
    name    character(10),
    CONSTRAINT "PK1" PRIMARY KEY (id)
)
;



CREATE TABLE test1(
    p1identity    integer          GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    col1char      character(10)    DEFAULT 'col1value' NOT NULL,
    col2char      character(10)    DEFAULT 'col2value',
    computed      float4,
    CONSTRAINT constr1 CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT col1constraint CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT col2constraint CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT testconstraint CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT "PK1_1" PRIMARY KEY (p1identity)
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



ALTER TABLE test2 ADD CONSTRAINT test1test2 
    FOREIGN KEY (p1identity)
    REFERENCES test1(p1identity)
;


