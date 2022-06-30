create table Production.ProductCategory
(
    ProductCategoryID int identity
        constraint PK_ProductCategory_ProductCategoryID
            primary key,
    Name              Name                                           not null,
    rowguid           uniqueidentifier
        constraint DF_ProductCategory_rowguid default newid()        not null,
    ModifiedDate      datetime
        constraint DF_ProductCategory_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'High-level product categorization.', 'SCHEMA', 'Production', 'TABLE',
     'ProductCategory'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ProductCategory records.', 'SCHEMA', 'Production',
     'TABLE', 'ProductCategory', 'COLUMN', 'ProductCategoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductCategory', 'CONSTRAINT', 'PK_ProductCategory_ProductCategoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductCategory', 'INDEX', 'PK_ProductCategory_ProductCategoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Category description.', 'SCHEMA', 'Production', 'TABLE',
     'ProductCategory', 'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Production', 'TABLE', 'ProductCategory', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductCategory', 'COLUMN', 'ModifiedDate'
go

create unique index AK_ProductCategory_Name
    on Production.ProductCategory (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'ProductCategory', 'INDEX', 'AK_ProductCategory_Name'
go

create unique index AK_ProductCategory_rowguid
    on Production.ProductCategory (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Production', 'TABLE', 'ProductCategory', 'INDEX', 'AK_ProductCategory_rowguid'
go

