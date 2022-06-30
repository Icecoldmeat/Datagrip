create table Person.BusinessEntityAddress
(
    BusinessEntityID int                                                   not null,
    AddressID        int                                                   not null,
    AddressTypeID    int                                                   not null,
    rowguid          uniqueidentifier
        constraint DF_BusinessEntityAddress_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_BusinessEntityAddress_ModifiedDate default getdate() not null
)
go

