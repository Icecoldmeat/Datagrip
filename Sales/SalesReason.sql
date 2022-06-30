create table Sales.SalesReason
(
    SalesReasonID int identity
        constraint PK_SalesReason_SalesReasonID
            primary key,
    Name          Name                                           not null,
    ReasonType    Name                                           not null,
    ModifiedDate  datetime
        constraint DF_SalesReason_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Lookup table of customer purchase reasons.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesReason'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for SalesReason records.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesReason', 'COLUMN', 'SalesReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesReason', 'CONSTRAINT', 'PK_SalesReason_SalesReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesReason', 'INDEX', 'PK_SalesReason_SalesReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Sales reason description.', 'SCHEMA', 'Sales', 'TABLE', 'SalesReason',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Category the sales reason belongs to.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesReason', 'COLUMN', 'ReasonType'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesReason', 'COLUMN', 'ModifiedDate'
go

