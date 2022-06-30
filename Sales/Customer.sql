create table Sales.Customer
(
    CustomerID    int identity
        constraint PK_Customer_CustomerID
            primary key,
    PersonID      int
        constraint FK_Customer_Person_PersonID
            references Person.Person (BusinessEntityID),
    StoreID       int
        constraint FK_Customer_Store_StoreID
            references Sales.Store,
    TerritoryID   int
        constraint FK_Customer_SalesTerritory_TerritoryID
            references Sales.SalesTerritory,
    AccountNumber as isnull('AW' + [dbo].[ufnLeadingZeros]([CustomerID]), ''),
    rowguid       uniqueidentifier
        constraint DF_Customer_rowguid default newid()        not null,
    ModifiedDate  datetime
        constraint DF_Customer_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Current customer information. Also see the Person and Store tables.',
     'SCHEMA', 'Sales', 'TABLE', 'Customer'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key.', 'SCHEMA', 'Sales', 'TABLE', 'Customer', 'COLUMN',
     'CustomerID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'Customer', 'CONSTRAINT', 'PK_Customer_CustomerID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'Customer', 'INDEX', 'PK_Customer_CustomerID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key to Person.BusinessEntityID', 'SCHEMA', 'Sales', 'TABLE',
     'Customer', 'COLUMN', 'PersonID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA',
     'Sales', 'TABLE', 'Customer', 'CONSTRAINT', 'FK_Customer_Person_PersonID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key to Store.BusinessEntityID', 'SCHEMA', 'Sales', 'TABLE',
     'Customer', 'COLUMN', 'StoreID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Store.BusinessEntityID.', 'SCHEMA',
     'Sales', 'TABLE', 'Customer', 'CONSTRAINT', 'FK_Customer_Store_StoreID'
go

exec sp_addextendedproperty 'MS_Description',
     'ID of the territory in which the customer is located. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA',
     'Sales', 'TABLE', 'Customer', 'COLUMN', 'TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesTerritory.TerritoryID.',
     'SCHEMA', 'Sales', 'TABLE', 'Customer', 'CONSTRAINT', 'FK_Customer_SalesTerritory_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description',
     'Unique number identifying the customer assigned by the accounting system.', 'SCHEMA', 'Sales', 'TABLE',
     'Customer', 'COLUMN', 'AccountNumber'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'Customer', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'Customer', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Customer_rowguid
    on Sales.Customer (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'Customer', 'INDEX', 'AK_Customer_rowguid'
go

create unique index AK_Customer_AccountNumber
    on Sales.Customer (AccountNumber)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'Customer',
     'INDEX', 'AK_Customer_AccountNumber'
go

create index IX_Customer_TerritoryID
    on Sales.Customer (TerritoryID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'Customer', 'INDEX',
     'IX_Customer_TerritoryID'
go

