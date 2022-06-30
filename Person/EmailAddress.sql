create table Person.EmailAddress
(
    BusinessEntityID int                                          not null,
    EmailAddressID   int identity,
    EmailAddress     nvarchar(50),
    rowguid          uniqueidentifier
        constraint DF_EmailAddress_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_EmailAddress_ModifiedDate default getdate() not null
)
go

