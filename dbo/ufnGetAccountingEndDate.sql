
CREATE FUNCTION [dbo].[ufnGetAccountingEndDate]()
RETURNS [datetime] 
AS 
BEGIN
    RETURN DATEADD(millisecond, -2, CONVERT(datetime, '20040701', 112));
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function used in the uSalesOrderHeader trigger to set the starting account date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetAccountingEndDate'
go

