/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Branch_test.DM1
 *
 * Date Created : Monday, June 03, 2024 09:59:03
 * Target DBMS : Microsoft SQL Server 2019
 */

CREATE TABLE [Entity1](
    [id]        char(10)    NOT NULL,
    [name]      char(10)    NULL,
    [order_id]  char(10)    NULL,
    [amount]    char(10)    NULL,
    CONSTRAINT [PK1] PRIMARY KEY NONCLUSTERED ([id])
)

go


IF OBJECT_ID('Entity1') IS NOT NULL
    PRINT '<<< CREATED TABLE Entity1 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Entity1 >>>'
go

