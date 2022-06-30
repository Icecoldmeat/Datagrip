create table Purchasing.PurchaseOrderHeader
(
    PurchaseOrderID int identity
        constraint PK_PurchaseOrderHeader_PurchaseOrderID
            primary key,
    RevisionNumber  tinyint
        constraint DF_PurchaseOrderHeader_RevisionNumber default 0       not null,
    Status          tinyint
        constraint DF_PurchaseOrderHeader_Status default 1               not null
        constraint CK_PurchaseOrderHeader_Status
            check ([Status] >= 1 AND [Status] <= 4),
    EmployeeID      int                                                  not null
        constraint FK_PurchaseOrderHeader_Employee_EmployeeID
            references HumanResources.Employee,
    VendorID        int                                                  not null
        constraint FK_PurchaseOrderHeader_Vendor_VendorID
            references Purchasing.Vendor,
    ShipMethodID    int                                                  not null
        constraint FK_PurchaseOrderHeader_ShipMethod_ShipMethodID
            references Purchasing.ShipMethod,
    OrderDate       datetime
        constraint DF_PurchaseOrderHeader_OrderDate default getdate()    not null,
    ShipDate        datetime,
    SubTotal        money
        constraint DF_PurchaseOrderHeader_SubTotal default 0.00          not null
        constraint CK_PurchaseOrderHeader_SubTotal
            check ([SubTotal] >= 0.00),
    TaxAmt          money
        constraint DF_PurchaseOrderHeader_TaxAmt default 0.00            not null
        constraint CK_PurchaseOrderHeader_TaxAmt
            check ([TaxAmt] >= 0.00),
    Freight         money
        constraint DF_PurchaseOrderHeader_Freight default 0.00           not null
        constraint CK_PurchaseOrderHeader_Freight
            check ([Freight] >= 0.00),
    TotalDue        as isnull([SubTotal] + [TaxAmt] + [Freight], 0),
    ModifiedDate    datetime
        constraint DF_PurchaseOrderHeader_ModifiedDate default getdate() not null,
    constraint CK_PurchaseOrderHeader_ShipDate
        check ([ShipDate] >= [OrderDate] OR [ShipDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'General purchase order information. See PurchaseOrderDetail.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderHeader'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key.', 'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderHeader',
     'COLUMN', 'PurchaseOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'CONSTRAINT', 'PK_PurchaseOrderHeader_PurchaseOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'INDEX', 'PK_PurchaseOrderHeader_PurchaseOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Incremental number to track changes to the purchase order over time.',
     'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'RevisionNumber'
go

exec sp_addextendedproperty 'MS_Description',
     'Order current status. 1 = Pending; 2 = Approved; 3 = Rejected; 4 = Complete', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'COLUMN', 'Status'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Status] BETWEEN (1) AND (4)', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderHeader', 'CONSTRAINT', 'CK_PurchaseOrderHeader_Status'
go

exec sp_addextendedproperty 'MS_Description',
     'Employee who created the purchase order. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'EmployeeID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'CONSTRAINT', 'FK_PurchaseOrderHeader_Employee_EmployeeID'
go

exec sp_addextendedproperty 'MS_Description',
     'Vendor with whom the purchase order is placed. Foreign key to Vendor.BusinessEntityID.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'VendorID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Vendor.VendorID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'CONSTRAINT', 'FK_PurchaseOrderHeader_Vendor_VendorID'
go

exec sp_addextendedproperty 'MS_Description', 'Shipping method. Foreign key to ShipMethod.ShipMethodID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'ShipMethodID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ShipMethod.ShipMethodID.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'CONSTRAINT', 'FK_PurchaseOrderHeader_ShipMethod_ShipMethodID'
go

exec sp_addextendedproperty 'MS_Description', 'Purchase order creation date.', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'COLUMN', 'OrderDate'
go

exec sp_addextendedproperty 'MS_Description', 'Estimated shipment date from the vendor.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'ShipDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Purchase order subtotal. Computed as SUM(PurchaseOrderDetail.LineTotal)for the appropriate PurchaseOrderID.',
     'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'SubTotal'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SubTotal] >= (0.00)', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'CONSTRAINT', 'CK_PurchaseOrderHeader_SubTotal'
go

exec sp_addextendedproperty 'MS_Description', 'Tax amount.', 'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderHeader',
     'COLUMN', 'TaxAmt'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [TaxAmt] >= (0.00)', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'CONSTRAINT', 'CK_PurchaseOrderHeader_TaxAmt'
go

exec sp_addextendedproperty 'MS_Description', 'Shipping cost.', 'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderHeader',
     'COLUMN', 'Freight'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Freight] >= (0.00)', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'CONSTRAINT', 'CK_PurchaseOrderHeader_Freight'
go

exec sp_addextendedproperty 'MS_Description', 'Total due to vendor. Computed as Subtotal + TaxAmt + Freight.', 'SCHEMA',
     'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'TotalDue'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Purchasing',
     'TABLE', 'PurchaseOrderHeader', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ShipDate] >= [OrderDate] OR [ShipDate] IS NULL',
     'SCHEMA', 'Purchasing', 'TABLE', 'PurchaseOrderHeader', 'CONSTRAINT', 'CK_PurchaseOrderHeader_ShipDate'
go

create index IX_PurchaseOrderHeader_VendorID
    on Purchasing.PurchaseOrderHeader (VendorID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'INDEX', 'IX_PurchaseOrderHeader_VendorID'
go

create index IX_PurchaseOrderHeader_EmployeeID
    on Purchasing.PurchaseOrderHeader (EmployeeID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Purchasing', 'TABLE',
     'PurchaseOrderHeader', 'INDEX', 'IX_PurchaseOrderHeader_EmployeeID'
go

