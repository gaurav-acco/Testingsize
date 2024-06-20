--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      testsample.DM1
--
-- Date Created : Wednesday, June 19, 2024 19:05:45
-- Target DBMS : PostgreSQL 10.x-12.x
--

CREATE TABLE public.book(
    l1         integer          DEFAULT 100 NOT NULL,
    subject    varchar(10)      NOT NULL,
    b1int      integer          DEFAULT 100,
    name       character(10),
    CHECK (l1 =10),
    CONSTRAINT b1 CHECK (b1int > 10 AND b1int < 50),
    CHECK (b1int =10),
    CONSTRAINT "PK4" PRIMARY KEY (l1, subject)
)
;



CREATE TABLE public.car(
    id         character(10)    NOT NULL,
    model      character(10),
    carname    character(10),
    CONSTRAINT "PK7" PRIMARY KEY (id)
)
;



CREATE TABLE public."ChildDomain"(
    primarycol    character(10)    NOT NULL,
    domaincol     integer          DEFAULT 100 NOT NULL,
    CHECK (domaincol =10),
    CONSTRAINT "PK19" PRIMARY KEY (primarycol, domaincol)
)
;



CREATE TABLE public.library(
    l1            integer           DEFAULT 100 NOT NULL,
    roomnumber    numeric(10, 0),
    name          character(10)     DEFAULT 'hello',
    CONSTRAINT l1 CHECK (l1 > 10 AND l1 < 50),
    CHECK (l1 =10),
    CONSTRAINT "PK3" PRIMARY KEY (l1)
)
;



CREATE TABLE public.pages(
    l1            integer        DEFAULT 100 NOT NULL,
    pagenumber    integer        NOT NULL,
    subject       varchar(10)    NOT NULL,
    content       text,
    CHECK (l1 =10),
    CONSTRAINT "PK9" PRIMARY KEY (l1, pagenumber, subject)
)
;



CREATE TABLE public."ParentDomain"(
    domaincol     integer        DEFAULT 100 NOT NULL,
    colvarchar    varchar(10),
    CHECK (domaincol =10),
    CONSTRAINT "PK18" PRIMARY KEY (domaincol)
)
;



CREATE TABLE public.random(
    pp1char    character(10)    NOT NULL,
    CONSTRAINT "PK11" PRIMARY KEY (pp1char)
)
;



CREATE TABLE public.service(
    serviceid    character(10)    NOT NULL,
    location     character(10),
    center       character(10),
    id           character(10),
    CONSTRAINT "PK8" PRIMARY KEY (serviceid)
)
;



CREATE TABLE public.test1(
    p1identity    integer          DEFAULT p1value NOT NULL,
    col1char      character(10)    DEFAULT 'col1value' NOT NULL,
    col2char      character(10)    DEFAULT 'col2value',
    computed      float4,
    CONSTRAINT testconstraint CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT col2constraint CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT constr1 CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT col1constraint CHECK (p1identity>0 AND p1identity < 100),
    CONSTRAINT "PK1" PRIMARY KEY (p1identity)
)
;



CREATE TABLE public.test2(
    p2            character(10)    DEFAULT 'p2value' NOT NULL,
    col3char      character(10)    DEFAULT 'col3value',
    col4char      character(10)    DEFAULT 'col4value',
    p1identity    integer          DEFAULT 111 NOT NULL,
    CONSTRAINT col3c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT p1c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT p2c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT col4c CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT constrain2 CHECK (p1identity>0 and p1identity < 1000),
    CONSTRAINT "PK2" PRIMARY KEY (p2)
)
;



CREATE TABLE public.test3(
    p2      character(10)    DEFAULT 'p2value' NOT NULL,
    test    character(10)
)
;



CREATE VIEW public."View from test"   AS
SELECT te.col3char, te.col4char
FROM public.test2 te
WITH CHECK OPTION
;

CREATE VIEW public."View1"   AS
SELECT se.location, se.center
FROM public.service se
;

CREATE VIEW public."View2"   AS
SELECT li.roomnumber, li.name, bo.subject, bo.b1int, bo.name name1
FROM public.library li, public.book bo
WHERE bo.l1 = li.l1
;

CREATE VIEW public.nestedview   AS
SELECT Vi.col3char, Vi.col4char
FROM public."View from test" Vi
;

ALTER TABLE public.book ADD CONSTRAINT librarybook 
    FOREIGN KEY (l1)
    REFERENCES public.library(l1)
;


ALTER TABLE public."ChildDomain" ADD CONSTRAINT "RefParentDomain13" 
    FOREIGN KEY (domaincol)
    REFERENCES public."ParentDomain"(domaincol)
;


ALTER TABLE public.pages ADD CONSTRAINT "Refbook19" 
    FOREIGN KEY (l1, subject)
    REFERENCES public.book(l1, subject)
;


ALTER TABLE public.service ADD CONSTRAINT carservice 
    FOREIGN KEY (id)
    REFERENCES public.car(id)
;


ALTER TABLE public.test2 ADD CONSTRAINT test1test2 
    FOREIGN KEY (p1identity)
    REFERENCES public.test1(p1identity)
;


ALTER TABLE public.test3 ADD CONSTRAINT "Reftest238" 
    FOREIGN KEY (p2)
    REFERENCES public.test2(p2)
;


