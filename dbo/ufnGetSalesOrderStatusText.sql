
CREATE FUNCTION [dbo].[ufnGetSalesOrderStatusText](@Status [tinyint])
RETURNS [nvarchar](15) 
AS 
-- Returns the sales order status text representation for the status value.
BEGIN
    DECLARE @ret [nvarchar](15);

    SET @ret = 
        CASE @Status
            WHEN 1 THEN 'In process'
            WHEN 2 THEN 'Approved'
            WHEN 3 THEN 'Backordered'
            WHEN 4 THEN 'Rejected'
            WHEN 5 THEN 'Shipped'
            WHEN 6 THEN 'Cancelled'
            ELSE '** Invalid **'
        END;
    
    RETURN @ret
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function returning the text representation of the Status column in the SalesOrderHeader table.', 'SCHEMA',
     'dbo', 'FUNCTION', 'ufnGetSalesOrderStatusText'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetSalesOrderStatusText. Enter a valid integer.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetSalesOrderStatusText', 'PARAMETER', '@Status'
go

