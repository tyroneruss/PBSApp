from mysql.connector import MySQLConnection, Error
from python_mysql_dbconfig import read_db_config

def insert_case(order,name,chapter,bi,state,description):
    query = "INSERT INTO forms(Order,Name,Chapter,BI,State,Description) " 
            "VALUES(%s,%s,%s,%s,%s,%s)"
    args = (title, isbn)
 
    try:
	
		conn = mysql.connector.connect(host='jdbc:mysql://localhost:3306/pbsdb',
										user='root',password='rhouse11',database='pbsdb')
							   
        cursor = conn.cursor()
        cursor.execute(query, args)
 
        if cursor.lastrowid:
            print('last insert id', cursor.lastrowid)
        else:
            print('last insert id not found')
 
        conn.commit()
    except Error as error:
        print(error)
 
    finally:
        cursor.close()
        conn.close()
 
def main():
	
	insert_case('A Sudden Light','9781439187036')
 
if __name__ == '__main__':
    main()