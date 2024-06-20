/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Branch_test.DM1
 *
 * Date Created : Thursday, June 06, 2024 17:50:02
 * Target DBMS : Microsoft SQL Server 2019
 */

CREATE TABLE [Entity1](
    [id]    char(10)    NOT NULL,
    [name]  char(10)    NULL,
    CONSTRAINT [PK1] PRIMARY KEY NONCLUSTERED ([id])
)

go


IF OBJECT_ID('Entity1') IS NOT NULL
    PRINT '<<< CREATED TABLE Entity1 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Entity1 >>>'
go

