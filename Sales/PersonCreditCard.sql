create table Sales.PersonCreditCard
(
    BusinessEntityID int                                              not null
        constraint FK_PersonCreditCard_Person_BusinessEntityID
            references Person.Person (BusinessEntityID),
    CreditCardID     int                                              not null
        constraint FK_PersonCreditCard_CreditCard_CreditCardID
            references Sales.CreditCard,
    ModifiedDate     datetime
        constraint DF_PersonCreditCard_ModifiedDate default getdate() not null,
    constraint PK_PersonCreditCard_BusinessEntityID_CreditCardID
        primary key (BusinessEntityID, CreditCardID)
)
go

exec sp_addextendedproperty 'MS_Description',
     'Cross-reference table mapping people to their credit card information in the CreditCard table. ', 'SCHEMA',
     'Sales', 'TABLE', 'PersonCreditCard'
go

exec sp_addextendedproperty 'MS_Description',
     'Business entity identification number. Foreign key to Person.BusinessEntityID.', 'SCHEMA', 'Sales', 'TABLE',
     'PersonCreditCard', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA',
     'Sales', 'TABLE', 'PersonCreditCard', 'CONSTRAINT', 'FK_PersonCreditCard_Person_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description',
     'Credit card identification number. Foreign key to CreditCard.CreditCardID.', 'SCHEMA', 'Sales', 'TABLE',
     'PersonCreditCard', 'COLUMN', 'CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing CreditCard.CreditCardID.', 'SCHEMA',
     'Sales', 'TABLE', 'PersonCreditCard', 'CONSTRAINT', 'FK_PersonCreditCard_CreditCard_CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Sales', 'TABLE',
     'PersonCreditCard', 'COLUMN', 'ModifiedDate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Sales', 'TABLE',
     'PersonCreditCard', 'CONSTRAINT', 'PK_PersonCreditCard_BusinessEntityID_CreditCardID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA', 'Sales',
     'TABLE', 'PersonCreditCard', 'INDEX', 'PK_PersonCreditCard_BusinessEntityID_CreditCardID'
go

