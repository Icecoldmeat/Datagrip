create table HumanResources.EmployeePayHistory
(
    BusinessEntityID int                                                not null
        constraint FK_EmployeePayHistory_Employee_BusinessEntityID
            references HumanResources.Employee,
    RateChangeDate   datetime                                           not null,
    Rate             money                                              not null
        constraint CK_EmployeePayHistory_Rate
            check ([Rate] >= 6.50 AND [Rate] <= 200.00),
    PayFrequency     tinyint                                            not null
        constraint CK_EmployeePayHistory_PayFrequency
            check ([PayFrequency] = 2 OR [PayFrequency] = 1),
    ModifiedDate     datetime
        constraint DF_EmployeePayHistory_ModifiedDate default getdate() not null,
    constraint PK_EmployeePayHistory_BusinessEntityID_RateChangeDate
        primary key (BusinessEntityID, RateChangeDate)
)
go

exec sp_addextendedproperty 'MS_Description', 'Employee pay history.', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeePayHistory'
go

exec sp_addextendedproperty 'MS_Description',
     'Employee identification number. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeePayHistory', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeePayHistory', 'CONSTRAINT', 'FK_EmployeePayHistory_Employee_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Date the change in pay is effective', 'SCHEMA', 'HumanResources',
     'TABLE', 'EmployeePayHistory', 'COLUMN', 'RateChangeDate'
go

exec sp_addextendedproperty 'MS_Description', 'Salary hourly rate.', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeePayHistory', 'COLUMN', 'Rate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Rate] >= (6.50) AND [Rate] <= (200.00)', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeePayHistory', 'CONSTRAINT', 'CK_EmployeePayHistory_Rate'
go

exec sp_addextendedproperty 'MS_Description', '1 = Salary received monthly, 2 = Salary received biweekly', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeePayHistory', 'COLUMN', 'PayFrequency'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [PayFrequency]=(3) OR [PayFrequency]=(2) OR [PayFrequency]=(1)', 'SCHEMA', 'HumanResources',
     'TABLE', 'EmployeePayHistory', 'CONSTRAINT', 'CK_EmployeePayHistory_PayFrequency'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'HumanResources',
     'TABLE', 'EmployeePayHistory', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeePayHistory', 'CONSTRAINT', 'PK_EmployeePayHistory_BusinessEntityID_RateChangeDate'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeePayHistory', 'INDEX', 'PK_EmployeePayHistory_BusinessEntityID_RateChangeDate'
go

