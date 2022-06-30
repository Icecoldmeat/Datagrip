create table tSQLt.Private_RenamedObjectLog
(
    Id           int identity
        constraint PK__Private_RenamedObjectLog__Id
            primary key,
    ObjectId     int           not null,
    OriginalName nvarchar(max) not null
)
go

