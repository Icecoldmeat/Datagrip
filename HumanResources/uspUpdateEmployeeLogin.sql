
CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeLogin]
    @BusinessEntityID [int], 
    @OrganizationNode [hierarchyid],
    @LoginID [nvarchar](256),
    @JobTitle [nvarchar](50),
    @HireDate [datetime],
    @CurrentFlag [dbo].[Flag]
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [OrganizationNode] = @OrganizationNode 
            ,[LoginID] = @LoginID 
            ,[JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Updates the Employee table with the values specified in the input parameters for the given BusinessEntityID.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeLogin'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeLogin. Enter a valid EmployeeID from the Employee table.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeLogin', 'PARAMETER', '@BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid ManagerID for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeLogin', 'PARAMETER', '@OrganizationNode'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid login for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeLogin', 'PARAMETER', '@LoginID'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.', 'SCHEMA',
     'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeLogin', 'PARAMETER', '@JobTitle'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeLogin', 'PARAMETER', '@HireDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeLogin', 'PARAMETER', '@CurrentFlag'
go

