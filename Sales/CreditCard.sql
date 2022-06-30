create table Sales.CreditCard
(
    CreditCardID int identity
        constraint PK_CreditCard_CreditCardID
            primary key,
    CardType     nvarchar(50)                                   not null,
    CardNumber   nvarchar(25)                                   not null,
    ExpMonth     tinyint                                        not null,
    ExpYear      smallint                                       not null,
    ModifiedDate datetime
        constraint DF_CreditCard_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Customer credit card information.', 'SCHEMA', 'Sales', 'TABLE',
     'CreditCard'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for CreditCard records.', 'SCHEMA', 'Sales', 'TABLE',
     'CreditCard', 'COLUMN', 'CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'CreditCard', 'CONSTRAINT', 'PK_CreditCard_CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'CreditCard', 'INDEX', 'PK_CreditCard_CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Credit card name.', 'SCHEMA', 'Sales', 'TABLE', 'CreditCard', 'COLUMN',
     'CardType'
go

exec sp_addextendedproperty 'MS_Description', 'Credit card number.', 'SCHEMA', 'Sales', 'TABLE', 'CreditCard', 'COLUMN',
     'CardNumber'
go

exec sp_addextendedproperty 'MS_Description', 'Credit card expiration month.', 'SCHEMA', 'Sales', 'TABLE', 'CreditCard',
     'COLUMN', 'ExpMonth'
go

exec sp_addextendedproperty 'MS_Description', 'Credit card expiration year.', 'SCHEMA', 'Sales', 'TABLE', 'CreditCard',
     'COLUMN', 'ExpYear'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'CreditCard', 'COLUMN', 'ModifiedDate'
go

create unique index AK_CreditCard_CardNumber
    on Sales.CreditCard (CardNumber)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Sales', 'TABLE', 'CreditCard',
     'INDEX', 'AK_CreditCard_CardNumber'
go

