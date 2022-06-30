create table Production.ProductReview
(
    ProductReviewID int identity
        constraint PK_ProductReview_ProductReviewID
            primary key,
    ProductID       int                                            not null
        constraint FK_ProductReview_Product_ProductID
            references Production.Product,
    ReviewerName    Name                                           not null,
    ReviewDate      datetime
        constraint DF_ProductReview_ReviewDate default getdate()   not null,
    EmailAddress    nvarchar(50)                                   not null,
    Rating          int                                            not null
        constraint CK_ProductReview_Rating
            check ([Rating] >= 1 AND [Rating] <= 5),
    Comments        nvarchar(3850),
    ModifiedDate    datetime
        constraint DF_ProductReview_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Customer reviews of products they have purchased.', 'SCHEMA',
     'Production', 'TABLE', 'ProductReview'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ProductReview records.', 'SCHEMA', 'Production', 'TABLE',
     'ProductReview', 'COLUMN', 'ProductReviewID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'ProductReview', 'CONSTRAINT', 'PK_ProductReview_ProductReviewID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'ProductReview', 'INDEX', 'PK_ProductReview_ProductReviewID'
go

exec sp_addextendedproperty 'MS_Description', 'Product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'ProductReview', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductID.', 'SCHEMA',
     'Production', 'TABLE', 'ProductReview', 'CONSTRAINT', 'FK_ProductReview_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Name of the reviewer.', 'SCHEMA', 'Production', 'TABLE', 'ProductReview',
     'COLUMN', 'ReviewerName'
go

exec sp_addextendedproperty 'MS_Description', 'Date review was submitted.', 'SCHEMA', 'Production', 'TABLE',
     'ProductReview', 'COLUMN', 'ReviewDate'
go

exec sp_addextendedproperty 'MS_Description', 'Reviewer''s e-mail address.', 'SCHEMA', 'Production', 'TABLE',
     'ProductReview', 'COLUMN', 'EmailAddress'
go

exec sp_addextendedproperty 'MS_Description',
     'Product rating given by the reviewer. Scale is 1 to 5 with 5 as the highest rating.', 'SCHEMA', 'Production',
     'TABLE', 'ProductReview', 'COLUMN', 'Rating'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Rating] BETWEEN (1) AND (5)', 'SCHEMA', 'Production',
     'TABLE', 'ProductReview', 'CONSTRAINT', 'CK_ProductReview_Rating'
go

exec sp_addextendedproperty 'MS_Description', 'Reviewer''s comments', 'SCHEMA', 'Production', 'TABLE', 'ProductReview',
     'COLUMN', 'Comments'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'ProductReview', 'COLUMN', 'ModifiedDate'
go

create index IX_ProductReview_ProductID_Name
    on Production.ProductReview (ProductID, ReviewerName) include (Comments)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'ProductReview',
     'INDEX', 'IX_ProductReview_ProductID_Name'
go

create fulltext index []
    on Production.ProductReview (Comments)
	key index PK_ProductReview_ProductReviewID
go

