create table Person.Password
(
    BusinessEntityID int                                      not null,
    PasswordHash     varchar(128)                             not null,
    PasswordSalt     varchar(10)                              not null,
    rowguid          uniqueidentifier
        constraint DF_Password_rowguid default newid()        not null,
    ModifiedDate     datetime
        constraint DF_Password_ModifiedDate default getdate() not null
)
go

