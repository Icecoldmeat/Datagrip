create table Sales.CountryRegionCurrency
(
    CountryRegionCode nvarchar(3)                                          not null
        constraint FK_CountryRegionCurrency_CountryRegion_CountryRegionCode
            references Person.CountryRegion (CountryRegionCode),
    CurrencyCode      nchar(3)                                             not null
        constraint FK_CountryRegionCurrency_Currency_CurrencyCode
            references Sales.Currency,
    ModifiedDate      datetime
        constraint DF_CountryRegionCurrency_ModifiedDate default getdate() not null,
    constraint PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode
        primary key (CountryRegionCode, CurrencyCode)
)
go

exec sp_addextendedproperty 'MS_Description',
     'Cross-reference table mapping ISO currency codes to a country or region.', 'SCHEMA', 'Sales', 'TABLE',
     'CountryRegionCurrency'
go

exec sp_addextendedproperty 'MS_Description',
     'ISO code for countries and regions. Foreign key to CountryRegion.CountryRegionCode.', 'SCHEMA', 'Sales', 'TABLE',
     'CountryRegionCurrency', 'COLUMN', 'CountryRegionCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing CountryRegion.CountryRegionCode.',
     'SCHEMA', 'Sales', 'TABLE', 'CountryRegionCurrency', 'CONSTRAINT',
     'FK_CountryRegionCurrency_CountryRegion_CountryRegionCode'
go

exec sp_addextendedproperty 'MS_Description', 'ISO standard currency code. Foreign key to Currency.CurrencyCode.',
     'SCHEMA', 'Sales', 'TABLE', 'CountryRegionCurrency', 'COLUMN', 'CurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Currency.CurrencyCode.', 'SCHEMA',
     'Sales', 'TABLE', 'CountryRegionCurrency', 'CONSTRAINT', 'FK_CountryRegionCurrency_Currency_CurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'CountryRegionCurrency', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'CountryRegionCurrency', 'CONSTRAINT', 'PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'CountryRegionCurrency', 'INDEX', 'PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode'
go

create index IX_CountryRegionCurrency_CurrencyCode
    on Sales.CountryRegionCurrency (CurrencyCode)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE',
     'CountryRegionCurrency', 'INDEX', 'IX_CountryRegionCurrency_CurrencyCode'
go

