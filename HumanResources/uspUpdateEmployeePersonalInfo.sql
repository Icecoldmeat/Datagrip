
CREATE PROCEDURE [HumanResources].[uspUpdateEmployeePersonalInfo]
    @BusinessEntityID [int], 
    @NationalIDNumber [nvarchar](15), 
    @BirthDate [datetime], 
    @MaritalStatus [nchar](1), 
    @Gender [nchar](1)
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [NationalIDNumber] = @NationalIDNumber 
            ,[BirthDate] = @BirthDate 
            ,[MaritalStatus] = @MaritalStatus 
            ,[Gender] = @Gender 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Updates the Employee table with the values specified in the input parameters for the given EmployeeID.', 'SCHEMA',
     'HumanResources', 'PROCEDURE', 'uspUpdateEmployeePersonalInfo'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeePersonalInfo. Enter a valid BusinessEntityID from the HumanResources.Employee table.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeePersonalInfo', 'PARAMETER', '@BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a national ID for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeePersonalInfo', 'PARAMETER', '@NationalIDNumber'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a birth date for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeePersonalInfo', 'PARAMETER', '@BirthDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a marital status for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeePersonalInfo', 'PARAMETER', '@MaritalStatus'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a gender for the employee.', 'SCHEMA',
     'HumanResources', 'PROCEDURE', 'uspUpdateEmployeePersonalInfo', 'PARAMETER', '@Gender'
go

