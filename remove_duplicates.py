# Script to remove duplicates from the db_manager.countries table
# EUFMD WorkReady project
# 2024-06-17

import mysql.connector

def remove_duplicates():
    conn = None
    cursor = None
    try:
        # Connect to the database
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='root',
            database='eufmd_test'
        )
        cursor = conn.cursor()

        # Create a temporary table to hold unique records
        cursor.execute("""
        CREATE TEMPORARY TABLE countries_temp AS
        SELECT MIN(id) AS id, iso3, MIN(code_moodle) AS code_moodle, MIN(name_moodle) AS name_moodle,
        MIN(name_un) AS name_un, MIN(region) AS region, MIN(subregion) AS subregion, 
        MIN(eufmd_mn) AS eufmd_mn, MIN(eufmd_na) AS eufmd_na, MIN(eufmd_me) AS eufmd_me, 
        MIN(eufmd_seen) AS eufmd_seen, MIN(eufmd_nc) AS eufmd_nc, MIN(eufmd_enc) AS eufmd_enc, 
        MIN(lat) AS lat, MIN(lon) AS lon
        FROM countries
        GROUP BY iso3;
        """)

        # Delete all records from the original table
        cursor.execute("DELETE FROM countries;")

        # Insert unique records back into the original table
        cursor.execute("""
        INSERT INTO countries (id, iso3, code_moodle, name_moodle, name_un, region, subregion, 
        eufmd_mn, eufmd_na, eufmd_me, eufmd_seen, eufmd_nc, eufmd_enc, lat, lon)
        SELECT id, iso3, code_moodle, name_moodle, name_un, region, subregion, 
        eufmd_mn, eufmd_na, eufmd_me, eufmd_seen, eufmd_nc, eufmd_enc, lat, lon
        FROM countries_temp;
        """)

        # Commit the transaction
        conn.commit()

        # Drop the temporary table
        cursor.execute("DROP TEMPORARY TABLE countries_temp;")

        print("Duplicates removed successfully.")

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        # Close cursor and connection in finally block
        if cursor:
            cursor.close()
        if conn and conn.is_connected():
            conn.close()

if __name__ == "__main__":
    remove_duplicates()
