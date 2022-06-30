create table Production.ProductModelIllustration
(
    ProductModelID int                                                        not null
        constraint FK_ProductModelIllustration_ProductModel_ProductModelID
            references Production.ProductModel,
    IllustrationID int                                                        not null
        constraint FK_ProductModelIllustration_Illustration_IllustrationID
            references Production.Illustration,
    ModifiedDate   datetime
        constraint DF_ProductModelIllustration_ModifiedDate default getdate() not null,
    constraint PK_ProductModelIllustration_ProductModelID_IllustrationID
        primary key (ProductModelID, IllustrationID)
)
go

exec sp_addextendedproperty 'MS_Description', 'Cross-reference table mapping product models and illustrations.',
     'SCHEMA', 'Production', 'TABLE', 'ProductModelIllustration'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to ProductModel.ProductModelID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModelIllustration', 'COLUMN', 'ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ProductModel.ProductModelID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductModelIllustration', 'CONSTRAINT',
     'FK_ProductModelIllustration_ProductModel_ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Foreign key to Illustration.IllustrationID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModelIllustration', 'COLUMN', 'IllustrationID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Illustration.IllustrationID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductModelIllustration', 'CONSTRAINT',
     'FK_ProductModelIllustration_Illustration_IllustrationID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductModelIllustration', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductModelIllustration', 'CONSTRAINT', 'PK_ProductModelIllustration_ProductModelID_IllustrationID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductModelIllustration', 'INDEX',
     'PK_ProductModelIllustration_ProductModelID_IllustrationID'
go

