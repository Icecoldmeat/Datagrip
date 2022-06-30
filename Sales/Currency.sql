create table Sales.Currency
(
    CurrencyCode nchar(3)                                     not null
        constraint PK_Currency_CurrencyCode
            primary key,
    Name         Name                                         not null,
    ModifiedDate datetime
        constraint DF_Currency_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Lookup table containing standard ISO currencies.', 'SCHEMA', 'Sales',
     'TABLE', 'Currency'
go

exec sp_addextendedproperty 'MS_Description', 'The ISO code for the Currency.', 'SCHEMA', 'Sales', 'TABLE', 'Currency',
     'COLUMN', 'CurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'Currency', 'CONSTRAINT', 'PK_Currency_CurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'Currency', 'INDEX', 'PK_Currency_CurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Currency name.', 'SCHEMA', 'Sales', 'TABLE', 'Currency', 'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'Currency', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Currency_Name
    on Sales.Currency (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'Currency',
     'INDEX', 'AK_Currency_Name'
go

