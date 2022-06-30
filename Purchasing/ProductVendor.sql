create table Purchasing.ProductVendor
(
    ProductID        int                                           not null
        constraint FK_ProductVendor_Product_ProductID
            references Production.Product,
    BusinessEntityID int                                           not null
        constraint FK_ProductVendor_Vendor_BusinessEntityID
            references Purchasing.Vendor,
    AverageLeadTime  int                                           not null
        constraint CK_ProductVendor_AverageLeadTime
            check ([AverageLeadTime] >= 1),
    StandardPrice    money                                         not null
        constraint CK_ProductVendor_StandardPrice
            check ([StandardPrice] > 0.00),
    LastReceiptCost  money
        constraint CK_ProductVendor_LastReceiptCost
            check ([LastReceiptCost] > 0.00),
    LastReceiptDate  datetime,
    MinOrderQty      int                                           not null
        constraint CK_ProductVendor_MinOrderQty
            check ([MinOrderQty] >= 1),
    MaxOrderQty      int                                           not null
        constraint CK_ProductVendor_MaxOrderQty
            check ([MaxOrderQty] >= 1),
    OnOrderQty       int
        constraint CK_ProductVendor_OnOrderQty
            check ([OnOrderQty] >= 0),
    UnitMeasureCode  nchar(3)                                      not null
        constraint FK_ProductVendor_UnitMeasure_UnitMeasureCode
            references Production.UnitMeasure,
    ModifiedDate     datetime
        constraint DF_ProductVendor_ModifiedDate default getdate() not null,
    constraint PK_ProductVendor_ProductID_BusinessEntityID
        primary key (ProductID, BusinessEntityID)
)
go

exec sp_addextendedproperty 'MS_Description', 'Cross-reference table mapping vendors with the products they supply.',
     'SCHEMA', 'Purchasing', 'TABLE', 'ProductVendor'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to Product.ProductID.', 'SCHEMA', 'Purchasing',
     'TABLE', 'ProductVendor', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'ProductVendor', 'CONSTRAINT', 'FK_ProductVendor_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to Vendor.BusinessEntityID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'ProductVendor', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Vendor.BusinessEntityID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'ProductVendor', 'CONSTRAINT', 'FK_ProductVendor_Vendor_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'The average span of time (in days) between placing an order with the vendor and receiving the purchased product.',
     'SCHEMA', 'Purchasing', 'TABLE', 'ProductVendor', 'COLUMN', 'AverageLeadTime'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [AverageLeadTime] >= (1)', 'SCHEMA', 'Purchasing',
     'TABLE', 'ProductVendor', 'CONSTRAINT', 'CK_ProductVendor_AverageLeadTime'
go

exec sp_addextendedproperty 'MS_Description', 'The vendor''s usual selling price.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'COLUMN', 'StandardPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [StandardPrice] > (0.00)', 'SCHEMA', 'Purchasing',
     'TABLE', 'ProductVendor', 'CONSTRAINT', 'CK_ProductVendor_StandardPrice'
go

exec sp_addextendedproperty 'MS_Description', 'The selling price when last purchased.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'COLUMN', 'LastReceiptCost'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [LastReceiptCost] > (0.00)', 'SCHEMA', 'Purchasing',
     'TABLE', 'ProductVendor', 'CONSTRAINT', 'CK_ProductVendor_LastReceiptCost'
go

exec sp_addextendedproperty 'MS_Description', 'Date the product was last received by the vendor.', 'SCHEMA',
     'Purchasing', 'TABLE', 'ProductVendor', 'COLUMN', 'LastReceiptDate'
go

exec sp_addextendedproperty 'MS_Description', 'The maximum quantity that should be ordered.', 'SCHEMA', 'Purchasing',
     'TABLE', 'ProductVendor', 'COLUMN', 'MinOrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [MinOrderQty] >= (1)', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'CONSTRAINT', 'CK_ProductVendor_MinOrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'The minimum quantity that should be ordered.', 'SCHEMA', 'Purchasing',
     'TABLE', 'ProductVendor', 'COLUMN', 'MaxOrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [MaxOrderQty] >= (1)', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'CONSTRAINT', 'CK_ProductVendor_MaxOrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'The quantity currently on order.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'COLUMN', 'OnOrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [OnOrderQty] >= (0)', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'CONSTRAINT', 'CK_ProductVendor_OnOrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'The product''s unit of measure.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'COLUMN', 'UnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.',
     'SCHEMA', 'Purchasing', 'TABLE', 'ProductVendor', 'CONSTRAINT', 'FK_ProductVendor_UnitMeasure_UnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Purchasing',
     'TABLE', 'ProductVendor', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Purchasing', 'TABLE',
     'ProductVendor', 'CONSTRAINT', 'PK_ProductVendor_ProductID_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Purchasing', 'TABLE', 'ProductVendor', 'INDEX', 'PK_ProductVendor_ProductID_BusinessEntityID'
go

create index IX_ProductVendor_UnitMeasureCode
    on Purchasing.ProductVendor (UnitMeasureCode)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Purchasing', 'TABLE', 'ProductVendor',
     'INDEX', 'IX_ProductVendor_UnitMeasureCode'
go

create index IX_ProductVendor_BusinessEntityID
    on Purchasing.ProductVendor (BusinessEntityID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Purchasing', 'TABLE', 'ProductVendor',
     'INDEX', 'IX_ProductVendor_BusinessEntityID'
go

