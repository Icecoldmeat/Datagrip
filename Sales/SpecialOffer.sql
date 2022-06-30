create table Sales.SpecialOffer
(
    SpecialOfferID int identity
        constraint PK_SpecialOffer_SpecialOfferID
            primary key,
    Description    nvarchar(255)                                  not null,
    DiscountPct    smallmoney
        constraint DF_SpecialOffer_DiscountPct default 0.00       not null
        constraint CK_SpecialOffer_DiscountPct
            check ([DiscountPct] >= 0.00),
    Type           nvarchar(50)                                   not null,
    Category       nvarchar(50)                                   not null,
    StartDate      datetime                                       not null,
    EndDate        datetime                                       not null,
    MinQty         int
        constraint DF_SpecialOffer_MinQty default 0               not null
        constraint CK_SpecialOffer_MinQty
            check ([MinQty] >= 0),
    MaxQty         int
        constraint CK_SpecialOffer_MaxQty
            check ([MaxQty] >= 0),
    rowguid        uniqueidentifier
        constraint DF_SpecialOffer_rowguid default newid()        not null,
    ModifiedDate   datetime
        constraint DF_SpecialOffer_ModifiedDate default getdate() not null,
    constraint CK_SpecialOffer_EndDate
        check ([EndDate] >= [StartDate])
)
go

exec sp_addextendedproperty 'MS_Description', 'Sale discounts lookup table.', 'SCHEMA', 'Sales', 'TABLE', 'SpecialOffer'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for SpecialOffer records.', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'COLUMN', 'SpecialOfferID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'CONSTRAINT', 'PK_SpecialOffer_SpecialOfferID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'SpecialOffer', 'INDEX', 'PK_SpecialOffer_SpecialOfferID'
go

exec sp_addextendedproperty 'MS_Description', 'Discount description.', 'SCHEMA', 'Sales', 'TABLE', 'SpecialOffer',
     'COLUMN', 'Description'
go

exec sp_addextendedproperty 'MS_Description', 'Discount precentage.', 'SCHEMA', 'Sales', 'TABLE', 'SpecialOffer',
     'COLUMN', 'DiscountPct'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [DiscountPct] >= (0.00)', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'CONSTRAINT', 'CK_SpecialOffer_DiscountPct'
go

exec sp_addextendedproperty 'MS_Description', 'Discount type category.', 'SCHEMA', 'Sales', 'TABLE', 'SpecialOffer',
     'COLUMN', 'Type'
go

exec sp_addextendedproperty 'MS_Description', 'Group the discount applies to such as Reseller or Customer.', 'SCHEMA',
     'Sales', 'TABLE', 'SpecialOffer', 'COLUMN', 'Category'
go

exec sp_addextendedproperty 'MS_Description', 'Discount start date.', 'SCHEMA', 'Sales', 'TABLE', 'SpecialOffer',
     'COLUMN', 'StartDate'
go

exec sp_addextendedproperty 'MS_Description', 'Discount end date.', 'SCHEMA', 'Sales', 'TABLE', 'SpecialOffer',
     'COLUMN', 'EndDate'
go

exec sp_addextendedproperty 'MS_Description', 'Minimum discount percent allowed.', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'COLUMN', 'MinQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [MinQty] >= (0)', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'CONSTRAINT', 'CK_SpecialOffer_MinQty'
go

exec sp_addextendedproperty 'MS_Description', 'Maximum discount percent allowed.', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'COLUMN', 'MaxQty'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [MaxQty] >= (0)', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'CONSTRAINT', 'CK_SpecialOffer_MaxQty'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA',
     'Sales', 'TABLE', 'SpecialOffer', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [EndDate] >= [StartDate]', 'SCHEMA', 'Sales', 'TABLE',
     'SpecialOffer', 'CONSTRAINT', 'CK_SpecialOffer_EndDate'
go

create unique index AK_SpecialOffer_rowguid
    on Sales.SpecialOffer (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support replication samples.',
     'SCHEMA', 'Sales', 'TABLE', 'SpecialOffer', 'INDEX', 'AK_SpecialOffer_rowguid'
go

