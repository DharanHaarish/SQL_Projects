SELECT 
    *
FROM
    olympics;

-- Getting the Total number of Medals(at-least 1) won each Olympics by a Country. 

SELECT 
    Team, Games, COUNT(Medal) AS Medals
FROM
    olympics
WHERE
    Medal IS NOT NULL
GROUP BY Games , Team
ORDER BY Games , 3 DESC;

-- Getting the top 10 Nations that has won the most number of Medals in Olympic history.

SELECT 
    Team, COUNT(Medal) AS Medals
FROM
    olympics
WHERE
    Medal IS NOT NULL
GROUP BY Team
ORDER BY 2 DESC
LIMIT 10;

--  Getting the top 10 Nations that has won the most number of Medals in Olympic history after the breakdown of Soviet Union

SELECT 
    Team, COUNT(Medal) AS Medals
FROM
    olympics
WHERE
    Medal IS NOT NULL AND Year>1992
GROUP BY Team
ORDER BY 2 DESC
LIMIT 10;

-- Selecting the top 10 teams that have won most number of Medals in Summer Olympics

SELECT 
    Team, COUNT(Medal) AS Medals
FROM
    olympics
WHERE
    Medal IS NOT NULL
        AND Games LIKE '%summer%'
GROUP BY Team
ORDER BY 2 DESC
LIMIT 10;

-- Selecting the top 10 teams that have won most number of Medals in Winter Olympics

SELECT 
    Team, COUNT(Medal) AS Medals
FROM
    olympics
WHERE
    Medal IS NOT NULL
        AND Games LIKE '%winter%'
GROUP BY Team
ORDER BY 2 DESC
LIMIT 10;

-- Selecting top 10 Male Athletes that have won most number of Medals in Olympics.

SELECT 
    DISTINCT(name), Team, COUNT(Medal) AS Total_No_Of_Medals
FROM
    olympics
WHERE
    Sex = 'M'
GROUP BY name , Team
ORDER BY 3 DESC
LIMIT 10;

-- Selecting top 10 Female Athletes that have won most number of Medals in Olympics

SELECT 
    DISTINCT(name), Team, COUNT(Medal) AS Total_No_Of_Medals
FROM
    olympics
WHERE
    Sex = 'F'
GROUP BY name , Team
ORDER BY 3 DESC
LIMIT 10;

-- Finding the Average age of Male and Female Athletes that have won a medal in the Olympics

SELECT 
    Sex, ROUND(AVG(Age), 2)
FROM
    Olympics
WHERE
    Medal IS NOT NULL
GROUP BY Sex;

-- Finding Top 5 and Bottom 5 Events where male Participants won medal
       
(SELECT Sport,
		COUNT(Medal) AS Total_Medals
 FROM Olympics
 WHERE Medal IS NOT NULL AND Sex = 'M'
 GROUP BY Sport
 ORDER BY Total_Medals DESC
 LIMIT 5)
UNION
(SELECT Sport,
		COUNT(Medal) AS Total_Medals
 FROM Olympics
 WHERE Medal IS NOT NULL AND Sex = 'M'
 GROUP BY Sport
 ORDER BY Total_Medals
 LIMIT 5)				
ORDER BY "Total_Medals" DESC;

-- Finding Top 5 and Bottom 5 Events where Female Participants won medal


(SELECT Sport,
		COUNT(Medal) AS Total_Medals
 FROM olympics
 WHERE Medal IS NOT NULL AND Sex = 'F'
 GROUP BY Sport
 ORDER BY Total_Medals DESC
 LIMIT 5)
UNION
(SELECT Sport,
		COUNT(Medal) AS Total_Medals
 FROM olympics
 WHERE Medal IS NOT NULL AND Sex = 'F'
 GROUP BY Sport
 ORDER BY Total_Medals
 LIMIT 5)				
ORDER BY "Total_Medals" DESC;

-- Selecting Indian Males who have won medals in Olympics after Independence
       
SELECT DISTINCT
    (Name), COUNT(Medal) AS Total_Medals
FROM
    olympics
WHERE
    Team = 'India' AND Year > 1947
        AND Medal IS NOT NULL
        AND Sex = 'M'
GROUP BY 1
ORDER BY 2 DESC;

-- Selecting Indian Females who have won medals in Olympics after Independence

SELECT DISTINCT
    (Name), COUNT(Medal) AS Total_Medals
FROM
    olympics
WHERE
    Team = 'India' AND Year > 1947
        AND Medal IS NOT NULL
        AND Sex = 'F'
GROUP BY 1
ORDER BY 2 DESC;

-- Selecting Top 10 Athletes who have won most number of gold medals in the History of Olympics

SELECT DISTINCT
    (Name), Team, Sex, COUNT(Medal) AS Total_Medals
FROM
    olympics
WHERE
    Medal LIKE '%gold%'
GROUP BY Name , Team , Sex
ORDER BY 4 DESC;

-- Selecting top performing 10 nations in Football

SELECT 
    Team, COUNT(Medal) AS Total_Medals
FROM
    olympics
WHERE
    Sport LIKE '%football%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Selecting top performing 10 nations in Basketball

SELECT 
    Team, COUNT(Medal) AS Total_Medals
FROM
    olympics
WHERE
    Sport LIKE '%basketball%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;




