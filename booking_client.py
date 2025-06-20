
import mysql.connector

#Establish connection
connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='password',  
    database='LittleLemon'
)

cursor = connection.cursor()

try:
    #Call GetMaxQuantity()
    cursor.execute("CALL GetMaxQuantity();")
    print("GetMaxQuantity:", cursor.fetchall())

    #Call AddBooking with test values
    cursor.execute("CALL AddBooking('TestUser', '2022-12-10', '18:00:00', 99, 2);")
    print("AddBooking:", cursor.fetchall())

    #Call UpdateBooking for BookingID 99
    cursor.execute("CALL UpdateBooking(99, '2022-01-10', '19:00:00');")
    print("UpdateBooking:", cursor.fetchall())

    #Call CancelBooking for BookingID 99
    cursor.execute("CALL CancelBooking(99);")
    print("CancelBooking:", cursor.fetchall())

    #Call ManageBooking - available table
    cursor.execute("CALL ManageBooking('Alice', '2022-12-12', '18:00:00', 10, 2);")
    print("ManageBooking (Available):", cursor.fetchall())

    #Call ManageBooking - already booked table
    cursor.execute("CALL ManageBooking('Bob', '2022-12-12', '18:00:00', 10, 2);")
    print("ManageBooking (Already Booked):", cursor.fetchall())

except mysql.connector.Error as err:
    print("Error:", err)


cursor.close()
connection.close()
