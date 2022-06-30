CREATE TRIGGER tSQLt.Private_NullCellTable_StopDeletes ON tSQLt.Private_NullCellTable INSTEAD OF DELETE, INSERT, UPDATE
AS
BEGIN
  RETURN;
END;
go

