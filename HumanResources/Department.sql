create table HumanResources.Department
(
    DepartmentID smallint identity
        constraint PK_Department_DepartmentID
            primary key,
    Name         Name                                           not null,
    GroupName    Name                                           not null,
    ModifiedDate datetime
        constraint DF_Department_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description',
     'Lookup table containing the departments within the Adventure Works Cycles company.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Department'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for Department records.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Department', 'COLUMN', 'DepartmentID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'HumanResources', 'TABLE',
     'Department', 'CONSTRAINT', 'PK_Department_DepartmentID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Department', 'INDEX', 'PK_Department_DepartmentID'
go

exec sp_addextendedproperty 'MS_Description', 'Name of the department.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Department', 'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Name of the group to which the department belongs.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Department', 'COLUMN', 'GroupName'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Department', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Department_Name
    on HumanResources.Department (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Department', 'INDEX', 'AK_Department_Name'
go

