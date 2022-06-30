create table Production.TransactionHistory
(
    TransactionID        int identity (100000, 1)
        constraint PK_TransactionHistory_TransactionID
            primary key,
    ProductID            int                                               not null
        constraint FK_TransactionHistory_Product_ProductID
            references Production.Product,
    ReferenceOrderID     int                                               not null,
    ReferenceOrderLineID int
        constraint DF_TransactionHistory_ReferenceOrderLineID default 0    not null,
    TransactionDate      datetime
        constraint DF_TransactionHistory_TransactionDate default getdate() not null,
    TransactionType      nchar                                             not null
        constraint CK_TransactionHistory_TransactionType
            check (upper([TransactionType]) = 'P' OR upper([TransactionType]) = 'S' OR upper([TransactionType]) = 'W'),
    Quantity             int                                               not null,
    ActualCost           money                                             not null,
    ModifiedDate         datetime
        constraint DF_TransactionHistory_ModifiedDate default getdate()    not null
)
go

exec sp_addextendedproperty 'MS_Description',
     'Record of each purchase order, sales order, or work order transaction year to date.', 'SCHEMA', 'Production',
     'TABLE', 'TransactionHistory'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for TransactionHistory records.', 'SCHEMA', 'Production',
     'TABLE', 'TransactionHistory', 'COLUMN', 'TransactionID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistory', 'CONSTRAINT', 'PK_TransactionHistory_TransactionID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'TransactionHistory', 'INDEX', 'PK_TransactionHistory_TransactionID'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'TransactionHistory', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'TransactionHistory', 'CONSTRAINT', 'FK_TransactionHistory_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Purchase order, sales order, or work order identification number.',
     'SCHEMA', 'Production', 'TABLE', 'TransactionHistory', 'COLUMN', 'ReferenceOrderID'
go

exec sp_addextendedproperty 'MS_Description',
     'Line number associated with the purchase order, sales order, or work order.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistory', 'COLUMN', 'ReferenceOrderLineID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time of the transaction.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistory', 'COLUMN', 'TransactionDate'
go

exec sp_addextendedproperty 'MS_Description', 'W = WorkOrder, S = SalesOrder, P = PurchaseOrder', 'SCHEMA',
     'Production', 'TABLE', 'TransactionHistory', 'COLUMN', 'TransactionType'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [TransactionType]=''p'' OR [TransactionType]=''s'' OR [TransactionType]=''w'' OR [TransactionType]=''P'' OR [TransactionType]=''S'' OR [TransactionType]=''W'')',
     'SCHEMA', 'Production', 'TABLE', 'TransactionHistory', 'CONSTRAINT', 'CK_TransactionHistory_TransactionType'
go

exec sp_addextendedproperty 'MS_Description', 'Product quantity.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistory', 'COLUMN', 'Quantity'
go

exec sp_addextendedproperty 'MS_Description', 'Product cost.', 'SCHEMA', 'Production', 'TABLE', 'TransactionHistory',
     'COLUMN', 'ActualCost'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'TransactionHistory', 'COLUMN', 'ModifiedDate'
go

create index IX_TransactionHistory_ProductID
    on Production.TransactionHistory (ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistory', 'INDEX', 'IX_TransactionHistory_ProductID'
go

create index IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID
    on Production.TransactionHistory (ReferenceOrderID, ReferenceOrderLineID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistory', 'INDEX', 'IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID'
go

