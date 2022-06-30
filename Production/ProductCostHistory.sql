create table Production.ProductCostHistory
(
    ProductID    int                                                    not null
        constraint FK_ProductCostHistory_Product_ProductID
            references Production.Product,
    StartDate    datetime                                               not null,
    EndDate      datetime,
    StandardCost money                                                  not null
        constraint CK_ProductCostHistory_StandardCost
            check ([StandardCost] >= 0.00),
    ModifiedDate datetime
        constraint DF_ProductCostHistory_ModifiedDate default getdate() not null,
    constraint PK_ProductCostHistory_ProductID_StartDate
        primary key (ProductID, StartDate),
    constraint CK_ProductCostHistory_EndDate
        check ([EndDate] >= [StartDate] OR [EndDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'Changes in the cost of a product over time.', 'SCHEMA', 'Production',
     'TABLE', 'ProductCostHistory'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID',
     'SCHEMA', 'Production', 'TABLE', 'ProductCostHistory', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductCostHistory', 'CONSTRAINT', 'FK_ProductCostHistory_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Product cost start date.', 'SCHEMA', 'Production', 'TABLE',
     'ProductCostHistory', 'COLUMN', 'StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Product cost end date.', 'SCHEMA', 'Production', 'TABLE',
     'ProductCostHistory', 'COLUMN', 'EndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Standard cost of the product.', 'SCHEMA', 'Production', 'TABLE',
     'ProductCostHistory', 'COLUMN', 'StandardCost'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [StandardCost] >= (0.00)', 'SCHEMA', 'Production',
     'TABLE', 'ProductCostHistory', 'CONSTRAINT', 'CK_ProductCostHistory_StandardCost'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductCostHistory', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductCostHistory', 'CONSTRAINT', 'PK_ProductCostHistory_ProductID_StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductCostHistory', 'INDEX', 'PK_ProductCostHistory_ProductID_StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL',
     'SCHEMA', 'Production', 'TABLE', 'ProductCostHistory', 'CONSTRAINT', 'CK_ProductCostHistory_EndDate'
go

