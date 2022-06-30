create table Production.WorkOrderRouting
(
    WorkOrderID        int                                            not null
        constraint FK_WorkOrderRouting_WorkOrder_WorkOrderID
            references Production.WorkOrder,
    ProductID          int                                            not null,
    OperationSequence  smallint                                       not null,
    LocationID         smallint                                       not null
        constraint FK_WorkOrderRouting_Location_LocationID
            references Production.Location,
    ScheduledStartDate datetime                                       not null,
    ScheduledEndDate   datetime                                       not null,
    ActualStartDate    datetime,
    ActualEndDate      datetime,
    ActualResourceHrs  decimal(9, 4)
        constraint CK_WorkOrderRouting_ActualResourceHrs
            check ([ActualResourceHrs] >= 0.0000),
    PlannedCost        money                                          not null
        constraint CK_WorkOrderRouting_PlannedCost
            check ([PlannedCost] > 0.00),
    ActualCost         money
        constraint CK_WorkOrderRouting_ActualCost
            check ([ActualCost] > 0.00),
    ModifiedDate       datetime
        constraint DF_WorkOrderRouting_ModifiedDate default getdate() not null,
    constraint PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence
        primary key (WorkOrderID, ProductID, OperationSequence),
    constraint CK_WorkOrderRouting_ActualEndDate
        check ([ActualEndDate] >= [ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL),
    constraint CK_WorkOrderRouting_ScheduledEndDate
        check ([ScheduledEndDate] >= [ScheduledStartDate])
)
go

exec sp_addextendedproperty 'MS_Description', 'Work order details.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrderRouting'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to WorkOrder.WorkOrderID.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrderRouting', 'COLUMN', 'WorkOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing WorkOrder.WorkOrderID.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrderRouting', 'CONSTRAINT', 'FK_WorkOrderRouting_WorkOrder_WorkOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to Product.ProductID.', 'SCHEMA', 'Production',
     'TABLE', 'WorkOrderRouting', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Indicates the manufacturing process sequence.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrderRouting', 'COLUMN', 'OperationSequence'
go

exec sp_addextendedproperty 'MS_Description',
     'Manufacturing location where the part is processed. Foreign key to Location.LocationID.', 'SCHEMA', 'Production',
     'TABLE', 'WorkOrderRouting', 'COLUMN', 'LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Location.LocationID.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrderRouting', 'CONSTRAINT', 'FK_WorkOrderRouting_Location_LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Planned manufacturing start date.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'COLUMN', 'ScheduledStartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Planned manufacturing end date.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'COLUMN', 'ScheduledEndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Actual start date.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrderRouting',
     'COLUMN', 'ActualStartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Actual end date.', 'SCHEMA', 'Production', 'TABLE', 'WorkOrderRouting',
     'COLUMN', 'ActualEndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Number of manufacturing hours used.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'COLUMN', 'ActualResourceHrs'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ActualResourceHrs] >= (0.0000)', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrderRouting', 'CONSTRAINT', 'CK_WorkOrderRouting_ActualResourceHrs'
go

exec sp_addextendedproperty 'MS_Description', 'Estimated manufacturing cost.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'COLUMN', 'PlannedCost'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [PlannedCost] > (0.00)', 'SCHEMA', 'Production',
     'TABLE', 'WorkOrderRouting', 'CONSTRAINT', 'CK_WorkOrderRouting_PlannedCost'
go

exec sp_addextendedproperty 'MS_Description', 'Actual manufacturing cost.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'COLUMN', 'ActualCost'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ActualCost] > (0.00)', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'CONSTRAINT', 'CK_WorkOrderRouting_ActualCost'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'WorkOrderRouting', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'CONSTRAINT', 'PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrderRouting', 'INDEX', 'PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [ActualEndDate] >= [ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL',
     'SCHEMA', 'Production', 'TABLE', 'WorkOrderRouting', 'CONSTRAINT', 'CK_WorkOrderRouting_ActualEndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ScheduledEndDate] >= [ScheduledStartDate]', 'SCHEMA',
     'Production', 'TABLE', 'WorkOrderRouting', 'CONSTRAINT', 'CK_WorkOrderRouting_ScheduledEndDate'
go

create index IX_WorkOrderRouting_ProductID
    on Production.WorkOrderRouting (ProductID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'WorkOrderRouting', 'INDEX', 'IX_WorkOrderRouting_ProductID'
go

