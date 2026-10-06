# SSIS Practice: CSV to Staging ETL

A self-built practice project that loads a customer CSV into SQL Server with data cleaning and error handling. It was built with SSIS in Visual Studio, deployed to the SSISDB catalog and scheduled with a SQL Server Agent job.

## What the package does
1. **Execute SQL Task** truncates `stg_Customer` and `err_Customer`, so the package can be re-run safely.
2. **Flat File Source** reads `data/customers.csv`.
3. **Derived Column** trims `FullName` and uppercases `Country`.
4. **Conditional Split** sends rows with a missing email or country to an error path.
5. **Data Conversion** converts types (string to `INT`, `DATE`, `NVARCHAR`). Rows that fail conversion go to the error path.
6. **OLE DB Destinations** load clean rows into `dbo.stg_Customer` and rejected rows into `dbo.err_Customer`, with the raw line and the reason.

## Tech used
SQL Server 2025 Developer, SSIS (SSISDB catalog), SQL Server Agent, SSMS, Visual Studio with the SSIS Projects extension.

## Setup
1. Run `sql/01_create_staging.sql` to create the `Staging` database and tables.
2. Open `SSIS_Practice.sln` in Visual Studio.
3. Update the Flat File connection to point to your local copy of `data/customers.csv`.
4. Run the package. With the sample file, expect **2 rows** in `stg_Customer` and **3 rows** in `err_Customer`.

## Sample result
| Table | Rows | Why |
|---|---|---|
| `stg_Customer` | 2 | Valid rows |
| `err_Customer` | 3 | 2 missing email or country, 1 invalid date |

## Deployment
The project was deployed to `SSISDB` (folder `Practice`) and scheduled daily at 06:00 through a SQL Server Agent job running the deployed package.

## Notes
Learning project built on sample data, not production code.