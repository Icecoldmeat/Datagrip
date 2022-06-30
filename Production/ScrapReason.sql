create table Production.ScrapReason
(
    ScrapReasonID smallint identity
        constraint PK_ScrapReason_ScrapReasonID
            primary key,
    Name          Name                                           not null,
    ModifiedDate  datetime
        constraint DF_ScrapReason_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Manufacturing failure reasons lookup table.', 'SCHEMA', 'Production',
     'TABLE', 'ScrapReason'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ScrapReason records.', 'SCHEMA', 'Production', 'TABLE',
     'ScrapReason', 'COLUMN', 'ScrapReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ScrapReason', 'CONSTRAINT', 'PK_ScrapReason_ScrapReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ScrapReason', 'INDEX', 'PK_ScrapReason_ScrapReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Failure description.', 'SCHEMA', 'Production', 'TABLE', 'ScrapReason',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ScrapReason', 'COLUMN', 'ModifiedDate'
go

create unique index AK_ScrapReason_Name
    on Production.ScrapReason (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'ScrapReason', 'INDEX', 'AK_ScrapReason_Name'
go

