
CREATE FUNCTION [dbo].[ufnGetAccountingStartDate]()
RETURNS [datetime] 
AS 
BEGIN
    RETURN CONVERT(datetime, '20030701', 112);
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function used in the uSalesOrderHeader trigger to set the ending account date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetAccountingStartDate'
go

