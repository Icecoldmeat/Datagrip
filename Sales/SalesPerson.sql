create table Sales.SalesPerson
(
    BusinessEntityID int                                         not null
        constraint PK_SalesPerson_BusinessEntityID
            primary key
        constraint FK_SalesPerson_Employee_BusinessEntityID
            references HumanResources.Employee,
    TerritoryID      int
        constraint FK_SalesPerson_SalesTerritory_TerritoryID
            references Sales.SalesTerritory,
    SalesQuota       money
        constraint CK_SalesPerson_SalesQuota
            check ([SalesQuota] > 0.00),
    Bonus            money
        constraint DF_SalesPerson_Bonus default 0.00             not null
        constraint CK_SalesPerson_Bonus
            check ([Bonus] >= 0.00),
    CommissionPct    smallmoney
        constraint DF_SalesPerson_CommissionPct default 0.00     not null
        constraint CK_SalesPerson_CommissionPct
            check ([CommissionPct] >= 0.00),
    SalesYTD         money
        constraint DF_SalesPerson_SalesYTD default 0.00          not null
        constraint CK_SalesPerson_SalesYTD
            check ([SalesYTD] >= 0.00),
    SalesLastYear    money
        constraint DF_SalesPerson_SalesLastYear default 0.00     not null
        constraint CK_SalesPerson_SalesLastYear
            check ([SalesLastYear] >= 0.00),
    rowguid          uniqueidentifier
        constraint DF_SalesPerson_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_SalesPerson_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Sales representative current information.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson'
go

exec sp_addextendedproperty 'MS_Description',
     'Primary key for SalesPerson records. Foreign key to Employee.BusinessEntityID', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'CONSTRAINT', 'PK_SalesPerson_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesPerson', 'INDEX', 'PK_SalesPerson_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesPerson', 'CONSTRAINT', 'FK_SalesPerson_Employee_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'Territory currently assigned to. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'COLUMN', 'TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesTerritory.TerritoryID.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesPerson', 'CONSTRAINT', 'FK_SalesPerson_SalesTerritory_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Projected yearly sales.', 'SCHEMA', 'Sales', 'TABLE', 'SalesPerson',
     'COLUMN', 'SalesQuota'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SalesQuota] > (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'CONSTRAINT', 'CK_SalesPerson_SalesQuota'
go

exec sp_addextendedproperty 'MS_Description', 'Bonus due if quota is met.', 'SCHEMA', 'Sales', 'TABLE', 'SalesPerson',
     'COLUMN', 'Bonus'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Bonus] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'CONSTRAINT', 'CK_SalesPerson_Bonus'
go

exec sp_addextendedproperty 'MS_Description', 'Commision percent received per sale.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'COLUMN', 'CommissionPct'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [CommissionPct] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'CONSTRAINT', 'CK_SalesPerson_CommissionPct'
go

exec sp_addextendedproperty 'MS_Description', 'Sales total year to date.', 'SCHEMA', 'Sales', 'TABLE', 'SalesPerson',
     'COLUMN', 'SalesYTD'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SalesYTD] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'CONSTRAINT', 'CK_SalesPerson_SalesYTD'
go

exec sp_addextendedproperty 'MS_Description', 'Sales total of previous year.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'COLUMN', 'SalesLastYear'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SalesLastYear] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'CONSTRAINT', 'CK_SalesPerson_SalesLastYear'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesPerson', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPerson', 'COLUMN', 'ModifiedDate'
go

create unique index AK_SalesPerson_rowguid
    on Sales.SalesPerson (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesPerson', 'INDEX', 'AK_SalesPerson_rowguid'
go

