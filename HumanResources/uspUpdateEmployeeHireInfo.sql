use AdventureWorks2016
go

CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeHireInfo]
    @BusinessEntityID [int], 
    @JobTitle [nvarchar](50), 
    @HireDate [datetime], 
    @RateChangeDate [datetime], 
    @Rate [money], 
    @PayFrequency [tinyint], 
    @CurrentFlag [dbo].[Flag] 
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [HumanResources].[Employee] 
        SET [JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;

        INSERT INTO [HumanResources].[EmployeePayHistory] 
            ([BusinessEntityID]
            ,[RateChangeDate]
            ,[Rate]
            ,[PayFrequency]) 
        VALUES (@BusinessEntityID, @RateChangeDate, @Rate, @PayFrequency);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid BusinessEntityID from the Employee table.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeHireInfo', 'PARAMETER', '@BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.', 'SCHEMA',
     'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeHireInfo', 'PARAMETER', '@JobTitle'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeHireInfo', 'PARAMETER', '@HireDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the date the rate changed for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeHireInfo', 'PARAMETER', '@RateChangeDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the new rate for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeHireInfo', 'PARAMETER', '@Rate'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the pay frequency for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeHireInfo', 'PARAMETER', '@PayFrequency'
go

exec sp_addextendedproperty 'MS_Description',
     'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.',
     'SCHEMA', 'HumanResources', 'PROCEDURE', 'uspUpdateEmployeeHireInfo', 'PARAMETER', '@CurrentFlag'
go

