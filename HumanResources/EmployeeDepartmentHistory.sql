create table HumanResources.EmployeeDepartmentHistory
(
    BusinessEntityID int                                                       not null
        constraint FK_EmployeeDepartmentHistory_Employee_BusinessEntityID
            references HumanResources.Employee,
    DepartmentID     smallint                                                  not null
        constraint FK_EmployeeDepartmentHistory_Department_DepartmentID
            references HumanResources.Department,
    ShiftID          tinyint                                                   not null
        constraint FK_EmployeeDepartmentHistory_Shift_ShiftID
            references HumanResources.Shift,
    StartDate        date                                                      not null,
    EndDate          date,
    ModifiedDate     datetime
        constraint DF_EmployeeDepartmentHistory_ModifiedDate default getdate() not null,
    constraint PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID
        primary key (BusinessEntityID, StartDate, DepartmentID, ShiftID),
    constraint CK_EmployeeDepartmentHistory_EndDate
        check ([EndDate] >= [StartDate] OR [EndDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'Employee department transfers.', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeeDepartmentHistory'
go

exec sp_addextendedproperty 'MS_Description',
     'Employee identification number. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeeDepartmentHistory', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'CONSTRAINT',
     'FK_EmployeeDepartmentHistory_Employee_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'Department in which the employee worked including currently. Foreign key to Department.DepartmentID.', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'COLUMN', 'DepartmentID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Department.DepartmentID.', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'CONSTRAINT',
     'FK_EmployeeDepartmentHistory_Department_DepartmentID'
go

exec sp_addextendedproperty 'MS_Description',
     'Identifies which 8-hour shift the employee works. Foreign key to Shift.Shift.ID.', 'SCHEMA', 'HumanResources',
     'TABLE', 'EmployeeDepartmentHistory', 'COLUMN', 'ShiftID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Shift.ShiftID', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'CONSTRAINT', 'FK_EmployeeDepartmentHistory_Shift_ShiftID'
go

exec sp_addextendedproperty 'MS_Description', 'Date the employee started work in the department.', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'COLUMN', 'StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date the employee left the department. NULL = Current department.',
     'SCHEMA', 'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'COLUMN', 'EndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'HumanResources',
     'TABLE', 'EmployeeDepartmentHistory', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeeDepartmentHistory', 'CONSTRAINT', 'PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'INDEX',
     'PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NUL', 'SCHEMA',
     'HumanResources', 'TABLE', 'EmployeeDepartmentHistory', 'CONSTRAINT', 'CK_EmployeeDepartmentHistory_EndDate'
go

create index IX_EmployeeDepartmentHistory_DepartmentID
    on HumanResources.EmployeeDepartmentHistory (DepartmentID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeeDepartmentHistory', 'INDEX', 'IX_EmployeeDepartmentHistory_DepartmentID'
go

create index IX_EmployeeDepartmentHistory_ShiftID
    on HumanResources.EmployeeDepartmentHistory (ShiftID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'EmployeeDepartmentHistory', 'INDEX', 'IX_EmployeeDepartmentHistory_ShiftID'
go

