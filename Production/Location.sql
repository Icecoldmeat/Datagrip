create table Production.Location
(
    LocationID   smallint identity
        constraint PK_Location_LocationID
            primary key,
    Name         Name                                         not null,
    CostRate     smallmoney
        constraint DF_Location_CostRate default 0.00          not null
        constraint CK_Location_CostRate
            check ([CostRate] >= 0.00),
    Availability decimal(8, 2)
        constraint DF_Location_Availability default 0.00      not null
        constraint CK_Location_Availability
            check ([Availability] >= 0.00),
    ModifiedDate datetime
        constraint DF_Location_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Product inventory and manufacturing locations.', 'SCHEMA', 'Production',
     'TABLE', 'Location'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for Location records.', 'SCHEMA', 'Production', 'TABLE',
     'Location', 'COLUMN', 'LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'Location', 'CONSTRAINT', 'PK_Location_LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'Location', 'INDEX', 'PK_Location_LocationID'
go

exec sp_addextendedproperty 'MS_Description', 'Location description.', 'SCHEMA', 'Production', 'TABLE', 'Location',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Standard hourly cost of the manufacturing location.', 'SCHEMA',
     'Production', 'TABLE', 'Location', 'COLUMN', 'CostRate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [CostRate] >= (0.00)', 'SCHEMA', 'Production', 'TABLE',
     'Location', 'CONSTRAINT', 'CK_Location_CostRate'
go

exec sp_addextendedproperty 'MS_Description', 'Work capacity (in hours) of the manufacturing location.', 'SCHEMA',
     'Production', 'TABLE', 'Location', 'COLUMN', 'Availability'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Availability] >= (0.00)', 'SCHEMA', 'Production',
     'TABLE', 'Location', 'CONSTRAINT', 'CK_Location_Availability'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'Location', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Location_Name
    on Production.Location (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'Location',
     'INDEX', 'AK_Location_Name'
go

