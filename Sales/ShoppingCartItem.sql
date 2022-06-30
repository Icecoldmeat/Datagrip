create table Sales.ShoppingCartItem
(
    ShoppingCartItemID int identity
        constraint PK_ShoppingCartItem_ShoppingCartItemID
            primary key,
    ShoppingCartID     nvarchar(50)                                   not null,
    Quantity           int
        constraint DF_ShoppingCartItem_Quantity default 1             not null
        constraint CK_ShoppingCartItem_Quantity
            check ([Quantity] >= 1),
    ProductID          int                                            not null
        constraint FK_ShoppingCartItem_Product_ProductID
            references Production.Product,
    DateCreated        datetime
        constraint DF_ShoppingCartItem_DateCreated default getdate()  not null,
    ModifiedDate       datetime
        constraint DF_ShoppingCartItem_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description',
     'Contains online customer orders until the order is submitted or cancelled.', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ShoppingCartItem records.', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem', 'COLUMN', 'ShoppingCartItemID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem', 'CONSTRAINT', 'PK_ShoppingCartItem_ShoppingCartItemID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'ShoppingCartItem', 'INDEX', 'PK_ShoppingCartItem_ShoppingCartItemID'
go

exec sp_addextendedproperty 'MS_Description', 'Shopping cart identification number.', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem', 'COLUMN', 'ShoppingCartID'
go

exec sp_addextendedproperty 'MS_Description', 'Product quantity ordered.', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem', 'COLUMN', 'Quantity'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Quantity] >= (1)', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem', 'CONSTRAINT', 'CK_ShoppingCartItem_Quantity'
go

exec sp_addextendedproperty 'MS_Description', 'Product ordered. Foreign key to Product.ProductID.', 'SCHEMA', 'Sales',
     'TABLE', 'ShoppingCartItem', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Sales', 'TABLE', 'ShoppingCartItem', 'CONSTRAINT', 'FK_ShoppingCartItem_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Date the time the record was created.', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem', 'COLUMN', 'DateCreated'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'ShoppingCartItem', 'COLUMN', 'ModifiedDate'
go

create index IX_ShoppingCartItem_ShoppingCartID_ProductID
    on Sales.ShoppingCartItem (ShoppingCartID, ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'ShoppingCartItem',
     'INDEX', 'IX_ShoppingCartItem_ShoppingCartID_ProductID'
go

