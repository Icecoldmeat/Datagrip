
CREATE FUNCTION [dbo].[ufnLeadingZeros](
    @Value int
) 
RETURNS varchar(8) 
WITH SCHEMABINDING 
AS 
BEGIN
    DECLARE @ReturnValue varchar(8);

    SET @ReturnValue = CONVERT(varchar(8), @Value);
    SET @ReturnValue = REPLICATE('0', 8 - DATALENGTH(@ReturnValue)) + @ReturnValue;

    RETURN (@ReturnValue);
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function used by the Sales.Customer table to help set the account number.', 'SCHEMA', 'dbo', 'FUNCTION',
     'ufnLeadingZeros'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnLeadingZeros. Enter a valid integer.', 'SCHEMA', 'dbo', 'FUNCTION',
     'ufnLeadingZeros', 'PARAMETER', '@Value'
go

