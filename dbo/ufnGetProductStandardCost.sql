
CREATE FUNCTION [dbo].[ufnGetProductStandardCost](@ProductID [int], @OrderDate [datetime])
RETURNS [money] 
AS 
-- Returns the standard cost for the product on a specific date.
BEGIN
    DECLARE @StandardCost money;

    SELECT @StandardCost = pch.[StandardCost] 
    FROM [Production].[Product] p 
        INNER JOIN [Production].[ProductCostHistory] pch 
        ON p.[ProductID] = pch.[ProductID] 
            AND p.[ProductID] = @ProductID 
            AND @OrderDate BETWEEN pch.[StartDate] AND COALESCE(pch.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!

    RETURN @StandardCost;
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function returning the standard cost for a given product on a particular order date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetProductStandardCost'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetProductStandardCost. Enter a valid ProductID from the Production.Product table.',
     'SCHEMA', 'dbo', 'FUNCTION', 'ufnGetProductStandardCost', 'PARAMETER', '@ProductID'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetProductStandardCost. Enter a valid order date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetProductStandardCost', 'PARAMETER', '@OrderDate'
go

