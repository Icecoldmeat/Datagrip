create table Production.ProductModelProductDescriptionCulture
(
    ProductModelID       int                                                               not null
        constraint FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID
            references Production.ProductModel,
    ProductDescriptionID int                                                               not null
        constraint FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID
            references Production.ProductDescription,
    CultureID            nchar(6)                                                          not null
        constraint FK_ProductModelProductDescriptionCulture_Culture_CultureID
            references Production.Culture,
    ModifiedDate         datetime
        constraint DF_ProductModelProductDescriptionCulture_ModifiedDate default getdate() not null,
    constraint PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID
        primary key (ProductModelID, ProductDescriptionID, CultureID)
)
go

exec sp_addextendedproperty 'MS_Description',
     'Cross-reference table mapping product descriptions and the language the description is written in.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModelProductDescriptionCulture'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to ProductModel.ProductModelID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModelProductDescriptionCulture', 'COLUMN', 'ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ProductModel.ProductModelID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductModelProductDescriptionCulture', 'CONSTRAINT',
     'FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to ProductDescription.ProductDescriptionID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductModelProductDescriptionCulture', 'COLUMN', 'ProductDescriptionID'
go

exec sp_addextendedproperty 'MS_Description',
     'Foreign key constraint referencing ProductDescription.ProductDescriptionID.', 'SCHEMA', 'Production', 'TABLE',
     'ProductModelProductDescriptionCulture', 'CONSTRAINT',
     'FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID'
go

exec sp_addextendedproperty 'MS_Description', 'Culture identification number. Foreign key to Culture.CultureID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductModelProductDescriptionCulture', 'COLUMN', 'CultureID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Culture.CultureID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModelProductDescriptionCulture', 'CONSTRAINT',
     'FK_ProductModelProductDescriptionCulture_Culture_CultureID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductModelProductDescriptionCulture', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductModelProductDescriptionCulture', 'CONSTRAINT',
     'PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModelProductDescriptionCulture', 'INDEX',
     'PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID'
go

