


CREATE FUNCTION [dbo].[ufnGetProductDealerPrice](@ProductID [int], @OrderDate [datetime])
RETURNS [money] 
AS 
-- Returns the dealer price for the product on a specific date.
BEGIN
    DECLARE @DealerPrice money;
    DECLARE @DealerDiscount money;

    SET @DealerDiscount = 0.60  -- 60% of list price

    SELECT @DealerPrice = plph.[ListPrice] * @DealerDiscount 
    FROM [Production].[Product] p 
        INNER JOIN [Production].[ProductListPriceHistory] plph 
        ON p.[ProductID] = plph.[ProductID] 
            AND p.[ProductID] = @ProductID 
            AND @OrderDate BETWEEN plph.[StartDate] AND COALESCE(plph.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!

    RETURN @DealerPrice;
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function returning the dealer price for a given product on a particular order date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetProductDealerPrice'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetProductDealerPrice. Enter a valid ProductID from the Production.Product table.',
     'SCHEMA', 'dbo', 'FUNCTION', 'ufnGetProductDealerPrice', 'PARAMETER', '@ProductID'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetProductDealerPrice. Enter a valid order date.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetProductDealerPrice', 'PARAMETER', '@OrderDate'
go

