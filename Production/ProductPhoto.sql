create table Production.ProductPhoto
(
    ProductPhotoID         int identity
        constraint PK_ProductPhoto_ProductPhotoID
            primary key,
    ThumbNailPhoto         varbinary(max),
    ThumbnailPhotoFileName nvarchar(50),
    LargePhoto             varbinary(max),
    LargePhotoFileName     nvarchar(50),
    ModifiedDate           datetime
        constraint DF_ProductPhoto_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Product images.', 'SCHEMA', 'Production', 'TABLE', 'ProductPhoto'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ProductPhoto records.', 'SCHEMA', 'Production', 'TABLE',
     'ProductPhoto', 'COLUMN', 'ProductPhotoID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductPhoto', 'CONSTRAINT', 'PK_ProductPhoto_ProductPhotoID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductPhoto', 'INDEX', 'PK_ProductPhoto_ProductPhotoID'
go

exec sp_addextendedproperty 'MS_Description', 'Small image of the product.', 'SCHEMA', 'Production', 'TABLE',
     'ProductPhoto', 'COLUMN', 'ThumbNailPhoto'
go

exec sp_addextendedproperty 'MS_Description', 'Small image file name.', 'SCHEMA', 'Production', 'TABLE', 'ProductPhoto',
     'COLUMN', 'ThumbnailPhotoFileName'
go

exec sp_addextendedproperty 'MS_Description', 'Large image of the product.', 'SCHEMA', 'Production', 'TABLE',
     'ProductPhoto', 'COLUMN', 'LargePhoto'
go

exec sp_addextendedproperty 'MS_Description', 'Large image file name.', 'SCHEMA', 'Production', 'TABLE', 'ProductPhoto',
     'COLUMN', 'LargePhotoFileName'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductPhoto', 'COLUMN', 'ModifiedDate'
go

