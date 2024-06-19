# Script to set up a table to test remove_duplicates script
# EUFMD WorkReady project
# 2024-06-19

import mysql.connector

# function to open and read a file
# @params: path {string}: file path to the file you want to open
def read_sql_file(path):
    with open(path, 'r') as file:
        return file.read()

def test_setup():
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

        # Read from SQL file
        sql = read_sql_file('init_db.sql')

        # Execute the SQL code one query at a time
        for statement in sql.split(';'):
            # remove any trailing spaces
            if statement.strip():
                cursor.execute(statement)
        
        # Commit the transaction
        conn.commit()

        print("Countries table added successfully.")

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        # Close cursor and connection in finally block
        if cursor:
            cursor.close()
        if conn and conn.is_connected():
            conn.close()

if __name__ == "__main__":
    test_setup()
