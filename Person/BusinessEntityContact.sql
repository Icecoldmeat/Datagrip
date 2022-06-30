create table Person.BusinessEntityContact
(
    BusinessEntityID int                                                   not null,
    PersonID         int                                                   not null,
    ContactTypeID    int                                                   not null,
    rowguid          uniqueidentifier
        constraint DF_BusinessEntityContact_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_BusinessEntityContact_ModifiedDate default getdate() not null
)
go

