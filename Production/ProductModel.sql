create table Production.ProductModel
(
    ProductModelID     int identity
        constraint PK_ProductModel_ProductModelID
            primary key,
    Name               Name                                       not null,
    CatalogDescription xml,
    Instructions       xml,
    rowguid            uniqueidentifier
        constraint DF_ProductModel_rowguid default newid()        not null,
    ModifiedDate       datetime
        constraint DF_ProductModel_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Product model classification.', 'SCHEMA', 'Production', 'TABLE',
     'ProductModel'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ProductModel records.', 'SCHEMA', 'Production', 'TABLE',
     'ProductModel', 'COLUMN', 'ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductModel', 'CONSTRAINT', 'PK_ProductModel_ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModel', 'INDEX', 'PK_ProductModel_ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Product model description.', 'SCHEMA', 'Production', 'TABLE',
     'ProductModel', 'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Detailed product catalog information in xml format.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModel', 'COLUMN', 'CatalogDescription'
go

exec sp_addextendedproperty 'MS_Description', 'Manufacturing instructions in xml format.', 'SCHEMA', 'Production',
     'TABLE', 'ProductModel', 'COLUMN', 'Instructions'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModel', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductModel', 'COLUMN', 'ModifiedDate'
go

create unique index AK_ProductModel_Name
    on Production.ProductModel (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'ProductModel', 'INDEX', 'AK_ProductModel_Name'
go

create unique index AK_ProductModel_rowguid
    on Production.ProductModel (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Production', 'TABLE', 'ProductModel', 'INDEX', 'AK_ProductModel_rowguid'
go

create index PXML_ProductModel_CatalogDescription
    on Production.ProductModel (CatalogDescription)
go

exec sp_addextendedproperty 'MS_Description', 'Primary XML index.', 'SCHEMA', 'Production', 'TABLE', 'ProductModel',
     'INDEX', 'PXML_ProductModel_CatalogDescription'
go

create index PXML_ProductModel_Instructions
    on Production.ProductModel (Instructions)
go

exec sp_addextendedproperty 'MS_Description', 'Primary XML index.', 'SCHEMA', 'Production', 'TABLE', 'ProductModel',
     'INDEX', 'PXML_ProductModel_Instructions'
go

