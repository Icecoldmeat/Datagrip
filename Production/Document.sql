create table Production.Document
(
    DocumentNode    hierarchyid                               not null
        constraint PK_Document_DocumentNode
            primary key,
    DocumentLevel   as [DocumentNode].[GetLevel](),
    Title           nvarchar(50)                              not null,
    Owner           int                                       not null
        constraint FK_Document_Employee_Owner
            references HumanResources.Employee,
    FolderFlag      bit
        constraint DF_Document_FolderFlag default 0           not null,
    FileName        nvarchar(400)                             not null,
    FileExtension   nvarchar(8)                               not null,
    Revision        nchar(5)                                  not null,
    ChangeNumber    int
        constraint DF_Document_ChangeNumber default 0         not null,
    Status          tinyint                                   not null
        constraint CK_Document_Status
            check ([Status] >= 1 AND [Status] <= 3),
    DocumentSummary nvarchar(max),
    Document        varbinary(max),
    rowguid         uniqueidentifier
        constraint DF_Document_rowguid default newid()        not null
        unique,
    ModifiedDate    datetime
        constraint DF_Document_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Product maintenance documents.', 'SCHEMA', 'Production', 'TABLE',
     'Document'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for Document records.', 'SCHEMA', 'Production', 'TABLE',
     'Document', 'COLUMN', 'DocumentNode'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'Production', 'TABLE',
     'Document', 'CONSTRAINT', 'PK_Document_DocumentNode'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'Production', 'TABLE', 'Document', 'INDEX', 'PK_Document_DocumentNode'
go

exec sp_addextendedproperty 'MS_Description', 'Depth in the document hierarchy.', 'SCHEMA', 'Production', 'TABLE',
     'Document', 'COLUMN', 'DocumentLevel'
go

exec sp_addextendedproperty 'MS_Description', 'Title of the document.', 'SCHEMA', 'Production', 'TABLE', 'Document',
     'COLUMN', 'Title'
go

exec sp_addextendedproperty 'MS_Description',
     'Employee who controls the document.  Foreign key to Employee.BusinessEntityID', 'SCHEMA', 'Production', 'TABLE',
     'Document', 'COLUMN', 'Owner'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Employee.BusinessEntityID.', 'SCHEMA',
     'Production', 'TABLE', 'Document', 'CONSTRAINT', 'FK_Document_Employee_Owner'
go

exec sp_addextendedproperty 'MS_Description', '0 = This is a folder, 1 = This is a document.', 'SCHEMA', 'Production',
     'TABLE', 'Document', 'COLUMN', 'FolderFlag'
go

exec sp_addextendedproperty 'MS_Description', 'File name of the document', 'SCHEMA', 'Production', 'TABLE', 'Document',
     'COLUMN', 'FileName'
go

exec sp_addextendedproperty 'MS_Description', 'File extension indicating the document type. For example, .doc or .txt.',
     'SCHEMA', 'Production', 'TABLE', 'Document', 'COLUMN', 'FileExtension'
go

exec sp_addextendedproperty 'MS_Description', 'Revision number of the document. ', 'SCHEMA', 'Production', 'TABLE',
     'Document', 'COLUMN', 'Revision'
go

exec sp_addextendedproperty 'MS_Description', 'Engineering change approval number.', 'SCHEMA', 'Production', 'TABLE',
     'Document', 'COLUMN', 'ChangeNumber'
go

exec sp_addextendedproperty 'MS_Description', '1 = Pending approval, 2 = Approved, 3 = Obsolete', 'SCHEMA',
     'Production', 'TABLE', 'Document', 'COLUMN', 'Status'
go

exec sp_addextendedproperty 'MS_Description', 'Check constraint [Status] BETWEEN (1) AND (3)', 'SCHEMA', 'Production',
     'TABLE', 'Document', 'CONSTRAINT', 'CK_Document_Status'
go

exec sp_addextendedproperty 'MS_Description', 'Document abstract.', 'SCHEMA', 'Production', 'TABLE', 'Document',
     'COLUMN', 'DocumentSummary'
go

exec sp_addextendedproperty 'MS_Description', 'Complete document.', 'SCHEMA', 'Production', 'TABLE', 'Document',
     'COLUMN', 'Document'
go

exec sp_addextendedproperty 'MS_Description',
     'ROWGUIDCOL number uniquely identifying the record. Required for FileStream.', 'SCHEMA', 'Production', 'TABLE',
     'Document', 'COLUMN', 'rowguid'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'Production',
     'TABLE', 'Document', 'COLUMN', 'ModifiedDate'
go

create unique index AK_Document_DocumentLevel_DocumentNode
    on Production.Document (DocumentLevel, DocumentNode)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'Document',
     'INDEX', 'AK_Document_DocumentLevel_DocumentNode'
go

create unique index AK_Document_rowguid
    on Production.Document (rowguid)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index. Used to support FileStream.', 'SCHEMA',
     'Production', 'TABLE', 'Document', 'INDEX', 'AK_Document_rowguid'
go

create index IX_Document_FileName_Revision
    on Production.Document (FileName, Revision)
go

exec sp_addextendedproperty 'MS_Description', 'Unique nonclustered index.', 'SCHEMA', 'Production', 'TABLE', 'Document',
     'INDEX', 'IX_Document_FileName_Revision'
go

create fulltext index []
    on Production.Document (DocumentSummary, Document)
	key index PK_Document_DocumentNode
go

