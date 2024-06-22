
-- Drop Referencing Constraints SQL

ALTER TABLE "public"."Entity4"
    DROP CONSTRAINT "RefEntity23" CASCADE 

;

-- Drop Other Constraints SQL

ALTER TABLE "public"."Entity2"
    DROP CONSTRAINT "RefEntity11" CASCADE 
;

-- Standard Alter Table SQL

ALTER TABLE "public"."Entity4" RENAME CONSTRAINT "PK3" TO "PK4"
;

-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE "public"."Entity3"
(
    e  character(10),
    f  character(10),
    ss character(10)
)
WITH (
    OIDS=false
)

;

-- Add Referencing Foreign Keys SQL


ALTER TABLE "public"."Entity3"
    ADD 
    FOREIGN KEY (ss)
    REFERENCES "public"."Entity2" (ss)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public"."Entity4"
    ADD 
    FOREIGN KEY (ss)
    REFERENCES "public"."Entity2" (ss)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public"."Entity2"
    ADD 
    FOREIGN KEY (aa)
    REFERENCES "public"."Entity1" (aa)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;
