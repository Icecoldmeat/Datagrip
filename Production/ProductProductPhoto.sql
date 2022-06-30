create table Production.ProductProductPhoto
(
    ProductID      int                                                   not null
        constraint FK_ProductProductPhoto_Product_ProductID
            references Production.Product,
    ProductPhotoID int                                                   not null
        constraint FK_ProductProductPhoto_ProductPhoto_ProductPhotoID
            references Production.ProductPhoto,
    [Primary]      Flag
        constraint DF_ProductProductPhoto_Primary default 0              not null,
    ModifiedDate   datetime
        constraint DF_ProductProductPhoto_ModifiedDate default getdate() not null,
    constraint PK_ProductProductPhoto_ProductID_ProductPhotoID
        primary key nonclustered (ProductID, ProductPhotoID)
)
go

exec sp_addextendedproperty 'MS_Description', 'Cross-reference table mapping products and product photos.', 'SCHEMA',
     'Production', 'TABLE', 'ProductProductPhoto'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductProductPhoto', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductProductPhoto', 'CONSTRAINT', 'FK_ProductProductPhoto_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description',
     'Product photo identification number. Foreign key to ProductPhoto.ProductPhotoID.', 'SCHEMA', 'Production',
     'TABLE', 'ProductProductPhoto', 'COLUMN', 'ProductPhotoID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ProductPhoto.ProductPhotoID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductProductPhoto', 'CONSTRAINT',
     'FK_ProductProductPhoto_ProductPhoto_ProductPhotoID'
go

exec sp_addextendedproperty 'MS_Description', '0 = Photo is not the principal image. 1 = Photo is the principal image.',
     'SCHEMA', 'Production', 'TABLE', 'ProductProductPhoto', 'COLUMN', 'Primary'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductProductPhoto', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductProductPhoto', 'CONSTRAINT', 'PK_ProductProductPhoto_ProductID_ProductPhotoID'
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductProductPhoto', 'INDEX', 'PK_ProductProductPhoto_ProductID_ProductPhotoID'
go

