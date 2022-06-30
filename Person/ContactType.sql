create table Person.ContactType
(
    ContactTypeID int identity,
    Name          Name                                           not null,
    ModifiedDate  datetime
        constraint DF_ContactType_ModifiedDate default getdate() not null
)
go

