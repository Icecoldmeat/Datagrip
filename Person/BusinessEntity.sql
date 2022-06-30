create table Person.BusinessEntity
(
    BusinessEntityID int identity,
    rowguid          uniqueidentifier
        constraint DF_BusinessEntity_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_BusinessEntity_ModifiedDate default getdate() not null
)
go

