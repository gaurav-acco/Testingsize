
-- Drop Constraint, Rename and Create Table SQL

DROP TABLE "public"."ChildDomain"

;
DROP TABLE "public"."Entity1"

;
DROP TABLE "public"."ParentDomain"

;
DROP TABLE "public".test2

;
CREATE TABLE "public".address
(
    "address id" character(10)  NOT NULL,
    street       varchar,
    city         varchar,
    "state"      varchar,
    zip          varchar,
    CONSTRAINT "PK1" PRIMARY KEY ("address id")
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".book
(
    title          varchar(300)  NOT NULL,
    author         varchar(200)  NOT NULL,
    available      boolean,
    "language"     varchar,
    pages          integer,
    published_date date,
    "name"         varchar,
    CONSTRAINT "PK3" PRIMARY KEY (title, author)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".chapter
(
    "Chapter Number" character(10)   NOT NULL,
    heading          character(100)  NOT NULL,
    "page count"     integer,
    title            varchar(300)    NOT NULL,
    author           varchar(200)    NOT NULL,
    CONSTRAINT "PK37" PRIMARY KEY ("Chapter Number", title, author)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".checkout
(
    "date"         date,
    title          varchar(300)   NOT NULL,
    author         varchar(200)   NOT NULL,
    duration       integer,
    patron_number  character(10)  NOT NULL,
    library_number character(10)  NOT NULL,
    CONSTRAINT "PK2" PRIMARY KEY (title, author, patron_number)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public"."library"
(
    library_number character(10)  NOT NULL,
    "library name" varchar(300),
    "address id"   character(10)  NOT NULL,
    CONSTRAINT "PK36" PRIMARY KEY (library_number)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".patron
(
    patron_number character(10)  NOT NULL,
    "name"        varchar,
    "address id"  character(10)  NOT NULL,
    CONSTRAINT "PK4" PRIMARY KEY (patron_number)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".publisher
(
    "name"       varchar        NOT NULL,
    founded      date,
    "location"   varchar,
    "address id" character(10)  NOT NULL,
    CONSTRAINT "PK5" PRIMARY KEY ("name")
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public"."section"
(
    section_number         character(10)  NOT NULL,
    "number of paragraphs" integer,
    "word count"           integer,
    "Chapter Number"       character(10)  NOT NULL,
    title                  varchar(300)   NOT NULL,
    author                 varchar(200)   NOT NULL,
    CONSTRAINT "PK38" PRIMARY KEY (section_number, "Chapter Number", title, author)
)
WITH (
    OIDS=false
)

;

-- Add Referencing Foreign Keys SQL


ALTER TABLE "public"."library"
    ADD 
    FOREIGN KEY ("address id")
    REFERENCES "public".address ("address id")
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".patron
    ADD 
    FOREIGN KEY ("address id")
    REFERENCES "public".address ("address id")
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".publisher
    ADD 
    FOREIGN KEY ("address id")
    REFERENCES "public".address ("address id")
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".chapter
    ADD 
    FOREIGN KEY (title,author)
    REFERENCES "public".book (title,author)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".checkout
    ADD 
    FOREIGN KEY (title,author)
    REFERENCES "public".book (title,author)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".book
    ADD 
    FOREIGN KEY ("name")
    REFERENCES "public".publisher ("name")
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public"."section"
    ADD 
    FOREIGN KEY ("Chapter Number",title,author)
    REFERENCES "public".chapter ("Chapter Number",title,author)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".checkout
    ADD 
    FOREIGN KEY (patron_number)
    REFERENCES "public".patron (patron_number)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".checkout
    ADD 
    FOREIGN KEY (library_number)
    REFERENCES "public"."library" (library_number)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;
