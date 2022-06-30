create table Sales.SalesOrderDetail
(
    SalesOrderID          int                                         not null
        constraint FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID
            references Sales.SalesOrderHeader
            on delete cascade,
    SalesOrderDetailID    int identity,
    CarrierTrackingNumber nvarchar(25),
    OrderQty              smallint                                    not null
        constraint CK_SalesOrderDetail_OrderQty
            check ([OrderQty] > 0),
    ProductID             int                                         not null,
    SpecialOfferID        int                                         not null,
    UnitPrice             money                                       not null
        constraint CK_SalesOrderDetail_UnitPrice
            check ([UnitPrice] >= 0.00),
    UnitPriceDiscount     money
        constraint DF_SalesOrderDetail_UnitPriceDiscount default 0.0  not null
        constraint CK_SalesOrderDetail_UnitPriceDiscount
            check ([UnitPriceDiscount] >= 0.00),
    LineTotal             as isnull([UnitPrice] * (1.0 - [UnitPriceDiscount]) * [OrderQty], 0.0),
    rowguid               uniqueidentifier
        constraint DF_SalesOrderDetail_rowguid default newid()        not null,
    ModifiedDate          datetime
        constraint DF_SalesOrderDetail_ModifiedDate default getdate() not null,
    constraint PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID
        primary key (SalesOrderID, SalesOrderDetailID),
    constraint FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID
        foreign key (SpecialOfferID, ProductID) references Sales.SpecialOfferProduct
)
go

exec sp_addextendedproperty 'MS_Description',
     'Individual products associated with a specific sales order. See SalesOrderHeader.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to SalesOrderHeader.SalesOrderID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderDetail', 'COLUMN', 'SalesOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesOrderHeader.PurchaseOrderID.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderDetail', 'CONSTRAINT', 'FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. One incremental unique number per product sold.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderDetail', 'COLUMN', 'SalesOrderDetailID'
go

exec sp_addextendedproperty 'MS_Description', 'Shipment tracking number supplied by the shipper.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderDetail', 'COLUMN', 'CarrierTrackingNumber'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity ordered per product.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'COLUMN', 'OrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [OrderQty] > (0)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'CONSTRAINT', 'CK_SalesOrderDetail_OrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Product sold to customer. Foreign key to Product.ProductID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderDetail', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Promotional code. Foreign key to SpecialOffer.SpecialOfferID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderDetail', 'COLUMN', 'SpecialOfferID'
go

exec sp_addextendedproperty 'MS_Description', 'Selling price of a single product.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'COLUMN', 'UnitPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [UnitPrice] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'CONSTRAINT', 'CK_SalesOrderDetail_UnitPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Discount amount.', 'SCHEMA', 'Sales', 'TABLE', 'SalesOrderDetail',
     'COLUMN', 'UnitPriceDiscount'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [UnitPriceDiscount] >= (0.00)', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderDetail', 'CONSTRAINT', 'CK_SalesOrderDetail_UnitPriceDiscount'
go

exec sp_addextendedproperty 'MS_Description',
     'Per product subtotal. Computed as UnitPrice * (1 - UnitPriceDiscount) * OrderQty.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'COLUMN', 'LineTotal'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderDetail', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'CONSTRAINT', 'PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderDetail', 'INDEX', 'PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID'
go

exec sp_addextendedproperty 'MS_Description',
     'Foreign key constraint referencing SpecialOfferProduct.SpecialOfferIDProductID.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderDetail', 'CONSTRAINT', 'FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID'
go

create unique index AK_SalesOrderDetail_rowguid
    on Sales.SalesOrderDetail (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderDetail', 'INDEX', 'AK_SalesOrderDetail_rowguid'
go

create index IX_SalesOrderDetail_ProductID
    on Sales.SalesOrderDetail (ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'SalesOrderDetail',
     'INDEX', 'IX_SalesOrderDetail_ProductID'
go

