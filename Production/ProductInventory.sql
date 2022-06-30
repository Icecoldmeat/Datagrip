create table Production.ProductInventory
(
    ProductID    int                                                  not null
        constraint FK_ProductInventory_Product_ProductID
            references Production.Product,
    LocationID   smallint                                             not null
        constraint FK_ProductInventory_Location_LocationID
            references Production.Location,
    Shelf        nvarchar(10)                                         not null
        constraint CK_ProductInventory_Shelf
            check ([Shelf] like '[A-Za-z]' OR [Shelf] = 'N/A'),
    Bin          tinyint                                              not null
        constraint CK_ProductInventory_Bin
            check ([Bin] >= 0 AND [Bin] <= 100),
    Quantity     smallint
        constraint DF_ProductInventory_Quantity default 0             not null,
    rowguid      uniqueidentifier
        constraint DF_ProductInventory_rowguid default newid()        not null,
    ModifiedDate datetime
        constraint DF_ProductInventory_ModifiedDate default getdate() not null,
    constraint PK_ProductInventory_ProductID_LocationID
        primary key (ProductID, LocationID)
)
go

exec sp_addextendedproperty 'MS_Description', 'Product inventory information.', 'SCHEMA', 'Production', 'TABLE',
     'ProductInventory'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductInventory', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductInventory', 'CONSTRAINT', 'FK_ProductInventory_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description',
     'Inventory location identification number. Foreign key to Location.LocationID. ', 'SCHEMA', 'Production', 'TABLE',
     'ProductInventory', 'COLUMN', 'LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Location.LocationID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductInventory', 'CONSTRAINT', 'FK_ProductInventory_Location_LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Storage compartment within an inventory location.', 'SCHEMA',
     'Production', 'TABLE', 'ProductInventory', 'COLUMN', 'Shelf'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Shelf] like ''[A-Za-z]'' OR [Shelf]=''N/A''', 'SCHEMA',
     'Production', 'TABLE', 'ProductInventory', 'CONSTRAINT', 'CK_ProductInventory_Shelf'
go

exec sp_addextendedproperty 'MS_Description', 'Storage container on a shelf in an inventory location.', 'SCHEMA',
     'Production', 'TABLE', 'ProductInventory', 'COLUMN', 'Bin'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Bin] BETWEEN (0) AND (100)', 'SCHEMA', 'Production',
     'TABLE', 'ProductInventory', 'CONSTRAINT', 'CK_ProductInventory_Bin'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity of products in the inventory location.', 'SCHEMA', 'Production',
     'TABLE', 'ProductInventory', 'COLUMN', 'Quantity'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Production', 'TABLE', 'ProductInventory', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductInventory', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductInventory', 'CONSTRAINT', 'PK_ProductInventory_ProductID_LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductInventory', 'INDEX', 'PK_ProductInventory_ProductID_LocationID'
go

