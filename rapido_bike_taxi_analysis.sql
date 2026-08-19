Create Database rapido;
USE rapido;


#1. Retrieve All Successful Bookings?
Create View Successful_Bookings As
SELECT * 
FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;



#2.Find The Average Ride_Distance for each Ride Distance?
CREATE VIEW Ride_Distance_for_each_Vehicle AS
SELECT
Vehicle_Type, AVG(Ride_Distance) AS Avg_Distance
From Bookings GROUP BY Vehicle_Type;

SELECT *
FROM Ride_Distance_for_each_Vehicle;



#3. Get The Totla Number Cencelad Rids By Customers?
CREATE VIEW Cencelad_Rids_By_Customers AS
SELECT
COUNT(*) FROM Bookings
WHERE Booking_Status = 'Cancelad By Customers';

SELECT * FROM Cencelad_Rids_By_Customers;


#4.Lise The Top 5 Customer Who Booked The Highest Number Of Rides?
CREATE VIEW Top_5_Customer AS
SELECT 
Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM Top_5_Customer;


#5. Get the number of rides canceled by drivers due to personal and car-related issues?
CREATE VIEW Rides_Canceled_by_Drivers_P_C_Issues AS
SELECT
COUNT(*) FROM Bookings
WHERE canceled_Rides_by_Driver = 'personal & car-related issues';

SELECT * FROM Rides_Canceled_by_Drivers_P_C_Issues;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings?
Create View Max_Min_Driver_Rating As
SELECT 
MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;


#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

#8. Find the average customer rating per vehicle type?
CREATE VIEW AVG_Customer_Rating AS
SELECT
Vehicle_Type, AVG(Customer_Rating) AS Avg_Customer_Rating
From Bookings GROUP BY Vehicle_Type;

SELECT * FROM AVG_Customer_Rating;
#9. Calculate the total booking value of rides completed successfully?
CREATE VIEW Booking_Value_Successfully AS
SELECT 
SUM(Booking_Value) as total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Booking_Value_Successfully;

#10. List all incomplete rides along with the reason?
CREATE VIEW Booking_ID_FOR_Incomplete_Rides_Reason AS
SELECT 
Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Booking_ID_FOR_Incomplete_Rides_Reason;