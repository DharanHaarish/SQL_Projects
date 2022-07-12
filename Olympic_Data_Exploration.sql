SELECT * FROM "Olympic"

/* Getting the number of Medals(atleast 1) won each Olympics by a Country */

SELECT COUNT("Medal") AS "Total_Medals",
	"Games",
	"Team"
FROM "Olympic"
WHERE "Medal" IS NOT NULL
GROUP BY "Games",
	"Team"
ORDER BY "Games",
	"Total_Medals" DESC

/*Selecting top 10 teams that have won most number of medals in the History of Olympics*/

SELECT "Team",
	COUNT("Medal") AS "Total_Medals"
FROM "Olympic"
WHERE "Medal" IS NOT NULL
GROUP BY "Team"
ORDER BY "Total_Medals" DESC
LIMIT 10

/*Selecting top 10 teams that have won most number of medals in the History of Summer Olympics*/

SELECT "Team",
	COUNT("Medal") AS "Total_Medals_Summer"
FROM "Olympic"
WHERE "Medal" IS NOT NULL
				AND RIGHT("Games",6) = 'Summer'
GROUP BY "Team"
ORDER BY "Total_Medals_Summer" DESC
LIMIT 10

/*Selecting top 10 teams that have won most number of medals in the History of Winter Olympics*/

SELECT "Team",
	COUNT("Medal") AS "Total_Medals_Winter"
FROM "Olympic"
WHERE "Medal" IS NOT NULL
				AND RIGHT("Games",6) = 'Winter'
GROUP BY "Team"
ORDER BY "Total_Medals_Winter" DESC
LIMIT 10

/*Querying the top 50 Male Athletes who have won most number of Medals*/

SELECT DISTINCT("Name"),
	"Team",
	COUNT("Medal") AS "Total_Medals"
FROM "Olympic"
WHERE "Sex" = 'M'
GROUP BY "Name",
	"Team"
ORDER BY "Total_Medals" DESC
LIMIT 50

/*Querying the top 50 Female Athletes who have won most number of Medals*/

SELECT DISTINCT("Name"),
	"Team",
	COUNT("Medal") AS "Total_Medals"
FROM "Olympic"
WHERE "Sex" = 'F'
GROUP BY "Name",
	"Team"
ORDER BY "Total_Medals" DESC
LIMIT 50

/*Average age of Male and Female Athletes who have won a medal in the Olympics*/
/*after finding the average by casting age as float changing into numeric as round function expects a numeric value*/

SELECT "Sex",
	ROUND((AVG(CAST ("Age" AS FLOAT))::NUMERIC),2) AS AVG_AGE
FROM "Olympic"
WHERE "Medal" IS NOT NULL
GROUP BY "Sex"

/* Finding Top 5 and Bottom 5 Sports where male participants won medal*/


				(SELECT "Sport",
						COUNT("Medal") AS "Total_Medals"
					FROM "Olympic"
					WHERE "Medal" IS NOT NULL
									AND "Sex" = 'M'
					GROUP BY "Sport"
					ORDER BY "Total_Medals" DESC
					LIMIT 5)
UNION
				(SELECT "Sport",
						COUNT("Medal") AS "Total_Medals"
					FROM "Olympic"
					WHERE "Medal" IS NOT NULL
									AND "Sex" = 'M'
					GROUP BY "Sport"
					ORDER BY "Total_Medals"
					LIMIT 5)
ORDER BY "Total_Medals" DESC

/* Finding Top 5 and Bottom 5 Sports where Female participants won medal*/

                    (SELECT "Sport",
						COUNT("Medal") AS "Total_Medals"
					FROM "Olympic"
					WHERE "Medal" IS NOT NULL
									AND "Sex" = 'F'
					GROUP BY "Sport"
					ORDER BY "Total_Medals" DESC
					LIMIT 5)
UNION
				(SELECT "Sport",
						COUNT("Medal") AS "Total_Medals"
					FROM "Olympic"
					WHERE "Medal" IS NOT NULL
									AND "Sex" = 'F'
					GROUP BY "Sport"
					ORDER BY "Total_Medals"
					LIMIT 5)
ORDER BY "Total_Medals" DESC

/* Analysing India's Olympic Data after Independence*/

SELECT *
FROM "Olympic"
WHERE "Team" = 'India'
				AND "Year" > 1947
				AND "Medal" IS NOT NULL
ORDER BY "Games"

/* Indian Males who have won medals in Olympics after Independence */

SELECT DISTINCT("Name"),
	COUNT("Medal") AS "Total_Medals"
FROM "Olympic"
WHERE "Team" = 'India'
				AND "Sex" = 'M'
				AND "Year" > 1947
				AND "Medal" IS NOT NULL
GROUP BY "Name"
ORDER BY "Total_Medals" DESC

/* Indian Females who have won medals in Olympics after Independence */

SELECT DISTINCT("Name"),
	COUNT("Medal") AS "Total_Medals"
FROM "Olympic"
WHERE "Team" = 'India'
				AND "Sex" = 'F'
				AND "Year" > 1947
				AND "Medal" IS NOT NULL
GROUP BY "Name"
ORDER BY "Total_Medals" DESC

/* Top Olympics performance from India*/

SELECT "Games",
	COUNT("Medal") AS "Total_Medals"
FROM "Olympic"
WHERE "Team" = 'India'
				AND "Year" > 1947
				AND "Medal" IS NOT NULL
				AND "Sport" != 'Hockey'  /* Since India's Dominance in Hockey does not give you a whole picture*/
GROUP BY "Games"
ORDER BY "Total_Medals" DESC
