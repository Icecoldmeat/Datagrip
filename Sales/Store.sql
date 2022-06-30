create table Sales.Store
(
    BusinessEntityID int                                   not null
        constraint PK_Store_BusinessEntityID
            primary key
        constraint FK_Store_BusinessEntity_BusinessEntityID
            references Person.BusinessEntity (BusinessEntityID),
    Name             Name                                  not null,
    SalesPersonID    int
        constraint FK_Store_SalesPerson_SalesPersonID
            references Sales.SalesPerson,
    Demographics     xml,
    rowguid          uniqueidentifier
        constraint DF_Store_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_Store_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Customers (resellers) of Adventure Works products.', 'SCHEMA', 'Sales',
     'TABLE', 'Store'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to Customer.BusinessEntityID.', 'SCHEMA',
     'Sales', 'TABLE', 'Store', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE', 'Store',
     'CONSTRAINT', 'PK_Store_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'Store', 'INDEX', 'PK_Store_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing BusinessEntity.BusinessEntityID',
     'SCHEMA', 'Sales', 'TABLE', 'Store', 'CONSTRAINT', 'FK_Store_BusinessEntity_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Name of the store.', 'SCHEMA', 'Sales', 'TABLE', 'Store', 'COLUMN',
     'Name'
go

exec sp_addextendedproperty 'MS_Description',
     'ID of the sales person assigned to the customer. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', 'Sales',
     'TABLE', 'Store', 'COLUMN', 'SalesPersonID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesPerson.SalesPersonID', 'SCHEMA',
     'Sales', 'TABLE', 'Store', 'CONSTRAINT', 'FK_Store_SalesPerson_SalesPersonID'
go

exec sp_addextendedproperty 'MS_Description',
     'Demographic informationg about the store such as the number of employees, annual sales and store type.', 'SCHEMA',
     'Sales', 'TABLE', 'Store', 'COLUMN', 'Demographics'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'Store', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'Store', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Store_rowguid
    on Sales.Store (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'Store', 'INDEX', 'AK_Store_rowguid'
go

create index IX_Store_SalesPersonID
    on Sales.Store (SalesPersonID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'Store', 'INDEX',
     'IX_Store_SalesPersonID'
go

create index PXML_Store_Demographics
    on Sales.Store (Demographics)
go

exec sp_addextendedproperty 'MS_Description', 'Primary XML index.', 'SCHEMA', 'Sales', 'TABLE', 'Store', 'INDEX',
     'PXML_Store_Demographics'
go

