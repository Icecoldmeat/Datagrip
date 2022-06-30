create table Production.Culture
(
    CultureID    nchar(6)                                    not null
        constraint PK_Culture_CultureID
            primary key,
    Name         Name                                        not null,
    ModifiedDate datetime
        constraint DF_Culture_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description',
     'Lookup table containing the languages in which some AdventureWorks data is stored.', 'SCHEMA', 'Production',
     'TABLE', 'Culture'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for Culture records.', 'SCHEMA', 'Production', 'TABLE',
     'Culture', 'COLUMN', 'CultureID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'Culture', 'CONSTRAINT', 'PK_Culture_CultureID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'Culture', 'INDEX', 'PK_Culture_CultureID'
go

exec sp_addextendedproperty 'MS_Description', 'Culture description.', 'SCHEMA', 'Production', 'TABLE', 'Culture',
     'COLUMN', 'Name'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'Culture', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Culture_Name
    on Production.Culture (Name)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'Culture',
     'INDEX', 'AK_Culture_Name'
go

