create table tSQLt.TestResult
(
    Id            int identity
        primary key,
    Class         nvarchar(max) not null,
    TestCase      nvarchar(max) not null,
    Name          as quotename([Class]) + '.' + quotename([TestCase]),
    TranName      nvarchar(max) not null,
    Result        nvarchar(max),
    Msg           nvarchar(max),
    TestStartTime datetime constraint DF:TestResult(TestStartTime) default getdate() not null,
	TestEndTime datetime
)
go

