create table Person.CountryRegion
(
    CountryRegionCode nvarchar(3)                                  not null,
    Name              Name                                         not null,
    ModifiedDate      datetime
        constraint DF_CountryRegion_ModifiedDate default getdate() not null
)
go

