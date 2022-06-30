
CREATE FUNCTION [dbo].[ufnGetPurchaseOrderStatusText](@Status [tinyint])
RETURNS [nvarchar](15) 
AS 
-- Returns the sales order status text representation for the status value.
BEGIN
    DECLARE @ret [nvarchar](15);

    SET @ret = 
        CASE @Status
            WHEN 1 THEN 'Pending'
            WHEN 2 THEN 'Approved'
            WHEN 3 THEN 'Rejected'
            WHEN 4 THEN 'Complete'
            ELSE '** Invalid **'
        END;
    
    RETURN @ret
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function returning the text representation of the Status column in the PurchaseOrderHeader table.',
     'SCHEMA', 'dbo', 'FUNCTION', 'ufnGetPurchaseOrderStatusText'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetPurchaseOrdertStatusText. Enter a valid integer.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetPurchaseOrderStatusText', 'PARAMETER', '@Status'
go

