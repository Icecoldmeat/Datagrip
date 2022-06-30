create table Production.WorkOrder
(
    WorkOrderID   int identity
        constraint PK_WorkOrder_WorkOrderID
            primary key,
    ProductID     int                                          not null
        constraint FK_WorkOrder_Product_ProductID
            references Production.Product,
    OrderQty      int                                          not null
        constraint CK_WorkOrder_OrderQty
            check ([OrderQty] > 0),
    StockedQty    as isnull([OrderQty] - [ScrappedQty], 0),
    ScrappedQty   smallint                                     not null
        constraint CK_WorkOrder_ScrappedQty
            check ([ScrappedQty] >= 0),
    StartDate     datetime                                     not null,
    EndDate       datetime,
    DueDate       datetime                                     not null,
    ScrapReasonID smallint
        constraint FK_WorkOrder_ScrapReason_ScrapReasonID
            references Production.ScrapReason,
    ModifiedDate  datetime
        constraint DF_WorkOrder_ModifiedDate default getdate() not null,
    constraint CK_WorkOrder_EndDate
        check ([EndDate] >= [StartDate] OR [EndDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'Manufacturing work orders.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrder'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for WorkOrder records.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'COLUMN', 'WorkOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'CONSTRAINT', 'PK_WorkOrder_WorkOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrder', 'INDEX', 'PK_WorkOrder_WorkOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'WorkOrder', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrder', 'CONSTRAINT', 'FK_WorkOrder_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Product quantity to build.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'COLUMN', 'OrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [OrderQty] > (0)', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'CONSTRAINT', 'CK_WorkOrder_OrderQty'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity built and put in inventory.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'COLUMN', 'StockedQty'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity that failed inspection.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'COLUMN', 'ScrappedQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ScrappedQty] >= (0)', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'CONSTRAINT', 'CK_WorkOrder_ScrappedQty'
go

exec sp_addextendedproperty 'MS_Description', 'Work order start date.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrder',
     'COLUMN', 'StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Work order end date.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrder',
     'COLUMN', 'EndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Work order due date.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrder',
     'COLUMN', 'DueDate'
go

exec sp_addextendedproperty 'MS_Description', 'Reason for inspection failure.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrder', 'COLUMN', 'ScrapReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ScrapReason.ScrapReasonID.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrder', 'CONSTRAINT', 'FK_WorkOrder_ScrapReason_ScrapReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'WorkOrder', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL',
     'SCHEMA', 'Production', 'TABLE', 'WorkOrder', 'CONSTRAINT', 'CK_WorkOrder_EndDate'
go

create index IX_WorkOrder_ScrapReasonID
    on Production.WorkOrder (ScrapReasonID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrder',
     'INDEX', 'IX_WorkOrder_ScrapReasonID'
go

create index IX_WorkOrder_ProductID
    on Production.WorkOrder (ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrder',
     'INDEX', 'IX_WorkOrder_ProductID'
go

