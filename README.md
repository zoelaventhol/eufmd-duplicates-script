# eufmd-duplicates-script

## Description

This script was created by Zoe Laventhol for EUFMD's WorkReady Project.

It is intended to remove duplicate records from the `countries` table in the `db_manager` database.

For duplicate records, the first instance of a country should be kept, and all following ones should be deleted.

For example: Australia has 2 records with `id`s 6 and 7. The record with `id` 6 should be kept, and the record with `id` 7 should be deleted.

Be sure to test thoroughly locally, before using on the live project database.

## To set up tests

Testing setup and data are provided in the `init_db.sql` file. To test this script:

- Locally, open MySQL
- Create a test database - for example: `CREATE DATABASE eufmd_test;`
- Navgate to your test database: `USE eufmd_test;`
- Run the commands in the `init_db.sql` file. This should create a table identical to the `db_manager.countries` table, and fill it with 20 rows of text data, including 2 duplicated countries (Australia and Egypt).
- Update the database connection information in the Python script:

```Python
conn = mysql.connector.connect(
            host='localhost',
            user='your_user',
            password='your_pw',
            database='eufmd_test'
        )
```

- Run the script (instructions below), and review to make sure the correct records were deleted, and the rest of the data remains. Here is an SQL command to list all duplicates:

``` MySQL
SELECT c1.*
    FROM countries c1
    JOIN countries c2 ON c1.iso3 = c2.iso3 AND c1.id <> c2.id
    ORDER BY c1.iso3;
```

## To run

- Install sql-connector: `pip3 install mysql-connector-python`
- Run the script: `python3 remove_duplicates.py`
