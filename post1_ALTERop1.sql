
-- Drop Referencing Constraints SQL

ALTER TABLE "public"."Entity3"
    DROP CONSTRAINT "RefEntity22" CASCADE 

;

-- Drop Other Constraints SQL

ALTER TABLE "public"."Entity2"
    DROP CONSTRAINT "RefEntity11" CASCADE 
;

-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE "public"."Entity4"
(
    ss character(10)  NOT NULL,
    w  character(10),
    e  character(10),
    CONSTRAINT "PK4" PRIMARY KEY (ss)
)
WITH (
    OIDS=false
)

;

-- Add Referencing Foreign Keys SQL


ALTER TABLE "public"."Entity4"
    ADD 
    FOREIGN KEY (ss)
    REFERENCES "public"."Entity2" (ss)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT VALID

;

ALTER TABLE "public"."Entity3"
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
