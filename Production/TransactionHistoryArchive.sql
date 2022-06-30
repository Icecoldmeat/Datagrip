create table Production.TransactionHistoryArchive
(
    TransactionID        int                                                      not null
        constraint PK_TransactionHistoryArchive_TransactionID
            primary key,
    ProductID            int                                                      not null,
    ReferenceOrderID     int                                                      not null,
    ReferenceOrderLineID int
        constraint DF_TransactionHistoryArchive_ReferenceOrderLineID default 0    not null,
    TransactionDate      datetime
        constraint DF_TransactionHistoryArchive_TransactionDate default getdate() not null,
    TransactionType      nchar                                                    not null
        constraint CK_TransactionHistoryArchive_TransactionType
            check (upper([TransactionType]) = 'P' OR upper([TransactionType]) = 'S' OR upper([TransactionType]) = 'W'),
    Quantity             int                                                      not null,
    ActualCost           money                                                    not null,
    ModifiedDate         datetime
        constraint DF_TransactionHistoryArchive_ModifiedDate default getdate()    not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Transactions for previous years.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for TransactionHistoryArchive records.', 'SCHEMA',
     'Production', 'TABLE', 'TransactionHistoryArchive', 'COLUMN', 'TransactionID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive', 'CONSTRAINT', 'PK_TransactionHistoryArchive_TransactionID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'TransactionHistoryArchive', 'INDEX', 'PK_TransactionHistoryArchive_TransactionID'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'TransactionHistoryArchive', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Purchase order, sales order, or work order identification number.',
     'SCHEMA', 'Production', 'TABLE', 'TransactionHistoryArchive', 'COLUMN', 'ReferenceOrderID'
go

exec sp_addextendedproperty 'MS_Description',
     'Line number associated with the purchase order, sales order, or work order.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive', 'COLUMN', 'ReferenceOrderLineID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time of the transaction.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive', 'COLUMN', 'TransactionDate'
go

exec sp_addextendedproperty 'MS_Description', 'W = Work Order, S = Sales Order, P = Purchase Order', 'SCHEMA',
     'Production', 'TABLE', 'TransactionHistoryArchive', 'COLUMN', 'TransactionType'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [TransactionType]=''p'' OR [TransactionType]=''s'' OR [TransactionType]=''w'' OR [TransactionType]=''P'' OR [TransactionType]=''S'' OR [TransactionType]=''W''',
     'SCHEMA', 'Production', 'TABLE', 'TransactionHistoryArchive', 'CONSTRAINT',
     'CK_TransactionHistoryArchive_TransactionType'
go

exec sp_addextendedproperty 'MS_Description', 'Product quantity.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive', 'COLUMN', 'Quantity'
go

exec sp_addextendedproperty 'MS_Description', 'Product cost.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive', 'COLUMN', 'ActualCost'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'TransactionHistoryArchive', 'COLUMN', 'ModifiedDate'
go

create index IX_TransactionHistoryArchive_ProductID
    on Production.TransactionHistoryArchive (ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive', 'INDEX', 'IX_TransactionHistoryArchive_ProductID'
go

create index IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID
    on Production.TransactionHistoryArchive (ReferenceOrderID, ReferenceOrderLineID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'TransactionHistoryArchive', 'INDEX', 'IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID'
go

