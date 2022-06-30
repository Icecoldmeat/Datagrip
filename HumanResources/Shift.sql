create table HumanResources.Shift
(
    ShiftID      tinyint identity
        constraint PK_Shift_ShiftID
            primary key,
    Name         Name                                      not null,
    StartTime    time                                      not null,
    EndTime      time                                      not null,
    ModifiedDate datetime
        constraint DF_Shift_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Work shift lookup table.', 'SCHEMA', 'HumanResources', 'TABLE', 'Shift'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for Shift records.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Shift', 'COLUMN', 'ShiftID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'HumanResources', 'TABLE',
     'Shift', 'CONSTRAINT', 'PK_Shift_ShiftID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'HumanResources', 'TABLE', 'Shift', 'INDEX', 'PK_Shift_ShiftID'
go

exec sp_addextendedproperty 'MS_Description', 'Shift description.', 'SCHEMA', 'HumanResources', 'TABLE', 'Shift',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Shift start time.', 'SCHEMA', 'HumanResources', 'TABLE', 'Shift',
     'COLUMN', 'StartTime'
go

exec sp_addextendedproperty 'MS_Description', 'Shift end time.', 'SCHEMA', 'HumanResources', 'TABLE', 'Shift', 'COLUMN',
     'EndTime'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'HumanResources',
     'TABLE', 'Shift', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Shift_Name
    on HumanResources.Shift (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Shift', 'INDEX', 'AK_Shift_Name'
go

create unique index AK_Shift_StartTime_EndTime
    on HumanResources.Shift (StartTime, EndTime)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'Shift', 'INDEX', 'AK_Shift_StartTime_EndTime'
go

