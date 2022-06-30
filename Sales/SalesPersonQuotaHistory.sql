create table Sales.SalesPersonQuotaHistory
(
    BusinessEntityID int                                                     not null
        constraint FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID
            references Sales.SalesPerson,
    QuotaDate        datetime                                                not null,
    SalesQuota       money                                                   not null
        constraint CK_SalesPersonQuotaHistory_SalesQuota
            check ([SalesQuota] > 0.00),
    rowguid          uniqueidentifier
        constraint DF_SalesPersonQuotaHistory_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_SalesPersonQuotaHistory_ModifiedDate default getdate() not null,
    constraint PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate
        primary key (BusinessEntityID, QuotaDate)
)
go

exec sp_addextendedproperty 'MS_Description', 'Sales performance tracking.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPersonQuotaHistory'
go

exec sp_addextendedproperty 'MS_Description',
     'Sales person identification number. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPersonQuotaHistory', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing SalesPerson.SalesPersonID.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesPersonQuotaHistory', 'CONSTRAINT',
     'FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Sales quota date.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPersonQuotaHistory', 'COLUMN', 'QuotaDate'
go

exec sp_addextendedproperty 'MS_Description', 'Sales quota amount.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPersonQuotaHistory', 'COLUMN', 'SalesQuota'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [SalesQuota] > (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPersonQuotaHistory', 'CONSTRAINT', 'CK_SalesPersonQuotaHistory_SalesQuota'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SalesPersonQuotaHistory', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPersonQuotaHistory', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SalesPersonQuotaHistory', 'CONSTRAINT', 'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SalesPersonQuotaHistory', 'INDEX', 'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate'
go

create unique index AK_SalesPersonQuotaHistory_rowguid
    on Sales.SalesPersonQuotaHistory (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SalesPersonQuotaHistory', 'INDEX', 'AK_SalesPersonQuotaHistory_rowguid'
go

