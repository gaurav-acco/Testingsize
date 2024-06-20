
-- Drop Referencing Constraints SQL


ALTER TABLE "public"."ChildDomain"
    DROP CONSTRAINT "RefParentDomain1" CASCADE 

;

-- Standard Alter Table SQL


ALTER TABLE "public"."ChildDomain" ADD CHECK(domaincol =10)
;

ALTER TABLE "public"."ParentDomain" ADD CHECK(domaincol =10)
;

-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE "public".test1
(
    p1identity integer        NOT NULL DEFAULT p1value GENERATED ALWAYS AS IDENTITY
        (START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        NO CYCLE),
    col1char   character(10)  NOT NULL DEFAULT 'col1value',
    col2char   character(10)  DEFAULT 'col2value',
    computed   float4,
    CONSTRAINT "PK1_1" PRIMARY KEY (p1identity),
    CONSTRAINT constr1 CHECK(p1identity>0 AND p1identity < 100),
    CONSTRAINT testconstraint CHECK(p1identity>0 AND p1identity < 100),
    CONSTRAINT col1constraint CHECK(p1identity>0 AND p1identity < 100),
    CONSTRAINT col2constraint CHECK(p1identity>0 AND p1identity < 100)
)
WITH (
    OIDS=false
)

;

-- Add Constraint SQL


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


ALTER TABLE "public"."ChildDomain"
    ADD 
    FOREIGN KEY (domaincol)
    REFERENCES "public"."ParentDomain" (domaincol)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public".test2
    ADD CONSTRAINT test1test2
    FOREIGN KEY (p1identity)
    REFERENCES "public".test1 (p1identity)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

-- Add Comments SQL

COMMENT ON COLUMN "public"."ChildDomain".domaincol IS 'custom domain definition'

;
COMMENT ON COLUMN "public"."ParentDomain".domaincol IS 'custom domain definition'

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

COMMENT ON TABLE "public".test1 IS 'test1 definition'

;

COMMENT ON COLUMN "public".test1.p1identity IS 'p1 definition'

;

COMMENT ON COLUMN "public".test1.col1char IS 'col1 definition'

;

COMMENT ON COLUMN "public".test1.col2char IS 'col2 definition'

;
