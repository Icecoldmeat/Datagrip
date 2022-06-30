create table Production.ProductDocument
(
    ProductID    int                                                 not null
        constraint FK_ProductDocument_Product_ProductID
            references Production.Product,
    DocumentNode hierarchyid                                         not null
        constraint FK_ProductDocument_Document_DocumentNode
            references Production.Document,
    ModifiedDate datetime
        constraint DF_ProductDocument_ModifiedDate default getdate() not null,
    constraint PK_ProductDocument_ProductID_DocumentNode
        primary key (ProductID, DocumentNode)
)
go

exec sp_addextendedproperty 'MS_Description', 'Cross-reference table mapping products to related product documents.',
     'SCHEMA', 'Production', 'TABLE', 'ProductDocument'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductDocument', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductDocument', 'CONSTRAINT', 'FK_ProductDocument_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Document identification number. Foreign key to Document.DocumentNode.',
     'SCHEMA', 'Production', 'TABLE', 'ProductDocument', 'COLUMN', 'DocumentNode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Document.DocumentNode.', 'SCHEMA',
     'Production', 'TABLE', 'ProductDocument', 'CONSTRAINT', 'FK_ProductDocument_Document_DocumentNode'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductDocument', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductDocument', 'CONSTRAINT', 'PK_ProductDocument_ProductID_DocumentNode'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductDocument', 'INDEX', 'PK_ProductDocument_ProductID_DocumentNode'
go

