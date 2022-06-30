create table Production.ProductDescription
(
    ProductDescriptionID int identity
        constraint PK_ProductDescription_ProductDescriptionID
            primary key,
    Description          nvarchar(400)                                  not null,
    rowguid              uniqueidentifier
        constraint DF_ProductDescription_rowguid default newid()        not null,
    ModifiedDate         datetime
        constraint DF_ProductDescription_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Product descriptions in several languages.', 'SCHEMA', 'Production',
     'TABLE', 'ProductDescription'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ProductDescription records.', 'SCHEMA', 'Production',
     'TABLE', 'ProductDescription', 'COLUMN', 'ProductDescriptionID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductDescription', 'CONSTRAINT', 'PK_ProductDescription_ProductDescriptionID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductDescription', 'INDEX', 'PK_ProductDescription_ProductDescriptionID'
go

exec sp_addextendedproperty 'MS_Description', 'Description of the product.', 'SCHEMA', 'Production', 'TABLE',
     'ProductDescription', 'COLUMN', 'Description'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Production', 'TABLE', 'ProductDescription', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductDescription', 'COLUMN', 'ModifiedDate'
go

create unique index AK_ProductDescription_rowguid
    on Production.ProductDescription (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Production', 'TABLE', 'ProductDescription', 'INDEX', 'AK_ProductDescription_rowguid'
go

