create table Person.Person
(
    BusinessEntityID      int                               not null,
    PersonType            nchar(2)                          not null,
    NameStyle             NameStyle
        constraint DF_Person_NameStyle default 0            not null,
    Title                 nvarchar(8),
    FirstName             Name                              not null,
    MiddleName            Name,
    LastName              Name                              not null,
    Suffix                nvarchar(10),
    EmailPromotion        int
        constraint DF_Person_EmailPromotion default 0       not null,
    AdditionalContactInfo xml,
    Demographics          xml,
    rowguid               uniqueidentifier
        constraint DF_Person_rowguid default newid()        not null,
    ModifiedDate          datetime
        constraint DF_Person_ModifiedDate default getdate() not null
)
go

