# eufmd-duplicates-script

## Description

This script was created by Zoe Laventhol for EUFMD's WorkReady Project.

It is intended to remove duplicate records from the `countries` table in the `db_manager` database.

For duplicate records, the first instance of a country should be kept, and all following ones should be deleted.

For example:

- Australia has 2 records with `id`s 6 and 7.
- The record with `id` 6 should be kept, and the record with `id` 7 should be deleted.

Be sure to test thoroughly locally, before using on the live project database.

## To set up

- In this directory, run `pip3 install mysql-connector-python` to install sql-connector.
- Locally, open MySQL.
- Create a test database - for example: `CREATE DATABASE eufmd_test;`.
- Update the database connection information in the Python script:

```Python
conn = mysql.connector.connect(
            host='localhost',
            user='your_MySQL_username',
            password='your_MySQL_pw',
            database='eufmd_test'
        )
```

## To test

- Run the `test_setup` script to create a table `countries` with some sample data, including some duplicates: `python3 test_setup.py`
  - Duplicate countries in this test set are Australia (ids 6 and 7) and Egypt (ids 9 & 10.)
- Run the `remove_duplicates` script, and review to make sure the correct records were deleted, and the rest of the data remains.
  - You should have _only_ Australia with id 6, and Egypt with id 9. Records with ids 7 and 10 should be deleted.

## Important ! Before running this script

- Communicate with your team. Make sure none of your colleagues are relying on a country id that will be deleted (or at least, that they are ready for this change).
- Notify your FAO team lead(s).
- Plan a time to run this script _outside_ of usual working hours (aka between 18h - 9h on weekdays, or on a weekend).
- Create a backup of the original table, just in case:

``` MySQL
CREATE TABLE countries_backup LIKE countries;
INSERT INTO countries_backup SELECT * FROM countries;
```

- Check your duplicates: make a note, so you can check back and make sure they were deleted. Here is an SQL command to list all duplicates (by `iso3`):

``` MySQL
SELECT c1.*
    FROM countries c1
    JOIN countries c2 ON c1.iso3 = c2.iso3 AND c1.id <> c2.id
    ORDER BY c1.iso3;
```

## To run

Once you're ready:

- Update the database connection information in the `remove_duplicates`script (**below values are placeholders**, you must obtain the database connection information from the DB Manager repo):

```Python
conn = mysql.connector.connect(
            host='host_info',
            user='MySQL_username',
            password='MySQL_pw',
            database='db_manager'
        )
```

- Then, you can run the script: `python3 remove_duplicates.py`.
- After you finish:
  - Check to make sure all duplicates were deleted. (Use the MySQL command above, it should return "Empty set".)
  - Skim through the known duplicate countries and make sure the correct records were deleted.
  - If everything looks okay, delete your backup table: `DROP TABLE countries_backup;`

## If there is any problem

- Restore the `countries` table from your `countries_backup` table:

```MySQL
-- Clear all data from "countries" table
DELETE FROM countries;

-- Restore data from "countries_backup" table
INSERT INTO countries
SELECT * FROM countries_backup;
```

- Test thoroughly to figure out the problem, then try again.
- If you're stuck or delayed in moving forward, communicate with your team.