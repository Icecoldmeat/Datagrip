create table Sales.SalesOrderHeader
(
    SalesOrderID           int identity
        constraint PK_SalesOrderHeader_SalesOrderID
            primary key,
    RevisionNumber         tinyint
        constraint DF_SalesOrderHeader_RevisionNumber default 0       not null,
    OrderDate              datetime
        constraint DF_SalesOrderHeader_OrderDate default getdate()    not null,
    DueDate                datetime                                   not null,
    ShipDate               datetime,
    Status                 tinyint
        constraint DF_SalesOrderHeader_Status default 1               not null
        constraint CK_SalesOrderHeader_Status
            check ([Status] >= 0 AND [Status] <= 8),
    OnlineOrderFlag        Flag
        constraint DF_SalesOrderHeader_OnlineOrderFlag default 1      not null,
    SalesOrderNumber       as isnull(N'SO' + CONVERT([nvarchar](23), [SalesOrderID]), N'*** ERROR ***'),
    PurchaseOrderNumber    OrderNumber,
    AccountNumber          AccountNumber,
    CustomerID             int                                        not null
        constraint FK_SalesOrderHeader_Customer_CustomerID
            references Sales.Customer,
    SalesPersonID          int
        constraint FK_SalesOrderHeader_SalesPerson_SalesPersonID
            references Sales.SalesPerson,
    TerritoryID            int
        constraint FK_SalesOrderHeader_SalesTerritory_TerritoryID
            references Sales.SalesTerritory,
    BillToAddressID        int                                        not null
        constraint FK_SalesOrderHeader_Address_BillToAddressID
            references Person.Address (AddressID),
    ShipToAddressID        int                                        not null
        constraint FK_SalesOrderHeader_Address_ShipToAddressID
            references Person.Address (AddressID),
    ShipMethodID           int                                        not null
        constraint FK_SalesOrderHeader_ShipMethod_ShipMethodID
            references Purchasing.ShipMethod,
    CreditCardID           int
        constraint FK_SalesOrderHeader_CreditCard_CreditCardID
            references Sales.CreditCard,
    CreditCardApprovalCode varchar(15),
    CurrencyRateID         int
        constraint FK_SalesOrderHeader_CurrencyRate_CurrencyRateID
            references Sales.CurrencyRate,
    SubTotal               money
        constraint DF_SalesOrderHeader_SubTotal default 0.00          not null
        constraint CK_SalesOrderHeader_SubTotal
            check ([SubTotal] >= 0.00),
    TaxAmt                 money
        constraint DF_SalesOrderHeader_TaxAmt default 0.00            not null
        constraint CK_SalesOrderHeader_TaxAmt
            check ([TaxAmt] >= 0.00),
    Freight                money
        constraint DF_SalesOrderHeader_Freight default 0.00           not null
        constraint CK_SalesOrderHeader_Freight
            check ([Freight] >= 0.00),
    TotalDue               as isnull([SubTotal] + [TaxAmt] + [Freight], 0),
    Comment                nvarchar(128),
    rowguid                uniqueidentifier
        constraint DF_SalesOrderHeader_rowguid default newid()        not null,
    ModifiedDate           datetime
        constraint DF_SalesOrderHeader_ModifiedDate default getdate() not null,
    constraint CK_SalesOrderHeader_DueDate
        check ([DueDate] >= [OrderDate]),
    constraint CK_SalesOrderHeader_ShipDate
        check ([ShipDate] >= [OrderDate] OR [ShipDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'General sales order information.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key.', 'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN',
     'SalesOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'CONSTRAINT', 'PK_SalesOrderHeader_SalesOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderHeader', 'INDEX', 'PK_SalesOrderHeader_SalesOrderID'
go

exec sp_addextendedproperty 'MS_Description', 'Incremental number to track changes to the sales order over time.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'RevisionNumber'
go

exec sp_addextendedproperty 'MS_Description', 'Dates the sales order was created.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'OrderDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date the order is due to the customer.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'DueDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date the order was shipped to the customer.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'ShipDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Order current status. 1 = In process; 2 = Approved; 3 = Backordered; 4 = Rejected; 5 = Shipped; 6 = Cancelled',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'Status'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Status] BETWEEN (0) AND (8)', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'CK_SalesOrderHeader_Status'
go

exec sp_addextendedproperty 'MS_Description', '0 = Order placed by sales person. 1 = Order placed online by customer.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'OnlineOrderFlag'
go

exec sp_addextendedproperty 'MS_Description', 'Unique sales order identification number.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'SalesOrderNumber'
go

exec sp_addextendedproperty 'MS_Description', 'Customer purchase order number reference. ', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'PurchaseOrderNumber'
go

exec sp_addextendedproperty 'MS_Description', 'Financial accounting number reference.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'AccountNumber'
go

exec sp_addextendedproperty 'MS_Description',
     'Customer identification number. Foreign key to Customer.BusinessEntityID.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'CustomerID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Customer.CustomerID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_Customer_CustomerID'
go

exec sp_addextendedproperty 'MS_Description',
     'Sales person who created the sales order. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderHeader', 'COLUMN', 'SalesPersonID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesPerson.SalesPersonID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_SalesPerson_SalesPersonID'
go

exec sp_addextendedproperty 'MS_Description',
     'Territory in which the sale was made. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderHeader', 'COLUMN', 'TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesTerritory.TerritoryID.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_SalesTerritory_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Customer billing address. Foreign key to Address.AddressID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'BillToAddressID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Address.AddressID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_Address_BillToAddressID'
go

exec sp_addextendedproperty 'MS_Description', 'Customer shipping address. Foreign key to Address.AddressID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'ShipToAddressID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Address.AddressID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_Address_ShipToAddressID'
go

exec sp_addextendedproperty 'MS_Description', 'Shipping method. Foreign key to ShipMethod.ShipMethodID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'ShipMethodID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ShipMethod.ShipMethodID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_ShipMethod_ShipMethodID'
go

exec sp_addextendedproperty 'MS_Description',
     'Credit card identification number. Foreign key to CreditCard.CreditCardID.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing CreditCard.CreditCardID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_CreditCard_CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Approval code provided by the credit card company.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderHeader', 'COLUMN', 'CreditCardApprovalCode'
go

exec sp_addextendedproperty 'MS_Description',
     'Currency exchange rate used. Foreign key to CurrencyRate.CurrencyRateID.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'CurrencyRateID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing CurrencyRate.CurrencyRateID.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID'
go

exec sp_addextendedproperty 'MS_Description',
     'Sales subtotal. Computed as SUM(SalesOrderDetail.LineTotal)for the appropriate SalesOrderID.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesOrderHeader', 'COLUMN', 'SubTotal'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SubTotal] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'CONSTRAINT', 'CK_SalesOrderHeader_SubTotal'
go

exec sp_addextendedproperty 'MS_Description', 'Tax amount.', 'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN',
     'TaxAmt'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [TaxAmt] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'CONSTRAINT', 'CK_SalesOrderHeader_TaxAmt'
go

exec sp_addextendedproperty 'MS_Description', 'Shipping cost.', 'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader',
     'COLUMN', 'Freight'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Freight] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'CONSTRAINT', 'CK_SalesOrderHeader_Freight'
go

exec sp_addextendedproperty 'MS_Description', 'Total due from customer. Computed as Subtotal + TaxAmt + Freight.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'TotalDue'
go

exec sp_addextendedproperty 'MS_Description', 'Sales representative comments.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'Comment'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesOrderHeader', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [DueDate] >= [OrderDate]', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'CONSTRAINT', 'CK_SalesOrderHeader_DueDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ShipDate] >= [OrderDate] OR [ShipDate] IS NULL',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'CONSTRAINT', 'CK_SalesOrderHeader_ShipDate'
go

create unique index AK_SalesOrderHeader_rowguid
    on Sales.SalesOrderHeader (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader', 'INDEX', 'AK_SalesOrderHeader_rowguid'
go

create unique index AK_SalesOrderHeader_SalesOrderNumber
    on Sales.SalesOrderHeader (SalesOrderNumber)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesOrderHeader', 'INDEX', 'AK_SalesOrderHeader_SalesOrderNumber'
go

create index IX_SalesOrderHeader_CustomerID
    on Sales.SalesOrderHeader (CustomerID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader',
     'INDEX', 'IX_SalesOrderHeader_CustomerID'
go

create index IX_SalesOrderHeader_SalesPersonID
    on Sales.SalesOrderHeader (SalesPersonID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'SalesOrderHeader',
     'INDEX', 'IX_SalesOrderHeader_SalesPersonID'
go

