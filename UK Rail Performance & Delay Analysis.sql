# View data
SELECT * FROM train_data;

# Check missing values
SELECT COUNT(*)
FROM train_data
WHERE Price IS NULL;

SELECT COUNT(*)
FROM train_data
WHERE Journey_Status IS NULL;

SELECT COUNT(*)
FROM train_data
WHERE Reason_for_Delay IS NULL;


# Check structure
DESCRIBE train_data;

# Change data types
ALTER TABLE train_data
MODIFY Date_of_Purchase DATE; 

ALTER TABLE train_data
MODIFY Date_of_Journey DATE;

ALTER TABLE train_data
MODIFY Time_of_Purchase TIME;

ALTER TABLE train_data
MODIFY Departure_Time TIME;

ALTER TABLE train_data
MODIFY Arrival_Time TIME;

ALTER TABLE train_data
MODIFY Actual_Arrival_Time TIME;

ALTER TABLE train_data
MODIFY Price FLOAT;

# Total trips
SELECT COUNT(*) AS Total_Trips
FROM train_data;

# Total Revenue
SELECT SUM(Price) AS Total_Revenue
FROM train_data;

# Average ticket price
SELECT ROUND(AVG(Price), 2) AS Average_Ticket_price
FROM train_data;

# Journey Status Analysis
SELECT Journey_Status, COUNT(*) AS Total
FROM train_data
GROUP BY Journey_Status;

# Delay Percentage
SELECT 
	(SUM(CASE WHEN Journey_Status = 'Delayed' THEN 1 ELSE 0 END) * 100/COUNT(*)) AS Delay_Percentage
FROM train_data;

# Most Popular Routes
SELECT Departure_Station, Arrival_Destination, COUNT(*) AS Trips
FROM train_data
GROUP BY Departure_Station, Arrival_Destination
ORDER BY Trips DESC
LIMIT 10;
    
# Trips by hour    
SELECT HOUR(Departure_Time) AS Hour, COUNT(*) AS Trips
FROM train_data
GROUP BY Hour
ORDER BY Hour;

# Revenue by hour
SELECT HOUR(Departure_Time) AS Hour, SUM(Price) AS Revenue
FROM train_data
GROUP BY Hour
ORDER BY Hour;

# Delay rate by hour
SELECT Day(Date_of_Journey) AS Day, 
	(SUM(CASE WHEN Journey_Status = 'Delayed' THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS Delay_Rate
FROM train_data
GROUP BY Day
ORDER BY Day;

# Ticket Type Distribution
SELECT Ticket_Type, COUNT(*) AS Trips
FROM train_data
GROUP BY Ticket_Type;


SELECT *
FROM train_data;