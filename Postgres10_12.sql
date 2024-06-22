
-- Drop Referencing Constraints SQL

ALTER TABLE "public".test2
    DROP CONSTRAINT test1test2 CASCADE 

;

-- Drop Other Constraints SQL


ALTER TABLE "public".test1
    DROP CONSTRAINT "PK1_1" CASCADE 

;

-- Drop Constraint, Rename and Create Table SQL

DROP TABLE "public"."Entity1"

;

ALTER TABLE "public".test1
    RENAME TO test1_5ba6dd90

;

CREATE TABLE "public".test1
(
    p1identity integer        NOT NULL DEFAULT p1value,
    col1char   character(10)  NOT NULL DEFAULT 'col1value',
    col2char   character(10)  DEFAULT 'col2value',
    computed   float4
)
WITH (
    OIDS=false
)

;

INSERT INTO "public".test1
( p1identity,
  col1char,
  col2char,
  computed ) 
SELECT
p1identity,
col1char,
col2char,
computed
FROM "public".test1_5ba6dd90

;

DROP TABLE "public".test1_5ba6dd90

;
CREATE TABLE "public".book
(
    l1      integer        NOT NULL DEFAULT 100,
    subject varchar(10)    NOT NULL,
    b1int   integer        DEFAULT 100,
    "name"  character(10),
    CONSTRAINT "PK4" PRIMARY KEY (l1, subject),
    CONSTRAINT b1 CHECK(b1int > 10 AND b1int < 50),
    CHECK(b1int =10)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".car
(
    "id"    character(10)  NOT NULL,
    model   character(10),
    carname character(10),
    CONSTRAINT "PK7" PRIMARY KEY ("id")
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public"."ChildDomain"
(
    primarycol character(10)  NOT NULL,
    domaincol  integer        NOT NULL DEFAULT 100,
    CONSTRAINT "PK19" PRIMARY KEY (primarycol, domaincol),
    CHECK(domaincol =10)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public"."library"
(
    l1         integer        NOT NULL DEFAULT 100,
    roomnumber numeric(10,0),
    "name"     character(10)  DEFAULT 'hello',
    CONSTRAINT "PK3" PRIMARY KEY (l1),
    CONSTRAINT l1 CHECK(l1 > 10 AND l1 < 50),
    CHECK(l1 =10)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".pages
(
    l1         integer      NOT NULL DEFAULT 100,
    pagenumber integer      NOT NULL,
    subject    varchar(10)  NOT NULL,
    "content"  text,
    CONSTRAINT "PK9" PRIMARY KEY (l1, pagenumber, subject),
    CHECK(l1 =10)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public"."ParentDomain"
(
    domaincol  integer        NOT NULL DEFAULT 100,
    colvarchar varchar(10),
    aa         character(10),
    CONSTRAINT "PK18" PRIMARY KEY (domaincol),
    CHECK(domaincol =10)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".random
(
    pp1char character(10)  NOT NULL,
    CONSTRAINT "PK11" PRIMARY KEY (pp1char)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".service
(
    serviceid  character(10)  NOT NULL,
    "location" character(10),
    center     character(10),
    "id"       character(10),
    CONSTRAINT "PK8" PRIMARY KEY (serviceid)
)
WITH (
    OIDS=false
)

;
CREATE TABLE "public".test3
(
    p2   character(10)  NOT NULL DEFAULT 'p2value',
    test character(10)
)
WITH (
    OIDS=false
)

;

-- Add Constraint SQL


ALTER TABLE "public".test1 ADD CONSTRAINT col1constraint CHECK(p1identity>0 AND p1identity < 100)

;

ALTER TABLE "public".test1 ADD CONSTRAINT col2constraint CHECK(p1identity>0 AND p1identity < 100)

;

ALTER TABLE "public".test1 ADD CONSTRAINT constr1 CHECK(p1identity>0 AND p1identity < 100)

;

ALTER TABLE "public".test1 ADD CONSTRAINT testconstraint CHECK(p1identity>0 AND p1identity < 100)

;

ALTER TABLE "public".test1
    ADD CONSTRAINT "PK1" PRIMARY KEY (p1identity)

;

ALTER TABLE "public".test2 ADD CONSTRAINT p1c CHECK(p1identity>0 and p1identity < 1000)

;

ALTER TABLE "public".test2 ADD CONSTRAINT p2c CHECK(p1identity>0 and p1identity < 1000)

;

ALTER TABLE "public".test2 ADD CONSTRAINT col4c CHECK(p1identity>0 and p1identity < 1000)

;

ALTER TABLE "public".test2 ADD CONSTRAINT col3c CHECK(p1identity>0 and p1identity < 1000)

;

ALTER TABLE "public".test2 ADD CONSTRAINT constrain2 CHECK(p1identity>0 and p1identity < 1000)

;

-- Add Referencing Foreign Keys SQL


ALTER TABLE "public".test2
    ADD CONSTRAINT test1test2
    FOREIGN KEY (p1identity)
    REFERENCES "public".test1 (p1identity)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".test3
    ADD 
    FOREIGN KEY (p2)
    REFERENCES "public".test2 (p2)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".pages
    ADD 
    FOREIGN KEY (l1,subject)
    REFERENCES "public".book (l1,subject)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".book
    ADD CONSTRAINT librarybook
    FOREIGN KEY (l1)
    REFERENCES "public"."library" (l1)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".service
    ADD CONSTRAINT carservice
    FOREIGN KEY ("id")
    REFERENCES "public".car ("id")
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public"."ChildDomain"
    ADD 
    FOREIGN KEY (domaincol)
    REFERENCES "public"."ParentDomain" (domaincol)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

-- Add Comments SQL


COMMENT ON TABLE "public".test1 IS 'test1 definition'

;

COMMENT ON COLUMN "public".test1.p1identity IS 'p1 definition'

;

COMMENT ON COLUMN "public".test1.col1char IS 'col1 definition'

;

COMMENT ON COLUMN "public".test1.col2char IS 'col2 definition'

;
COMMENT ON COLUMN "public".test2.p2 IS 'p2 definition'

;

COMMENT ON COLUMN "public".test2.col3char IS 'col3 definition'

;

COMMENT ON COLUMN "public".test2.col4char IS 'col4 definition'

;

COMMENT ON COLUMN "public".test2.p1identity IS 'p1 definition'

;

COMMENT ON TABLE "public".test2 IS
'test definition'

;

COMMENT ON TABLE "public".book IS 'book  definition'

;

COMMENT ON COLUMN "public".book.l1 IS 'custom domain definition'

;

COMMENT ON COLUMN "public".book.b1int IS 'custom domain definition'

;

COMMENT ON TABLE "public".car IS 'car definition'

;

COMMENT ON COLUMN "public".car."id" IS 'id definition'

;

COMMENT ON COLUMN "public".car.model IS 'model definition'

;

COMMENT ON COLUMN "public".car.carname IS 'car definition'

;

COMMENT ON COLUMN "public"."ChildDomain".domaincol IS 'custom domain definition'

;

COMMENT ON TABLE "public"."library" IS 'library notes'

;

COMMENT ON COLUMN "public"."library".l1 IS 'l1 definition'

;

COMMENT ON COLUMN "public"."library".roomnumber IS 'room definition'

;

COMMENT ON COLUMN "public"."library"."name" IS 'name definition'

;

COMMENT ON COLUMN "public".pages.l1 IS 'custom domain definition'

;

COMMENT ON COLUMN "public"."ParentDomain".domaincol IS 'custom domain definition'

;

COMMENT ON TABLE "public".service IS 'service definition'

;

COMMENT ON COLUMN "public".service.serviceid IS 'serviceid definition'

;

COMMENT ON COLUMN "public".service."location" IS 'location definition'

;

COMMENT ON COLUMN "public".service.center IS 'center definition'

;

COMMENT ON COLUMN "public".service."id" IS 'id definition'

;

COMMENT ON COLUMN "public".test3.p2 IS 'p2 definition'

;
