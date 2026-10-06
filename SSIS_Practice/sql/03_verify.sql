SELECT MAX(LoadedAt) AS last_error_load FROM Staging.dbo.err_Customer;
SELECT COUNT(*) AS stg_rows FROM Staging.dbo.stg_Customer;