create table Production.ProductListPriceHistory
(
    ProductID    int                                                         not null
        constraint FK_ProductListPriceHistory_Product_ProductID
            references Production.Product,
    StartDate    datetime                                                    not null,
    EndDate      datetime,
    ListPrice    money                                                       not null
        constraint CK_ProductListPriceHistory_ListPrice
            check ([ListPrice] > 0.00),
    ModifiedDate datetime
        constraint DF_ProductListPriceHistory_ModifiedDate default getdate() not null,
    constraint PK_ProductListPriceHistory_ProductID_StartDate
        primary key (ProductID, StartDate),
    constraint CK_ProductListPriceHistory_EndDate
        check ([EndDate] >= [StartDate] OR [EndDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'Changes in the list price of a product over time.', 'SCHEMA',
     'Production', 'TABLE', 'ProductListPriceHistory'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID',
     'SCHEMA', 'Production', 'TABLE', 'ProductListPriceHistory', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductListPriceHistory', 'CONSTRAINT', 'FK_ProductListPriceHistory_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'List price start date.', 'SCHEMA', 'Production', 'TABLE',
     'ProductListPriceHistory', 'COLUMN', 'StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'List price end date', 'SCHEMA', 'Production', 'TABLE',
     'ProductListPriceHistory', 'COLUMN', 'EndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Product list price.', 'SCHEMA', 'Production', 'TABLE',
     'ProductListPriceHistory', 'COLUMN', 'ListPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ListPrice] > (0.00)', 'SCHEMA', 'Production', 'TABLE',
     'ProductListPriceHistory', 'CONSTRAINT', 'CK_ProductListPriceHistory_ListPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductListPriceHistory', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductListPriceHistory', 'CONSTRAINT', 'PK_ProductListPriceHistory_ProductID_StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductListPriceHistory', 'INDEX', 'PK_ProductListPriceHistory_ProductID_StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL',
     'SCHEMA', 'Production', 'TABLE', 'ProductListPriceHistory', 'CONSTRAINT', 'CK_ProductListPriceHistory_EndDate'
go

