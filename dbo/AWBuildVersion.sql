create table AWBuildVersion
(
    SystemInformationID tinyint identity
        constraint PK_AWBuildVersion_SystemInformationID
            primary key,
    [Database Version]  nvarchar(25)                                not null,
    VersionDate         datetime                                    not null,
    ModifiedDate        datetime
        constraint DF_AWBuildVersion_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Current version number of the AdventureWorks 2016 sample database. ',
     'SCHEMA', 'dbo', 'TABLE', 'AWBuildVersion'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for AWBuildVersion records.', 'SCHEMA', 'dbo', 'TABLE',
     'AWBuildVersion', 'COLUMN', 'SystemInformationID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'dbo', 'TABLE',
     'AWBuildVersion', 'CONSTRAINT', 'PK_AWBuildVersion_SystemInformationID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'dbo',
     'TABLE', 'AWBuildVersion', 'INDEX', 'PK_AWBuildVersion_SystemInformationID'
go

exec sp_addextendedproperty 'MS_Description', 'Version number of the database in 9.yy.mm.dd.00 format.', 'SCHEMA',
     'dbo', 'TABLE', 'AWBuildVersion', 'COLUMN', 'Database Version'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'dbo', 'TABLE',
     'AWBuildVersion', 'COLUMN', 'VersionDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'dbo', 'TABLE',
     'AWBuildVersion', 'COLUMN', 'ModifiedDate'
go

