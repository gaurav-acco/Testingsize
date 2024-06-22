--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      DATA MODEL
--
-- Date Created : Saturday, June 22, 2024 16:31:52
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: "Entity2" 
--

CREATE TABLE "Entity2"(
    ss     character(10)    NOT NULL,
    ddd    character(10),
    aa     character(10)    NOT NULL,
    PRIMARY KEY (ss)
)
;



-- 
-- TABLE: "Entity3" 
--

CREATE TABLE "Entity3"(
    e     character(10),
    f     character(10),
    ss    character(10)
)
;



-- 
-- TABLE: "Entity4" 
--

CREATE TABLE "Entity4"(
    ss    character(10)    NOT NULL,
    w     character(10),
    e     character(10),
    PRIMARY KEY (ss)
)
;



-- 
-- TABLE: "Entity2" 
--

ALTER TABLE "Entity2" ADD CONSTRAINT "RefEntity11" 
    FOREIGN KEY (aa)
    REFERENCES "Entity1"(aa)
;


-- 
-- TABLE: "Entity3" 
--

ALTER TABLE "Entity3" ADD CONSTRAINT "RefEntity22" 
    FOREIGN KEY (ss)
    REFERENCES "Entity2"(ss)
;


-- 
-- TABLE: "Entity4" 
--

ALTER TABLE "Entity4" ADD CONSTRAINT "RefEntity23" 
    FOREIGN KEY (ss)
    REFERENCES "Entity2"(ss)
;


