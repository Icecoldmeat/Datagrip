
CREATE FUNCTION [dbo].[ufnGetStock](@ProductID [int])
RETURNS [int] 
AS 
-- Returns the stock level for the product. This function is used internally only
BEGIN
    DECLARE @ret int;
    
    SELECT @ret = SUM(p.[Quantity]) 
    FROM [Production].[ProductInventory] p 
    WHERE p.[ProductID] = @ProductID 
        AND p.[LocationID] = '6'; -- Only look at inventory in the misc storage
    
    IF (@ret IS NULL) 
        SET @ret = 0
    
    RETURN @ret
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function returning the quantity of inventory in LocationID 6 (Miscellaneous Storage)for a specified ProductID.',
     'SCHEMA', 'dbo', 'FUNCTION', 'ufnGetStock'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetStock. Enter a valid ProductID from the Production.ProductInventory table.',
     'SCHEMA', 'dbo', 'FUNCTION', 'ufnGetStock', 'PARAMETER', '@ProductID'
go

