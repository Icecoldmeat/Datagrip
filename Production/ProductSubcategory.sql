create table Production.ProductSubcategory
(
    ProductSubcategoryID int identity
        constraint PK_ProductSubcategory_ProductSubcategoryID
            primary key,
    ProductCategoryID    int                                            not null
        constraint FK_ProductSubcategory_ProductCategory_ProductCategoryID
            references Production.ProductCategory,
    Name                 Name                                           not null,
    rowguid              uniqueidentifier
        constraint DF_ProductSubcategory_rowguid default newid()        not null,
    ModifiedDate         datetime
        constraint DF_ProductSubcategory_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Product subcategories. See ProductCategory table.', 'SCHEMA',
     'Production', 'TABLE', 'ProductSubcategory'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ProductSubcategory records.', 'SCHEMA', 'Production',
     'TABLE', 'ProductSubcategory', 'COLUMN', 'ProductSubcategoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductSubcategory', 'CONSTRAINT', 'PK_ProductSubcategory_ProductSubcategoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductSubcategory', 'INDEX', 'PK_ProductSubcategory_ProductSubcategoryID'
go

exec sp_addextendedproperty 'MS_Description',
     'Product category identification number. Foreign key to ProductCategory.ProductCategoryID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductSubcategory', 'COLUMN', 'ProductCategoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ProductCategory.ProductCategoryID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductSubcategory', 'CONSTRAINT',
     'FK_ProductSubcategory_ProductCategory_ProductCategoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Subcategory description.', 'SCHEMA', 'Production', 'TABLE',
     'ProductSubcategory', 'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Production', 'TABLE', 'ProductSubcategory', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductSubcategory', 'COLUMN', 'ModifiedDate'
go

create unique index AK_ProductSubcategory_Name
    on Production.ProductSubcategory (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'ProductSubcategory', 'INDEX', 'AK_ProductSubcategory_Name'
go

create unique index AK_ProductSubcategory_rowguid
    on Production.ProductSubcategory (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Production', 'TABLE', 'ProductSubcategory', 'INDEX', 'AK_ProductSubcategory_rowguid'
go

