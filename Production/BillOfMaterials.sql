create table Production.BillOfMaterials
(
    BillOfMaterialsID int identity
        constraint PK_BillOfMaterials_BillOfMaterialsID
            primary key nonclustered,
    ProductAssemblyID int
        constraint FK_BillOfMaterials_Product_ProductAssemblyID
            references Production.Product,
    ComponentID       int                                            not null
        constraint FK_BillOfMaterials_Product_ComponentID
            references Production.Product,
    StartDate         datetime
        constraint DF_BillOfMaterials_StartDate default getdate()    not null,
    EndDate           datetime,
    UnitMeasureCode   nchar(3)                                       not null
        constraint FK_BillOfMaterials_UnitMeasure_UnitMeasureCode
            references Production.UnitMeasure,
    BOMLevel          smallint                                       not null,
    PerAssemblyQty    decimal(8, 2)
        constraint DF_BillOfMaterials_PerAssemblyQty default 1.00    not null
        constraint CK_BillOfMaterials_PerAssemblyQty
            check ([PerAssemblyQty] >= 1.00),
    ModifiedDate      datetime
        constraint DF_BillOfMaterials_ModifiedDate default getdate() not null,
    constraint CK_BillOfMaterials_BOMLevel
        check ([ProductAssemblyID] IS NULL AND [BOMLevel] = 0 AND [PerAssemblyQty] = 1.00 OR
               [ProductAssemblyID] IS NOT NULL AND [BOMLevel] >= 1),
    constraint CK_BillOfMaterials_EndDate
        check ([EndDate] > [StartDate] OR [EndDate] IS NULL),
    constraint CK_BillOfMaterials_ProductAssemblyID
        check ([ProductAssemblyID] <> [ComponentID])
)
go

exec sp_addextendedproperty 'MS_Description',
     'Items required to make bicycles and bicycle subassemblies. It identifies the heirarchical relationship between a parent product and its components.',
     'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for BillOfMaterials records.', 'SCHEMA', 'Production',
     'TABLE', 'BillOfMaterials', 'COLUMN', 'BillOfMaterialsID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'BillOfMaterials', 'CONSTRAINT', 'PK_BillOfMaterials_BillOfMaterialsID'
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'INDEX', 'PK_BillOfMaterials_BillOfMaterialsID'
go

exec sp_addextendedproperty 'MS_Description', 'Parent product identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials', 'COLUMN', 'ProductAssemblyID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ProductAssemblyID.', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'CONSTRAINT', 'FK_BillOfMaterials_Product_ProductAssemblyID'
go

exec sp_addextendedproperty 'MS_Description', 'Component identification number. Foreign key to Product.ProductID.',
     'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials', 'COLUMN', 'ComponentID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Product.ComponentID.', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'CONSTRAINT', 'FK_BillOfMaterials_Product_ComponentID'
go

exec sp_addextendedproperty 'MS_Description', 'Date the component started being used in the assembly item.', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'COLUMN', 'StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date the component stopped being used in the assembly item.', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'COLUMN', 'EndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Standard code identifying the unit of measure for the quantity.',
     'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials', 'COLUMN', 'UnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.',
     'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials', 'CONSTRAINT', 'FK_BillOfMaterials_UnitMeasure_UnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Indicates the depth the component is from its parent (AssemblyID).',
     'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials', 'COLUMN', 'BOMLevel'
go

exec sp_addextendedproperty 'MS_Description', 'Quantity of the component needed to create the assembly.', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'COLUMN', 'PerAssemblyQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [PerAssemblyQty] >= (1.00)', 'SCHEMA', 'Production',
     'TABLE', 'BillOfMaterials', 'CONSTRAINT', 'CK_BillOfMaterials_PerAssemblyQty'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'BillOfMaterials', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description',
     'Check constraint [ProductAssemblyID] IS NULL AND [BOMLevel] = (0) AND [PerAssemblyQty] = (1) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel] >= (1)',
     'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials', 'CONSTRAINT', 'CK_BillOfMaterials_BOMLevel'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint EndDate] > [StartDate] OR [EndDate] IS NULL', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'CONSTRAINT', 'CK_BillOfMaterials_EndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ProductAssemblyID] <> [ComponentID]', 'SCHEMA',
     'Production', 'TABLE', 'BillOfMaterials', 'CONSTRAINT', 'CK_BillOfMaterials_ProductAssemblyID'
go

create unique clustered index AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate
    on Production.BillOfMaterials (ProductAssemblyID, ComponentID, StartDate)
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index.', 'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials',
     'INDEX', 'AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate'
go

create index IX_BillOfMaterials_UnitMeasureCode
    on Production.BillOfMaterials (UnitMeasureCode)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'BillOfMaterials',
     'INDEX', 'IX_BillOfMaterials_UnitMeasureCode'
go

