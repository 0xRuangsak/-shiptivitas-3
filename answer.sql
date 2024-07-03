-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Generate a SQL query to calculate the daily average users before and after the feature change

-- Calculate the total number of daily users
SELECT COUNT(*) AS Daily_Users, strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')) AS Day 
FROM login_history 
GROUP BY strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')); 

-- Calculate the average number of daily users
SELECT AVG(a.dayCount) 
FROM (SELECT COUNT(*) AS dayCount 
      FROM login_history 
      GROUP BY strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'))) a;

-- Query for before the feature change
SELECT COUNT(*) AS Count, strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')) AS Day 
FROM login_history 
WHERE login_timestamp < 1527898041 
GROUP BY strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'));

-- Calculate the average daily users before the feature change
SELECT AVG(a.dayCount) 
FROM (SELECT COUNT(*) AS dayCount 
      FROM login_history 
      WHERE login_timestamp < 1527898041 
      GROUP BY strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'))) a;

-- Query for after the feature change
SELECT COUNT(*) AS Count, strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')) AS Day 
FROM login_history 
WHERE login_timestamp > 1527898040 
GROUP BY strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'));

-- Calculate the average daily users after the feature change
SELECT AVG(a.dayCount) 
FROM (SELECT COUNT(*) AS dayCount 
      FROM login_history 
      WHERE login_timestamp > 1527898040 
      GROUP BY strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'))) a;

-- PART 2: Generate a SQL query to find the number of status changes by card

SELECT cardID, COUNT(*) 
FROM card_change_history 
WHERE oldStatus != newStatus 
GROUP BY cardID;
