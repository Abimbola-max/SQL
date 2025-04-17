-- 1. Top 5 highest-rated drivers in Lagos
CREATE TABLE IF NOT EXISTS Top_Highest_Rated_Drivers AS
SELECT DriverID, Name, Rating, TotalRides
FROM Drivers
ORDER BY Rating DESC
LIMIT 5;

-- 2. Riders with more than 5 rides in the last 30 days in Lagos
CREATE TABLE IF NOT EXISTS Frequent_Riders AS
SELECT R.RiderID, R.Name, COUNT(Ri.RideID) AS RideCount
FROM Riders R
JOIN Rides Ri ON R.RiderID = Ri.RiderID
GROUP BY R.RiderID, R.Name
HAVING RideCount > 5;

-- 3. Total revenue for the past month for Lagos rides
CREATE TABLE IF NOT EXISTS Total_Revenue_Last_Month AS
SELECT SUM(p.Amount) AS TotalRevenue
FROM Payments p
JOIN Rides Ri ON p.RideID = Ri.RideID;

-- 4. Area in Lagos with the most rides
CREATE TABLE IF NOT EXISTS Area_With_Most_Rides AS
SELECT R.City, COUNT(Ri.RideID) AS RideCount
FROM Riders R
JOIN Rides Ri ON R.RiderID = Ri.RiderID
GROUP BY R.City
ORDER BY RideCount DESC
LIMIT 1;


-- 5
SELECT
    d.DriverID,
    d.Name,
    SUM(r.Fare) AS totalrevenue
FROM
    Drivers d
JOIN
    Rides r ON d.DriverID = r.DriverID
WHERE
    r.City = 'Lagos'
GROUP BY
    d.DriverID, d.Name
ORDER BY
    totalrevenue DESC
LIMIT 1;

-- 6
WITH AverageFare AS (
    SELECT AVG(Fare) AS avg_fare FROM Rides
)
SELECT
    r.RideID,
    r.Fare,
    af.avg_fare AS AverageFare
FROM
    Rides r, AverageFare af
WHERE
    r.Fare > af.avg_fare * 1.5 OR r.Fare < af.avg_fare * 0.5;

-- 7
-- Find riders in Lagos who rated their drivers less than 3 on average
CREATE TABLE IF NOT EXISTS Low_Rated_Riders AS
SELECT
    r.RiderID,
    r.Name,
    AVG(ri.Rating) AS AverageDriverRating
FROM
    Riders r
JOIN
    Rides ri ON r.RiderID = ri.RiderID
GROUP BY
    r.RiderID, r.Name
HAVING
    AVG(ri.Rating) < 3;

    -- 8
    -- Find the top 5 Lagos neighborhoods with the highest average fare
CREATE TABLE IF NOT EXISTS Top_5_Neighborhoods AS
SELECT
    r.City,
    AVG(ri.Fare) AS AverageFare
FROM
    Riders r
JOIN
    Rides ri ON r.RiderID = ri.RiderID
GROUP BY
    r.City
ORDER BY
    AverageFare DESC
LIMIT 5;

-- 9
-- Drivers in Lagos who have not received any rides in the last 30 days
CREATE TABLE IF NOT EXISTS Inactive_Drivers AS
SELECT
    d.DriverID,
    d.Name
FROM
    Drivers d
LEFT JOIN
    Rides r ON d.DriverID = r.DriverID
WHERE
    r.RideID IS NULL OR r.RideDate < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 10
-- Rides in Lagos with the longest distance (top 5)
CREATE TABLE IF NOT EXISTS Longest_Rides AS
SELECT
    r.RideID,
    r.DistanceKM
FROM
    Rides r
WHERE
    r.City = 'Lagos'
ORDER BY
    r.DistanceKM DESC
LIMIT 5;

-- 11
-- Find the number of rides each driver in Lagos has had, sorted by the most rides
CREATE TABLE IF NOT EXISTS Driver_Ride_Count AS
SELECT
    d.DriverID,
    d.Name,
    COUNT(r.RideID) AS RideCount
FROM
    Drivers d
JOIN
    Rides r ON d.DriverID = r.DriverID
WHERE
    r.City = 'Lagos'
GROUP BY
    d.DriverID, d.Name
ORDER BY
    RideCount DESC;

-- 12
-- dentify the payment methods used by Lagos riders for rides over ₦50,000
CREATE TABLE IF NOT EXISTS High_Value_Payments AS
SELECT
    p.PaymentMethod,
    COUNT(p.PaymentID) AS PaymentCount
FROM
    Payments p
JOIN
    Rides r ON p.RideID = r.RideID
WHERE
    p.Amount > 50000
GROUP BY
    p.PaymentMethod
ORDER BY
    PaymentCount DESC;

-- 13
-- Find rides in Lagos with a duration longer than 2 hours
CREATE TABLE IF NOT EXISTS Long_Duration_Rides AS
SELECT
    r.RideID,
    r.Duration
FROM
    Rides r
WHERE
    r.City = 'Lagos' AND r.Duration > 120; -- Assuming Duration is in minutes

-- 14




