create table HumanResources.Employee
(
    BusinessEntityID  int                                     not null
        constraint PK_Employee_BusinessEntityID
            primary key
        constraint FK_Employee_Person_BusinessEntityID
            references Person.Person (BusinessEntityID),
    NationalIDNumber  nvarchar(15)                            not null,
    LoginID           nvarchar(256)                           not null,
    OrganizationNode  hierarchyid,
    OrganizationLevel as [OrganizationNode].[GetLevel](),
    JobTitle          nvarchar(50)                            not null,
    BirthDate         date                                    not null
        constraint CK_Employee_BirthDate
            check ([BirthDate] >= '1930-01-01' AND [BirthDate] <= dateadd(year, -18, getdate())),
    MaritalStatus     nchar                                   not null
        constraint CK_Employee_MaritalStatus
            check (upper([MaritalStatus]) = 'S' OR upper([MaritalStatus]) = 'M'),
    Gender            nchar                                   not null
        constraint CK_Employee_Gender
            check (upper([Gender]) = 'F' OR upper([Gender]) = 'M'),
    HireDate          date                                    not null
        constraint CK_Employee_HireDate
            check ([HireDate] >= '1996-07-01' AND [HireDate] <= dateadd(day, 1, getdate())),
    SalariedFlag      Flag
        constraint DF_Employee_SalariedFlag default 1         not null,
    VacationHours     smallint
        constraint DF_Employee_VacationHours default 0        not null
        constraint CK_Employee_VacationHours
            check ([VacationHours] >= (-40) AND [VacationHours] <= 240),
    SickLeaveHours    smallint
        constraint DF_Employee_SickLeaveHours default 0       not null
        constraint CK_Employee_SickLeaveHours
            check ([SickLeaveHours] >= 0 AND [SickLeaveHours] <= 120),
    CurrentFlag       Flag
        constraint DF_Employee_CurrentFlag default 1          not null,
    rowguid           uniqueidentifier
        constraint DF_Employee_rowguid default newid()        not null,
    ModifiedDate      datetime
        constraint DF_Employee_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Employee information such as salary, department, and title.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee'
go

exec sp_addextendedproperty 'MS_Description',
     'Primary key for Employee records.  Foreign key to BusinessEntity.BusinessEntityID.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Employee', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'CONSTRAINT', 'PK_Employee_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'INDEX', 'PK_Employee_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'CONSTRAINT', 'FK_Employee_Person_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Unique national identification number such as a social security number.',
     'SCHEMA', 'HumanResources', 'TABLE', 'Employee', 'COLUMN', 'NationalIDNumber'
go

exec sp_addextendedproperty 'MS_Description', 'Network login.', 'SCHEMA', 'HumanResources', 'TABLE', 'Employee',
     'COLUMN', 'LoginID'
go

exec sp_addextendedproperty 'MS_Description', 'Where the employee is located in corporate hierarchy.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'COLUMN', 'OrganizationNode'
go

exec sp_addextendedproperty 'MS_Description', 'The depth of the employee in the corporate hierarchy.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'COLUMN', 'OrganizationLevel'
go

exec sp_addextendedproperty 'MS_Description', 'Work title such as Buyer or Sales Representative.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'COLUMN', 'JobTitle'
go

exec sp_addextendedproperty 'MS_Description', 'Date of birth.', 'SCHEMA', 'HumanResources', 'TABLE', 'Employee',
     'COLUMN', 'BirthDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [BirthDate] >= ''1930-01-01'' AND [BirthDate] <= dateadd(year,(-18),GETDATE())', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'CONSTRAINT', 'CK_Employee_BirthDate'
go

exec sp_addextendedproperty 'MS_Description', 'M = Married, S = Single', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'COLUMN', 'MaritalStatus'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [MaritalStatus]=''s'' OR [MaritalStatus]=''m'' OR [MaritalStatus]=''S'' OR [MaritalStatus]=''M''',
     'SCHEMA', 'HumanResources', 'TABLE', 'Employee', 'CONSTRAINT', 'CK_Employee_MaritalStatus'
go

exec sp_addextendedproperty 'MS_Description', 'M = Male, F = Female', 'SCHEMA', 'HumanResources', 'TABLE', 'Employee',
     'COLUMN', 'Gender'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [Gender]=''f'' OR [Gender]=''m'' OR [Gender]=''F'' OR [Gender]=''M''', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'CONSTRAINT', 'CK_Employee_Gender'
go

exec sp_addextendedproperty 'MS_Description', 'Employee hired on this date.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'COLUMN', 'HireDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [HireDate] >= ''1996-07-01'' AND [HireDate] <= dateadd(day,(1),GETDATE())', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'CONSTRAINT', 'CK_Employee_HireDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Job classification. 0 = Hourly, not exempt from collective bargaining. 1 = Salaried, exempt from collective bargaining.',
     'SCHEMA', 'HumanResources', 'TABLE', 'Employee', 'COLUMN', 'SalariedFlag'
go

exec sp_addextendedproperty 'MS_Description', 'Number of available vacation hours.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Employee', 'COLUMN', 'VacationHours'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [VacationHours] >= (-40) AND [VacationHours] <= (240)',
     'SCHEMA', 'HumanResources', 'TABLE', 'Employee', 'CONSTRAINT', 'CK_Employee_VacationHours'
go

exec sp_addextendedproperty 'MS_Description', 'Number of available sick leave hours.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Employee', 'COLUMN', 'SickLeaveHours'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SickLeaveHours] >= (0) AND [SickLeaveHours] <= (120)',
     'SCHEMA', 'HumanResources', 'TABLE', 'Employee', 'CONSTRAINT', 'CK_Employee_SickLeaveHours'
go

exec sp_addextendedproperty 'MS_Description', '0 = Inactive, 1 = Active', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'COLUMN', 'CurrentFlag'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Employee', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Employee', 'COLUMN', 'ModifiedDate'
go

create index IX_Employee_OrganizationNode
    on HumanResources.Employee (OrganizationNode)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'INDEX', 'IX_Employee_OrganizationNode'
go

create index IX_Employee_OrganizationLevel_OrganizationNode
    on HumanResources.Employee (OrganizationLevel, OrganizationNode)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'INDEX', 'IX_Employee_OrganizationLevel_OrganizationNode'
go

create unique index AK_Employee_LoginID
    on HumanResources.Employee (LoginID)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'INDEX', 'AK_Employee_LoginID'
go

create unique index AK_Employee_NationalIDNumber
    on HumanResources.Employee (NationalIDNumber)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Employee', 'INDEX', 'AK_Employee_NationalIDNumber'
go

create unique index AK_Employee_rowguid
    on HumanResources.Employee (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'HumanResources', 'TABLE', 'Employee', 'INDEX', 'AK_Employee_rowguid'
go

