import mysql.connector
from robot.libraries.BuiltIn import BuiltIn
#my_var = BuiltIn().get_variable_value("${MY_VAR}")
mydb = mysql.connector.connect(
          host="0.tcp.in.ngrok.io",
          port=18185,
          user="root",
          password="Hiran18$",
          database="hevodata"
        )
def create_table_in_mysql(tablename):
    """
    This function will create new table in mySQL data base
    :param tablename:
    :return:
    """
    try:
        # Create a new table
        mycursor = mydb.cursor()
        create_query = f"CREATE TABLE {tablename}(id SERIAL PRIMARY KEY,name VARCHAR(50) NOT NULL,age INTEGER,last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP)"
        mycursor.execute(create_query)
        print("Table created and data inserted successfully!")
    except:
        raise AssertionError("Data base not connected ")

def insertrecord_into_table(tablename,name,age):
    """
    This will insert the record in table
    :param tablename:
    :param name:
    :param age:
    :return:
    """
    try:
        mycursor = mydb.cursor()
        insert_query=f"INSERT INTO {tablename}(name, age) VALUES ('{name}', {age})"
        mycursor.execute(insert_query)
        mydb.commit()  # commit the changes
        print(f"record inserted name :{name} age {age}")
    except:
        raise AssertionError("unable to insert record to table ")

def update_record_in_mysql(tablename,originalvalue,newvalue):
    """
    This function will update the record in SQL databse
    :param tablename:
    :param originalvalue:
    :param newvalue:
    :return:
    """
    try:
        mycursor = mydb.cursor()
        update_query = f"update {tablename} set name='{newvalue}' where name='{originalvalue}'"
        mycursor.execute(update_query)
        mydb.commit()  # commit the changes
        print(f"record updated name :{originalvalue} age {newvalue}")
    except:
        raise AssertionError("unable to update the record ")

def fetch_all_details_from_mysql(table):
    try:
        mycursor = mydb.cursor()
        select_query= f"select * from {table}"
        mycursor.execute(select_query)
        result = mycursor.fetchall()
        for row in result:
            print(row)
    except:
        print("unable to fetch the table values")

def drop_table(tablename):
    """
    drop the table from database
    :param tablename:
    :return:
    """
    try:
        mycursor = mydb.cursor()
        drop_query = f"DROP TABLE {tablename}"
        mycursor.execute(drop_query)
        mydb.commit()
        print(f"{tablename} is dropped")
    except:
        print("unable to drop the table")


