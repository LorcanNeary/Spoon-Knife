create or alter procedure sp_Insert_User
(
	--user attributes
@full_name varchar(100),
@email varchar(200),
@oid varchar(100)
)
WITH EXECUTE AS 'dbo'
AS
BEGIN
	declare @dummy_company_id int;

		--selects the id of the company record associated with 'initial_import_company' 
	set @dummy_company_id = (select id from [dbo].[company] c where c.name like 'initial_import_company')

		--Creates new company record 
	INSERT INTO [dbo].[user]([company_id],[oid],[email],[full_name],[is_active],[is_superuser]) 
				VALUES (@dummy_company_id, @oid, @email, @full_name,1,0);
			END
