create table Production.Product
(
    ProductID             int identity
        constraint PK_Product_ProductID
            primary key,
    Name                  Name                               not null,
    ProductNumber         nvarchar(25)                       not null,
    MakeFlag              Flag
        constraint DF_Product_MakeFlag default 1             not null,
    FinishedGoodsFlag     Flag
        constraint DF_Product_FinishedGoodsFlag default 1    not null,
    Color                 nvarchar(15),
    SafetyStockLevel      smallint                           not null
        constraint CK_Product_SafetyStockLevel
            check ([SafetyStockLevel] > 0),
    ReorderPoint          smallint                           not null
        constraint CK_Product_ReorderPoint
            check ([ReorderPoint] > 0),
    StandardCost          money                              not null
        constraint CK_Product_StandardCost
            check ([StandardCost] >= 0.00),
    ListPrice             money                              not null
        constraint CK_Product_ListPrice
            check ([ListPrice] >= 0.00),
    Size                  nvarchar(5),
    SizeUnitMeasureCode   nchar(3)
        constraint FK_Product_UnitMeasure_SizeUnitMeasureCode
            references Production.UnitMeasure,
    WeightUnitMeasureCode nchar(3)
        constraint FK_Product_UnitMeasure_WeightUnitMeasureCode
            references Production.UnitMeasure,
    Weight                decimal(8, 2)
        constraint CK_Product_Weight
            check ([Weight] > 0.00),
    DaysToManufacture     int                                not null
        constraint CK_Product_DaysToManufacture
            check ([DaysToManufacture] >= 0),
    ProductLine           nchar(2)
        constraint CK_Product_ProductLine
            check (upper([ProductLine]) = 'R' OR upper([ProductLine]) = 'M' OR upper([ProductLine]) = 'T' OR
                   upper([ProductLine]) = 'S' OR [ProductLine] IS NULL),
    Class                 nchar(2)
        constraint CK_Product_Class
            check (upper([Class]) = 'H' OR upper([Class]) = 'M' OR upper([Class]) = 'L' OR [Class] IS NULL),
    Style                 nchar(2)
        constraint CK_Product_Style
            check (upper([Style]) = 'U' OR upper([Style]) = 'M' OR upper([Style]) = 'W' OR [Style] IS NULL),
    ProductSubcategoryID  int
        constraint FK_Product_ProductSubcategory_ProductSubcategoryID
            references Production.ProductSubcategory,
    ProductModelID        int
        constraint FK_Product_ProductModel_ProductModelID
            references Production.ProductModel,
    SellStartDate         datetime                           not null,
    SellEndDate           datetime,
    DiscontinuedDate      datetime,
    rowguid               uniqueidentifier
        constraint DF_Product_rowguid default newid()        not null,
    ModifiedDate          datetime
        constraint DF_Product_ModifiedDate default getdate() not null,
    constraint CK_Product_SellEndDate
        check ([SellEndDate] >= [SellStartDate] OR [SellEndDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'Products sold or used in the manfacturing of sold products.', 'SCHEMA',
     'Production', 'TABLE', 'Product'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for Product records.', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'CONSTRAINT', 'PK_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'Product', 'INDEX', 'PK_Product_ProductID'
go

exec sp_addextendedproperty 'MS_Description', 'Name of the product.', 'SCHEMA', 'Production', 'TABLE', 'Product',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Unique product identification number.', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'ProductNumber'
go

exec sp_addextendedproperty 'MS_Description', '0 = Product is purchased, 1 = Product is manufactured in-house.',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'COLUMN', 'MakeFlag'
go

exec sp_addextendedproperty 'MS_Description', '0 = Product is not a salable item. 1 = Product is salable.', 'SCHEMA',
     'Production', 'TABLE', 'Product', 'COLUMN', 'FinishedGoodsFlag'
go

exec sp_addextendedproperty 'MS_Description', 'Product color.', 'SCHEMA', 'Production', 'TABLE', 'Product', 'COLUMN',
     'Color'
go

exec sp_addextendedproperty 'MS_Description', 'Minimum inventory quantity. ', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'SafetyStockLevel'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SafetyStockLevel] > (0)', 'SCHEMA', 'Production',
     'TABLE', 'Product', 'CONSTRAINT', 'CK_Product_SafetyStockLevel'
go

exec sp_addextendedproperty 'MS_Description', 'Inventory level that triggers a purchase order or work order. ',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'COLUMN', 'ReorderPoint'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ReorderPoint] > (0)', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'CONSTRAINT', 'CK_Product_ReorderPoint'
go

exec sp_addextendedproperty 'MS_Description', 'Standard cost of the product.', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'StandardCost'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SafetyStockLevel] > (0)', 'SCHEMA', 'Production',
     'TABLE', 'Product', 'CONSTRAINT', 'CK_Product_StandardCost'
go

exec sp_addextendedproperty 'MS_Description', 'Selling price.', 'SCHEMA', 'Production', 'TABLE', 'Product', 'COLUMN',
     'ListPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ListPrice] >= (0.00)', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'CONSTRAINT', 'CK_Product_ListPrice'
go

exec sp_addextendedproperty 'MS_Description', 'Product size.', 'SCHEMA', 'Production', 'TABLE', 'Product', 'COLUMN',
     'Size'
go

exec sp_addextendedproperty 'MS_Description', 'Unit of measure for Size column.', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'SizeUnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'CONSTRAINT', 'FK_Product_UnitMeasure_SizeUnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Unit of measure for Weight column.', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'WeightUnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'CONSTRAINT', 'FK_Product_UnitMeasure_WeightUnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Product weight.', 'SCHEMA', 'Production', 'TABLE', 'Product', 'COLUMN',
     'Weight'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Weight] > (0.00)', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'CONSTRAINT', 'CK_Product_Weight'
go

exec sp_addextendedproperty 'MS_Description', 'Number of days required to manufacture the product.', 'SCHEMA',
     'Production', 'TABLE', 'Product', 'COLUMN', 'DaysToManufacture'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [DaysToManufacture] >= (0)', 'SCHEMA', 'Production',
     'TABLE', 'Product', 'CONSTRAINT', 'CK_Product_DaysToManufacture'
go

exec sp_addextendedproperty 'MS_Description', 'R = Road, M = Mountain, T = Touring, S = Standard', 'SCHEMA',
     'Production', 'TABLE', 'Product', 'COLUMN', 'ProductLine'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [ProductLine]=''r'' OR [ProductLine]=''m'' OR [ProductLine]=''t'' OR [ProductLine]=''s'' OR [ProductLine]=''R'' OR [ProductLine]=''M'' OR [ProductLine]=''T'' OR [ProductLine]=''S'' OR [ProductLine] IS NULL',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'CONSTRAINT', 'CK_Product_ProductLine'
go

exec sp_addextendedproperty 'MS_Description', 'H = High, M = Medium, L = Low', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'Class'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [Class]=''h'' OR [Class]=''m'' OR [Class]=''l'' OR [Class]=''H'' OR [Class]=''M'' OR [Class]=''L'' OR [Class] IS NULL',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'CONSTRAINT', 'CK_Product_Class'
go

exec sp_addextendedproperty 'MS_Description', 'W = Womens, M = Mens, U = Universal', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'Style'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [Style]=''u'' OR [Style]=''m'' OR [Style]=''w'' OR [Style]=''U'' OR [Style]=''M'' OR [Style]=''W'' OR [Style] IS NULL',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'CONSTRAINT', 'CK_Product_Style'
go

exec sp_addextendedproperty 'MS_Description',
     'Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. ',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'COLUMN', 'ProductSubcategoryID'
go

exec sp_addextendedproperty 'MS_Description',
     'Foreign key constraint referencing ProductSubcategory.ProductSubcategoryID.', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'CONSTRAINT', 'FK_Product_ProductSubcategory_ProductSubcategoryID'
go

exec sp_addextendedproperty 'MS_Description',
     'Product is a member of this product model. Foreign key to ProductModel.ProductModelID.', 'SCHEMA', 'Production',
     'TABLE', 'Product', 'COLUMN', 'ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing ProductModel.ProductModelID.',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'CONSTRAINT', 'FK_Product_ProductModel_ProductModelID'
go

exec sp_addextendedproperty 'MS_Description', 'Date the product was available for sale.', 'SCHEMA', 'Production',
     'TABLE', 'Product', 'COLUMN', 'SellStartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date the product was no longer available for sale.', 'SCHEMA',
     'Production', 'TABLE', 'Product', 'COLUMN', 'SellEndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date the product was discontinued.', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'COLUMN', 'DiscontinuedDate'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Production', 'TABLE', 'Product', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'Product', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [SellEndDate] >= [SellStartDate] OR [SellEndDate] IS NULL', 'SCHEMA', 'Production', 'TABLE',
     'Product', 'CONSTRAINT', 'CK_Product_SellEndDate'
go

create unique index AK_Product_ProductNumber
    on Production.Product (ProductNumber)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'Product',
     'INDEX', 'AK_Product_ProductNumber'
go

create unique index AK_Product_Name
    on Production.Product (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'Product',
     'INDEX', 'AK_Product_Name'
go

create unique index AK_Product_rowguid
    on Production.Product (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Production', 'TABLE', 'Product', 'INDEX', 'AK_Product_rowguid'
go

