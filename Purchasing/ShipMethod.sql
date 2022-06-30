create table Purchasing.ShipMethod
(
    ShipMethodID int identity
        constraint PK_ShipMethod_ShipMethodID
            primary key,
    Name         Name                                           not null,
    ShipBase     money
        constraint DF_ShipMethod_ShipBase default 0.00          not null
        constraint CK_ShipMethod_ShipBase
            check ([ShipBase] > 0.00),
    ShipRate     money
        constraint DF_ShipMethod_ShipRate default 0.00          not null
        constraint CK_ShipMethod_ShipRate
            check ([ShipRate] > 0.00),
    rowguid      uniqueidentifier
        constraint DF_ShipMethod_rowguid default newid()        not null,
    ModifiedDate datetime
        constraint DF_ShipMethod_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Shipping company lookup table.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ShipMethod'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for ShipMethod records.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ShipMethod', 'COLUMN', 'ShipMethodID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Purchasing', 'TABLE',
     'ShipMethod', 'CONSTRAINT', 'PK_ShipMethod_ShipMethodID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Purchasing', 'TABLE', 'ShipMethod', 'INDEX', 'PK_ShipMethod_ShipMethodID'
go

exec sp_addextendedproperty 'MS_Description', 'Shipping company name.', 'SCHEMA', 'Purchasing', 'TABLE', 'ShipMethod',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Minimum shipping charge.', 'SCHEMA', 'Purchasing', 'TABLE', 'ShipMethod',
     'COLUMN', 'ShipBase'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ShipBase] > (0.00)', 'SCHEMA', 'Purchasing', 'TABLE',
     'ShipMethod', 'CONSTRAINT', 'CK_ShipMethod_ShipBase'
go

exec sp_addextendedproperty 'MS_Description', 'Shipping charge per pound.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ShipMethod', 'COLUMN', 'ShipRate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [ShipRate] > (0.00)', 'SCHEMA', 'Purchasing', 'TABLE',
     'ShipMethod', 'CONSTRAINT', 'CK_ShipMethod_ShipRate'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Purchasing', 'TABLE', 'ShipMethod', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Purchasing',
     'TABLE', 'ShipMethod', 'COLUMN', 'ModifiedDate'
go

create unique index AK_ShipMethod_Name
    on Purchasing.ShipMethod (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Purchasing', 'TABLE',
     'ShipMethod', 'INDEX', 'AK_ShipMethod_Name'
go

create unique index AK_ShipMethod_rowguid
    on Purchasing.ShipMethod (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Purchasing', 'TABLE', 'ShipMethod', 'INDEX', 'AK_ShipMethod_rowguid'
go

