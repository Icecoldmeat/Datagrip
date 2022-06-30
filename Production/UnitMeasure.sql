create table Production.UnitMeasure
(
    UnitMeasureCode nchar(3)                                     not null
        constraint PK_UnitMeasure_UnitMeasureCode
            primary key,
    Name            Name                                         not null,
    ModifiedDate    datetime
        constraint DF_UnitMeasure_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Unit of measure lookup table.', 'SCHEMA', 'Production', 'TABLE',
     'UnitMeasure'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key.', 'SCHEMA', 'Production', 'TABLE', 'UnitMeasure', 'COLUMN',
     'UnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'UnitMeasure', 'CONSTRAINT', 'PK_UnitMeasure_UnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'UnitMeasure', 'INDEX', 'PK_UnitMeasure_UnitMeasureCode'
go

exec sp_addextendedproperty 'MS_Description', 'Unit of measure description.', 'SCHEMA', 'Production', 'TABLE',
     'UnitMeasure', 'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'UnitMeasure', 'COLUMN', 'ModifiedDate'
go

create unique index AK_UnitMeasure_Name
    on Production.UnitMeasure (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE',
     'UnitMeasure', 'INDEX', 'AK_UnitMeasure_Name'
go

