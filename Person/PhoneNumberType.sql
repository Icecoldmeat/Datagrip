create table Person.PhoneNumberType
(
    PhoneNumberTypeID int identity,
    Name              Name                                           not null,
    ModifiedDate      datetime
        constraint DF_PhoneNumberType_ModifiedDate default getdate() not null
)
go

