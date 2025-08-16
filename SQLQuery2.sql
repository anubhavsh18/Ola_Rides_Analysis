
CREATE DATABASE Ola;
GO

USE Ola;
GO

SELECT * FROM dbo.Ola;

---------------------------------------------------
-- 1. Retrieve all Successful Bookings
---------------------------------------------------
CREATE VIEW Successful_Bookings AS
SELECT * 
FROM dbo.Ola
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

---------------------------------------------------
-- 2. Find the Average Ride Distance for each vehicle type
---------------------------------------------------
CREATE VIEW Average_Ride_Distance AS
SELECT Vehicle_Type, 
       AVG(Ride_Distance) AS avg_ride_distance 
FROM dbo.Ola
GROUP BY Vehicle_Type;

SELECT * FROM Average_Ride_Distance;

---------------------------------------------------
-- 3. Find the total number of cancelled rides by customers
---------------------------------------------------
CREATE VIEW Cancelled_Rides_By_Customers AS
SELECT COUNT(*) AS Cancelled_rides 
FROM dbo.Ola
WHERE Booking_Status = 'Cancelled by Customer';

SELECT * FROM Cancelled_Rides_By_Customers;

---------------------------------------------------
-- 4. List top 5 Customers who booked the highest number of rides
---------------------------------------------------
CREATE VIEW highest_number_of_rides AS
SELECT TOP 5
    Customer_id, 
    COUNT(Booking_ID) AS total_booking
FROM dbo.Ola
GROUP BY Customer_id
ORDER BY total_booking DESC;

SELECT * FROM highest_number_of_rides;

---------------------------------------------------
-- 5. Get the number of rides cancelled by drivers due to personal/car issue
---------------------------------------------------
CREATE VIEW cancelled_by_drivers_P_C_Issues AS
SELECT COUNT(*) AS cancelled_rides 
FROM dbo.Ola
WHERE Cancelled_rides_by_driver = 'Personal & Car related issue';

SELECT * FROM cancelled_by_drivers_P_C_Issues;

---------------------------------------------------
-- 6. Find max and min driver ratings for Prime Sedan Bookings
---------------------------------------------------
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating,
       MIN(Driver_Ratings) AS min_rating
FROM dbo.Ola 
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;

---------------------------------------------------
-- 7. Retrieve all rides where payment was done using UPI
---------------------------------------------------
CREATE VIEW UPI_Payment AS
SELECT * 
FROM dbo.Ola 
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

---------------------------------------------------
-- 8. Find the average customer rating per vehicle type
---------------------------------------------------
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, 
       AVG(Customer_Rating) AS avg_customer_rating
FROM dbo.Ola 
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Cust_Rating;

---------------------------------------------------
-- 9. Calculate the total booking value of successful rides
---------------------------------------------------
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_successful_ride_value
FROM dbo.Ola
WHERE Booking_Status = 'Success';

SELECT * FROM total_successful_ride_value;

---------------------------------------------------
-- 10. List all incomplete rides along with reason
---------------------------------------------------
CREATE VIEW incomplete_rides AS
SELECT Booking_ID, Incomplete_rides_reason
FROM dbo.Ola
WHERE Incomplete_rides = 1;

SELECT * FROM incomplete_rides;

