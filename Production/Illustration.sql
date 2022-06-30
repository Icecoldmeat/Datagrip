create table Production.Illustration
(
    IllustrationID int identity
        constraint PK_Illustration_IllustrationID
            primary key,
    Diagram        xml,
    ModifiedDate   datetime
        constraint DF_Illustration_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Bicycle assembly diagrams.', 'SCHEMA', 'Production', 'TABLE',
     'Illustration'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for Illustration records.', 'SCHEMA', 'Production', 'TABLE',
     'Illustration', 'COLUMN', 'IllustrationID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'Illustration', 'CONSTRAINT', 'PK_Illustration_IllustrationID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'Illustration', 'INDEX', 'PK_Illustration_IllustrationID'
go

exec sp_addextendedproperty 'MS_Description', 'Illustrations used in manufacturing instructions. Stored as XML.',
     'SCHEMA', 'Production', 'TABLE', 'Illustration', 'COLUMN', 'Diagram'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'Illustration', 'COLUMN', 'ModifiedDate'
go

