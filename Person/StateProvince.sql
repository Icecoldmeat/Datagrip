create table Person.StateProvince
(
    StateProvinceID         int identity,
    StateProvinceCode       nchar(3)                                  not null,
    CountryRegionCode       nvarchar(3)                               not null,
    IsOnlyStateProvinceFlag Flag
        constraint DF_StateProvince_IsOnlyStateProvinceFlag default 1 not null,
    Name                    Name                                      not null,
    TerritoryID             int                                       not null,
    rowguid                 uniqueidentifier
        constraint DF_StateProvince_rowguid default newid()           not null,
    ModifiedDate            datetime
        constraint DF_StateProvince_ModifiedDate default getdate()    not null
)
go

