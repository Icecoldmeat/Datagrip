create table Sales.SalesTaxRate
(
    SalesTaxRateID  int identity
        constraint PK_SalesTaxRate_SalesTaxRateID
            primary key,
    StateProvinceID int                                           not null
        constraint FK_SalesTaxRate_StateProvince_StateProvinceID
            references Person.StateProvince (StateProvinceID),
    TaxType         tinyint                                       not null
        constraint CK_SalesTaxRate_TaxType
            check ([TaxType] >= 1 AND [TaxType] <= 3),
    TaxRate         smallmoney
        constraint DF_SalesTaxRate_TaxRate default 0.00           not null,
    Name            Name                                          not null,
    rowguid         uniqueidentifier
        constraint DF_SalesTaxRate_rowguid default newid()        not null,
    ModifiedDate    datetime
        constraint DF_SalesTaxRate_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Tax rate lookup table.', 'SCHEMA', 'Sales', 'TABLE', 'SalesTaxRate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for SalesTaxRate records.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTaxRate', 'COLUMN', 'SalesTaxRateID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTaxRate', 'CONSTRAINT', 'PK_SalesTaxRate_SalesTaxRateID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTaxRate', 'INDEX', 'PK_SalesTaxRate_SalesTaxRateID'
go

exec sp_addextendedproperty 'MS_Description', 'State, province, or country/region the sales tax applies to.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesTaxRate', 'COLUMN', 'StateProvinceID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing StateProvince.StateProvinceID.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTaxRate', 'CONSTRAINT', 'FK_SalesTaxRate_StateProvince_StateProvinceID'
go

exec sp_addextendedproperty 'MS_Description',
     '1 = Tax applied to retail transactions, 2 = Tax applied to wholesale transactions, 3 = Tax applied to all sales (retail and wholesale) transactions.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTaxRate', 'COLUMN', 'TaxType'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [TaxType] BETWEEN (1) AND (3)', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTaxRate', 'CONSTRAINT', 'CK_SalesTaxRate_TaxType'
go

exec sp_addextendedproperty 'MS_Description', 'Tax rate amount.', 'SCHEMA', 'Sales', 'TABLE', 'SalesTaxRate', 'COLUMN',
     'TaxRate'
go

exec sp_addextendedproperty 'MS_Description', 'Tax rate description.', 'SCHEMA', 'Sales', 'TABLE', 'SalesTaxRate',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesTaxRate', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTaxRate', 'COLUMN', 'ModifiedDate'
go

create unique index AK_SalesTaxRate_StateProvinceID_TaxType
    on Sales.SalesTaxRate (StateProvinceID, TaxType)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'SalesTaxRate',
     'INDEX', 'AK_SalesTaxRate_StateProvinceID_TaxType'
go

create unique index AK_SalesTaxRate_rowguid
    on Sales.SalesTaxRate (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTaxRate', 'INDEX', 'AK_SalesTaxRate_rowguid'
go

