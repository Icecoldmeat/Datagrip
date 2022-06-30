
CREATE FUNCTION [dbo].[ufnGetDocumentStatusText](@Status [tinyint])
RETURNS [nvarchar](16) 
AS 
-- Returns the sales order status text representation for the status value.
BEGIN
    DECLARE @ret [nvarchar](16);

    SET @ret = 
        CASE @Status
            WHEN 1 THEN N'Pending approval'
            WHEN 2 THEN N'Approved'
            WHEN 3 THEN N'Obsolete'
            ELSE N'** Invalid **'
        END;
    
    RETURN @ret
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Scalar function returning the text representation of the Status column in the Document table.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetDocumentStatusText'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the scalar function ufnGetDocumentStatusText. Enter a valid integer.', 'SCHEMA', 'dbo',
     'FUNCTION', 'ufnGetDocumentStatusText', 'PARAMETER', '@Status'
go

