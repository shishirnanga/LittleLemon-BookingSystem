import mysql.connector


conn = mysql.connector.connect(
    host="localhost",
    user="yourusername",
    password="yourpassword",
    database="LittleLemon"
)

cursor = conn.cursor()


cursor.callproc('GetMaxQuantity')

for result in cursor.stored_results():
    print("Max Quantity:", result.fetchall())

args = ("John Doe", "2024-05-10", "19:00:00", 5, 4)
cursor.callproc('AddBooking', args)

conn.commit()
cursor.close()
conn.close()
