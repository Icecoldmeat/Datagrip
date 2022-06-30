create table Purchasing.Vendor
(
    BusinessEntityID        int                              not null
        constraint PK_Vendor_BusinessEntityID
            primary key
        constraint FK_Vendor_BusinessEntity_BusinessEntityID
            references Person.BusinessEntity (BusinessEntityID),
    AccountNumber           AccountNumber                    not null,
    Name                    Name                             not null,
    CreditRating            tinyint                          not null
        constraint CK_Vendor_CreditRating
            check ([CreditRating] >= 1 AND [CreditRating] <= 5),
    PreferredVendorStatus   Flag
        constraint DF_Vendor_PreferredVendorStatus default 1 not null,
    ActiveFlag              Flag
        constraint DF_Vendor_ActiveFlag default 1            not null,
    PurchasingWebServiceURL nvarchar(1024),
    ModifiedDate            datetime
        constraint DF_Vendor_ModifiedDate default getdate()  not null
)
go

exec sp_addextendedproperty 'MS_Description',
     'Companies from whom Adventure Works Cycles purchases parts or other goods.', 'SCHEMA', 'Purchasing', 'TABLE',
     'Vendor'
go

exec sp_addextendedproperty 'MS_Description',
     'Primary key for Vendor records.  Foreign key to BusinessEntity.BusinessEntityID', 'SCHEMA', 'Purchasing', 'TABLE',
     'Vendor', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Purchasing', 'TABLE',
     'Vendor', 'CONSTRAINT', 'PK_Vendor_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Purchasing', 'TABLE', 'Vendor', 'INDEX', 'PK_Vendor_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing BusinessEntity.BusinessEntityID',
     'SCHEMA', 'Purchasing', 'TABLE', 'Vendor', 'CONSTRAINT', 'FK_Vendor_BusinessEntity_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Vendor account (identification) number.', 'SCHEMA', 'Purchasing',
     'TABLE', 'Vendor', 'COLUMN', 'AccountNumber'
go

exec sp_addextendedproperty 'MS_Description', 'Company name.', 'SCHEMA', 'Purchasing', 'TABLE', 'Vendor', 'COLUMN',
     'Name'
go

exec sp_addextendedproperty 'MS_Description',
     '1 = Superior, 2 = Excellent, 3 = Above average, 4 = Average, 5 = Below average', 'SCHEMA', 'Purchasing', 'TABLE',
     'Vendor', 'COLUMN', 'CreditRating'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [CreditRating] BETWEEN (1) AND (5)', 'SCHEMA',
     'Purchasing', 'TABLE', 'Vendor', 'CONSTRAINT', 'CK_Vendor_CreditRating'
go

exec sp_addextendedproperty 'MS_Description',
     '0 = Do not use if another vendor is available. 1 = Preferred over other vendors supplying the same product.',
     'SCHEMA', 'Purchasing', 'TABLE', 'Vendor', 'COLUMN', 'PreferredVendorStatus'
go

exec sp_addextendedproperty 'MS_Description', '0 = Vendor no longer used. 1 = Vendor is actively used.', 'SCHEMA',
     'Purchasing', 'TABLE', 'Vendor', 'COLUMN', 'ActiveFlag'
go

exec sp_addextendedproperty 'MS_Description', 'Vendor URL.', 'SCHEMA', 'Purchasing', 'TABLE', 'Vendor', 'COLUMN',
     'PurchasingWebServiceURL'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Purchasing',
     'TABLE', 'Vendor', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Vendor_AccountNumber
    on Purchasing.Vendor (AccountNumber)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Purchasing', 'TABLE', 'Vendor',
     'INDEX', 'AK_Vendor_AccountNumber'
go

