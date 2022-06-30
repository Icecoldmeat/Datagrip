create table Purchasing.PurchaseOrderDetail
(
    PurchaseOrderID       int                                            not null
        constraint FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID
            references Purchasing.PurchaseOrderHeader,
    PurchaseOrderDetailID int identity,
    DueDate               datetime                                       not null,
    OrderQty              smallint                                       not null
        constraint CK_PurchaseOrderDetail_OrderQty
            check ([OrderQty] > 0),
    ProductID             int                                            not null
        constraint FK_PurchaseOrderDetail_Product_ProductID
            references Production.Product,
    UnitPrice             money                                          not null
        constraint CK_PurchaseOrderDetail_UnitPrice
            check ([UnitPrice] >= 0.00),
    LineTotal             as isnull([OrderQty] * [UnitPrice], 0.00),
    ReceivedQty           decimal(8, 2)                                  not null
        constraint CK_PurchaseOrderDetail_ReceivedQty
            check ([ReceivedQty] >= 0.00),
    RejectedQty           decimal(8, 2)                                  not null
        constraint CK_PurchaseOrderDetail_RejectedQty
            check ([RejectedQty] >= 0.00),
    StockedQty            as isnull([ReceivedQty] - [RejectedQty], 0.00),
    ModifiedDate          datetime
        constraint DF_PurchaseOrderDetail_ModifiedDate default getdate() not null,
    constraint PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID
        primary key (PurchaseOrderID, PurchaseOrderDetailID)
)
go

exec sp_addextendedproperty 'MS_Description',
     'Individual products associated with a specific purchase order. See PurchaseOrderHeader.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderDetail'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to PurchaseOrderHeader.PurchaseOrderID.',
     'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'PurchaseOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing PurchaseOrderHeader.PurchaseOrderID.',
     'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderDetail', 'CONSTRAINT',
     'FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. One line number per purchased product.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'PurchaseOrderDetailID'
go

exec sp_addextendedproperty 'MS_Description', 'Date the product is expected to be received.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'DueDate'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity ordered.', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderDetail', 'COLUMN', 'OrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [OrderQty] > (0)', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderDetail', 'CONSTRAINT', 'CK_PurchaseOrderDetail_OrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderDetail', 'CONSTRAINT', 'FK_PurchaseOrderDetail_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Vendor''s selling price of a single product.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'UnitPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [UnitPrice] >= (0.00)', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderDetail', 'CONSTRAINT', 'CK_PurchaseOrderDetail_UnitPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Per product subtotal. Computed as OrderQty * UnitPrice.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'LineTotal'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity actually received from the vendor.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'ReceivedQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ReceivedQty] >= (0.00)', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderDetail', 'CONSTRAINT', 'CK_PurchaseOrderDetail_ReceivedQty'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity rejected during inspection.', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderDetail', 'COLUMN', 'RejectedQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [RejectedQty] >= (0.00)', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderDetail', 'CONSTRAINT', 'CK_PurchaseOrderDetail_RejectedQty'
go

exec sp_addextendedproperty 'MS_Description',
     'Quantity accepted into inventory. Computed as ReceivedQty - RejectedQty.', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderDetail', 'COLUMN', 'StockedQty'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderDetail', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderDetail', 'CONSTRAINT', 'PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderDetail', 'INDEX',
     'PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID'
go

create index IX_PurchaseOrderDetail_ProductID
    on Purchasing.PurchaseOrderDetail (ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderDetail', 'INDEX', 'IX_PurchaseOrderDetail_ProductID'
go

