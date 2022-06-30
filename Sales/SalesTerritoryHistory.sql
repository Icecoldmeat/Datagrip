create table Sales.SalesTerritoryHistory
(
    BusinessEntityID int                                                   not null
        constraint FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID
            references Sales.SalesPerson,
    TerritoryID      int                                                   not null
        constraint FK_SalesTerritoryHistory_SalesTerritory_TerritoryID
            references Sales.SalesTerritory,
    StartDate        datetime                                              not null,
    EndDate          datetime,
    rowguid          uniqueidentifier
        constraint DF_SalesTerritoryHistory_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_SalesTerritoryHistory_ModifiedDate default getdate() not null,
    constraint PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID
        primary key (BusinessEntityID, StartDate, TerritoryID),
    constraint CK_SalesTerritoryHistory_EndDate
        check ([EndDate] >= [StartDate] OR [EndDate] IS NULL)
)
go

exec sp_addextendedproperty 'MS_Description', 'Sales representative transfers to other sales territories.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesTerritoryHistory'
go

exec sp_addextendedproperty 'MS_Description',
     'Primary key. The sales rep.  Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritoryHistory', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesPerson.SalesPersonID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesTerritoryHistory', 'CONSTRAINT', 'FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'Primary key. Territory identification number. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTerritoryHistory', 'COLUMN', 'TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesTerritory.TerritoryID.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTerritoryHistory', 'CONSTRAINT',
     'FK_SalesTerritoryHistory_SalesTerritory_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key. Date the sales representive started work in the territory.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTerritoryHistory', 'COLUMN', 'StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Date the sales representative left work in the territory.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesTerritoryHistory', 'COLUMN', 'EndDate'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesTerritoryHistory', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritoryHistory', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesTerritoryHistory', 'CONSTRAINT', 'PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesTerritoryHistory', 'INDEX', 'PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTerritoryHistory', 'CONSTRAINT', 'CK_SalesTerritoryHistory_EndDate'
go

create unique index AK_SalesTerritoryHistory_rowguid
    on Sales.SalesTerritoryHistory (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesTerritoryHistory', 'INDEX', 'AK_SalesTerritoryHistory_rowguid'
go

