create table Sales.CurrencyRate
(
    CurrencyRateID   int identity
        constraint PK_CurrencyRate_CurrencyRateID
            primary key,
    CurrencyRateDate datetime                                     not null,
    FromCurrencyCode nchar(3)                                     not null
        constraint FK_CurrencyRate_Currency_FromCurrencyCode
            references Sales.Currency,
    ToCurrencyCode   nchar(3)                                     not null
        constraint FK_CurrencyRate_Currency_ToCurrencyCode
            references Sales.Currency,
    AverageRate      money                                        not null,
    EndOfDayRate     money                                        not null,
    ModifiedDate     datetime
        constraint DF_CurrencyRate_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Currency exchange rates.', 'SCHEMA', 'Sales', 'TABLE', 'CurrencyRate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for CurrencyRate records.', 'SCHEMA', 'Sales', 'TABLE',
     'CurrencyRate', 'COLUMN', 'CurrencyRateID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'CurrencyRate', 'CONSTRAINT', 'PK_CurrencyRate_CurrencyRateID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'CurrencyRate', 'INDEX', 'PK_CurrencyRate_CurrencyRateID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the exchange rate was obtained.', 'SCHEMA', 'Sales',
     'TABLE', 'CurrencyRate', 'COLUMN', 'CurrencyRateDate'
go

exec sp_addextendedproperty 'MS_Description', 'Exchange rate was converted from this currency code.', 'SCHEMA', 'Sales',
     'TABLE', 'CurrencyRate', 'COLUMN', 'FromCurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Currency.FromCurrencyCode.', 'SCHEMA',
     'Sales', 'TABLE', 'CurrencyRate', 'CONSTRAINT', 'FK_CurrencyRate_Currency_FromCurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Exchange rate was converted to this currency code.', 'SCHEMA', 'Sales',
     'TABLE', 'CurrencyRate', 'COLUMN', 'ToCurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Currency.ToCurrencyCode.', 'SCHEMA',
     'Sales', 'TABLE', 'CurrencyRate', 'CONSTRAINT', 'FK_CurrencyRate_Currency_ToCurrencyCode'
go

exec sp_addextendedproperty 'MS_Description', 'Average exchange rate for the day.', 'SCHEMA', 'Sales', 'TABLE',
     'CurrencyRate', 'COLUMN', 'AverageRate'
go

exec sp_addextendedproperty 'MS_Description', 'Final exchange rate for the day.', 'SCHEMA', 'Sales', 'TABLE',
     'CurrencyRate', 'COLUMN', 'EndOfDayRate'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'CurrencyRate', 'COLUMN', 'ModifiedDate'
go

create unique index AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode
    on Sales.CurrencyRate (CurrencyRateDate, FromCurrencyCode, ToCurrencyCode)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'CurrencyRate',
     'INDEX', 'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode'
go

