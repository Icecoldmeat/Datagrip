create table Person.Address
(
    AddressID       int identity,
    AddressLine1    nvarchar(60)                             not null,
    AddressLine2    nvarchar(60),
    City            nvarchar(30)                             not null,
    StateProvinceID int                                      not null,
    PostalCode      nvarchar(15)                             not null,
    SpatialLocation geography,
    rowguid         uniqueidentifier
        constraint DF_Address_rowguid default newid()        not null,
    ModifiedDate    datetime
        constraint DF_Address_ModifiedDate default getdate() not null
)
go

