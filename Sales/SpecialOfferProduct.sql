create table Sales.SpecialOfferProduct
(
    SpecialOfferID int                                                   not null
        constraint FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID
            references Sales.SpecialOffer,
    ProductID      int                                                   not null
        constraint FK_SpecialOfferProduct_Product_ProductID
            references Production.Product,
    rowguid        uniqueidentifier
        constraint DF_SpecialOfferProduct_rowguid default newid()        not null,
    ModifiedDate   datetime
        constraint DF_SpecialOfferProduct_ModifiedDate default getdate() not null,
    constraint PK_SpecialOfferProduct_SpecialOfferID_ProductID
        primary key (SpecialOfferID, ProductID)
)
go

exec sp_addextendedproperty 'MS_Description', 'Cross-reference table mapping products to special offer discounts.',
     'SCHEMA', 'Sales', 'TABLE', 'SpecialOfferProduct'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for SpecialOfferProduct records.', 'SCHEMA', 'Sales',
     'TABLE', 'SpecialOfferProduct', 'COLUMN', 'SpecialOfferID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SpecialOffer.SpecialOfferID.',
     'SCHEMA', 'Sales', 'TABLE', 'SpecialOfferProduct', 'CONSTRAINT',
     'FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Sales', 'TABLE', 'SpecialOfferProduct', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Sales', 'TABLE', 'SpecialOfferProduct', 'CONSTRAINT', 'FK_SpecialOfferProduct_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SpecialOfferProduct', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOfferProduct', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOfferProduct', 'CONSTRAINT', 'PK_SpecialOfferProduct_SpecialOfferID_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SpecialOfferProduct', 'INDEX', 'PK_SpecialOfferProduct_SpecialOfferID_ProductID'
go

create unique index AK_SpecialOfferProduct_rowguid
    on Sales.SpecialOfferProduct (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SpecialOfferProduct', 'INDEX', 'AK_SpecialOfferProduct_rowguid'
go

create index IX_SpecialOfferProduct_ProductID
    on Sales.SpecialOfferProduct (ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'SpecialOfferProduct',
     'INDEX', 'IX_SpecialOfferProduct_ProductID'
go

