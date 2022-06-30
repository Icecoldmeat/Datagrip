create table ErrorLog
(
    ErrorLogID     int identity
        constraint PK_ErrorLog_ErrorLogID
            primary key,
    ErrorTime      datetime
        constraint DF_ErrorLog_ErrorTime default getdate() not null,
    UserName       sysname                                 not null,
    ErrorNumber    int                                     not null,
    ErrorSeverity  int,
    ErrorState     int,
    ErrorProcedure nvarchar(126),
    ErrorLine      int,
    ErrorMessage   nvarchar(4000)                          not null
)
go

exec sp_addextendedproperty 'MS_Description',
     'Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.',
     'SCHEMA', 'dbo', 'TABLE', 'ErrorLog'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ErrorLog records.', 'SCHEMA', 'dbo', 'TABLE', 'ErrorLog',
     'COLUMN', 'ErrorLogID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'dbo', 'TABLE',
     'ErrorLog', 'CONSTRAINT', 'PK_ErrorLog_ErrorLogID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'dbo',
     'TABLE', 'ErrorLog', 'INDEX', 'PK_ErrorLog_ErrorLogID'
go

exec sp_addextendedproperty 'MS_Description', 'The date and time at which the error occurred.', 'SCHEMA', 'dbo',
     'TABLE', 'ErrorLog', 'COLUMN', 'ErrorTime'
go

exec sp_addextendedproperty 'MS_Description', 'The user who executed the batch in which the error occurred.', 'SCHEMA',
     'dbo', 'TABLE', 'ErrorLog', 'COLUMN', 'UserName'
go

exec sp_addextendedproperty 'MS_Description', 'The error number of the error that occurred.', 'SCHEMA', 'dbo', 'TABLE',
     'ErrorLog', 'COLUMN', 'ErrorNumber'
go

exec sp_addextendedproperty 'MS_Description', 'The severity of the error that occurred.', 'SCHEMA', 'dbo', 'TABLE',
     'ErrorLog', 'COLUMN', 'ErrorSeverity'
go

exec sp_addextendedproperty 'MS_Description', 'The state number of the error that occurred.', 'SCHEMA', 'dbo', 'TABLE',
     'ErrorLog', 'COLUMN', 'ErrorState'
go

exec sp_addextendedproperty 'MS_Description', 'The name of the stored procedure or trigger where the error occurred.',
     'SCHEMA', 'dbo', 'TABLE', 'ErrorLog', 'COLUMN', 'ErrorProcedure'
go

exec sp_addextendedproperty 'MS_Description', 'The line number at which the error occurred.', 'SCHEMA', 'dbo', 'TABLE',
     'ErrorLog', 'COLUMN', 'ErrorLine'
go

exec sp_addextendedproperty 'MS_Description', 'The message text of the error that occurred.', 'SCHEMA', 'dbo', 'TABLE',
     'ErrorLog', 'COLUMN', 'ErrorMessage'
go

