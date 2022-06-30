create table Person.PersonPhone
(
    BusinessEntityID  int                                        not null,
    PhoneNumber       Phone                                      not null,
    PhoneNumberTypeID int                                        not null,
    ModifiedDate      datetime
        constraint DF_PersonPhone_ModifiedDate default getdate() not null
)
go

