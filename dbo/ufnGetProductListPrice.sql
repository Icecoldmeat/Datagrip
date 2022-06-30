
CREATE FUNCTION [dbo].[ufnGetProductListPrice](@ProductID [int], @OrderDate [datetime])
RETURNS [money] 
AS 
BEGIN
    DECLARE @ListPrice money;

    SELECT @ListPrice = plph.[ListPrice] 
    FROM [Production].[Product] p 
        INNER JOIN [Production].[ProductListPriceHistory] plph 
        ON p.[ProductID] = plph.[ProductID] 
            AND p.[ProductID] = @ProductID 
            AND @OrderDate BETWEEN plph.[StartDate] AND COALESCE(plph.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!

    RETURN @ListPrice;
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function returning the list price for a given product on a particular order date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetProductListPrice'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetProductListPrice. Enter a valid ProductID from the Production.Product table.',
     'SCHEMA', 'dbo', 'FUNCTION', 'ufnGetProductListPrice', 'PARAMETER', '@ProductID'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetProductListPrice. Enter a valid order date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetProductListPrice', 'PARAMETER', '@OrderDate'
go

