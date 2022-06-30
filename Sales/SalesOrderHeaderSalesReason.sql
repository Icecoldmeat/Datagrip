create table Sales.SalesOrderHeaderSalesReason
(
    SalesOrderID  int                                                            not null
        constraint FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID
            references Sales.SalesOrderHeader
            on delete cascade,
    SalesReasonID int                                                            not null
        constraint FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID
            references Sales.SalesReason,
    ModifiedDate  datetime
        constraint DF_SalesOrderHeaderSalesReason_ModifiedDate default getdate() not null,
    constraint PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID
        primary key (SalesOrderID, SalesReasonID)
)
go

exec sp_addextendedproperty 'MS_Description', 'Cross-reference table mapping sales orders to sales reason codes.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeaderSalesReason'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to SalesOrderHeader.SalesOrderID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeaderSalesReason', 'COLUMN', 'SalesOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesOrderHeader.SalesOrderID.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeaderSalesReason', 'CONSTRAINT',
     'FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to SalesReason.SalesReasonID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeaderSalesReason', 'COLUMN', 'SalesReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesReason.SalesReasonID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeaderSalesReason', 'CONSTRAINT',
     'FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeaderSalesReason', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeaderSalesReason', 'CONSTRAINT', 'PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderHeaderSalesReason', 'INDEX', 'PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID'
go

