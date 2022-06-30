create table HumanResources.JobCandidate
(
    JobCandidateID   int identity
        constraint PK_JobCandidate_JobCandidateID
            primary key,
    BusinessEntityID int
        constraint FK_JobCandidate_Employee_BusinessEntityID
            references HumanResources.Employee,
    Resume           xml,
    ModifiedDate     datetime
        constraint DF_JobCandidate_ModifiedDate default getdate() not null
)
go

exec sp_addextendedproperty 'MS_Description', 'Résumés submitted to Human Resources by job applicants.', 'SCHEMA',
     'HumanResources', 'TABLE', 'JobCandidate'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key for JobCandidate records.', 'SCHEMA', 'HumanResources',
     'TABLE', 'JobCandidate', 'COLUMN', 'JobCandidateID'
go

exec sp_addextendedproperty 'MS_Description', 'Primary key (clustered) constraint', 'SCHEMA', 'HumanResources', 'TABLE',
     'JobCandidate', 'CONSTRAINT', 'PK_JobCandidate_JobCandidateID'
go

exec sp_addextendedproperty 'MS_Description', 'Clustered index created by a primary key constraint.', 'SCHEMA',
     'HumanResources', 'TABLE', 'JobCandidate', 'INDEX', 'PK_JobCandidate_JobCandidateID'
go

exec sp_addextendedproperty 'MS_Description',
     'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.', 'SCHEMA',
     'HumanResources', 'TABLE', 'JobCandidate', 'COLUMN', 'BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA',
     'HumanResources', 'TABLE', 'JobCandidate', 'CONSTRAINT', 'FK_JobCandidate_Employee_BusinessEntityID'
go

exec sp_addextendedproperty 'MS_Description', 'Résumé in XML format.', 'SCHEMA', 'HumanResources', 'TABLE',
     'JobCandidate', 'COLUMN', 'Resume'
go

exec sp_addextendedproperty 'MS_Description', 'Date and time the record was last updated.', 'SCHEMA', 'HumanResources',
     'TABLE', 'JobCandidate', 'COLUMN', 'ModifiedDate'
go

create index IX_JobCandidate_BusinessEntityID
    on HumanResources.JobCandidate (BusinessEntityID)
go

exec sp_addextendedproperty 'MS_Description', 'Nonclustered index.', 'SCHEMA', 'HumanResources', 'TABLE',
     'JobCandidate', 'INDEX', 'IX_JobCandidate_BusinessEntityID'
go

create fulltext index []
    on HumanResources.JobCandidate (Resume)
	key index PK_JobCandidate_JobCandidateID
go

