create table Sales.SalesTerritory
(
    TerritoryID       int identity
        constraint PK_SalesTerritory_TerritoryID
            primary key,
    Name              Name                                          not null,
    CountryRegionCode nvarchar(3)                                   not null
        constraint FK_SalesTerritory_CountryRegion_CountryRegionCode
            references Person.CountryRegion (CountryRegionCode),
    [Group]           nvarchar(50)                                  not null,
    SalesYTD          money
        constraint DF_SalesTerritory_SalesYTD default 0.00          not null
        constraint CK_SalesTerritory_SalesYTD
            check ([SalesYTD] >= 0.00),
    SalesLastYear     money
        constraint DF_SalesTerritory_SalesLastYear default 0.00     not null
        constraint CK_SalesTerritory_SalesLastYear
            check ([SalesLastYear] >= 0.00),
    CostYTD           money
        constraint DF_SalesTerritory_CostYTD default 0.00           not null
        constraint CK_SalesTerritory_CostYTD
            check ([CostYTD] >= 0.00),
    CostLastYear      money
        constraint DF_SalesTerritory_CostLastYear default 0.00      not null
        constraint CK_SalesTerritory_CostLastYear
            check ([CostLastYear] >= 0.00),
    rowguid           uniqueidentifier
        constraint DF_SalesTerritory_rowguid default newid()        not null,
    ModifiedDate      datetime
        constraint DF_SalesTerritory_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Sales territory lookup table.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for SalesTerritory records.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'COLUMN', 'TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'CONSTRAINT', 'PK_SalesTerritory_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTerritory', 'INDEX', 'PK_SalesTerritory_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Sales territory description', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description',
     'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTerritory', 'COLUMN', 'CountryRegionCode'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing CountryRegion.CountryRegionCode.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTerritory', 'CONSTRAINT', 'FK_SalesTerritory_CountryRegion_CountryRegionCode'
go

exec sp_addextendedproperty 'MS_Description', 'Geographic area to which the sales territory belong.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTerritory', 'COLUMN', 'Group'
go

exec sp_addextendedproperty 'MS_Description', 'Sales in the territory year to date.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'COLUMN', 'SalesYTD'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SalesYTD] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'CONSTRAINT', 'CK_SalesTerritory_SalesYTD'
go

exec sp_addextendedproperty 'MS_Description', 'Sales in the territory the previous year.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'COLUMN', 'SalesLastYear'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SalesLastYear] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'CONSTRAINT', 'CK_SalesTerritory_SalesLastYear'
go

exec sp_addextendedproperty 'MS_Description', 'Business costs in the territory year to date.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTerritory', 'COLUMN', 'CostYTD'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [CostYTD] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'CONSTRAINT', 'CK_SalesTerritory_CostYTD'
go

exec sp_addextendedproperty 'MS_Description', 'Business costs in the territory the previous year.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTerritory', 'COLUMN', 'CostLastYear'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [CostLastYear] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'CONSTRAINT', 'CK_SalesTerritory_CostLastYear'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesTerritory', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'COLUMN', 'ModifiedDate'
go

create unique index AK_SalesTerritory_Name
    on Sales.SalesTerritory (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritory', 'INDEX', 'AK_SalesTerritory_Name'
go

create unique index AK_SalesTerritory_rowguid
    on Sales.SalesTerritory (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTerritory', 'INDEX', 'AK_SalesTerritory_rowguid'
go

