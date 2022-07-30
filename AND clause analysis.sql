-- long running query

SELECT DISTINCT(Name)
FROM olympics
WHERE
    Year > 1945 AND Sex = 'M'
        AND Medal IS NOT NULL
        AND Team = 'Germany';

-- short running query
 
SELECT DISTINCT(Name)
FROM olympics
WHERE
    Team = 'Germany' AND Medal IS NOT NULL
        AND Sex = 'M'
        AND Year > 1945;
 
-- No of Records having Year>1945 
 
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Year > 1945;
 
 -- No of Records having Sex=’M’
 
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Sex = 'M';

-- No of Records having Non null value in the Medal Column 
    
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Medal IS NOT NULL;

-- No of Records that have Team=’Germany’
    
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Team = 'Germany';

-- No of Records that have Year>1945 and Sex=’M’
    
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Year > 1945 AND Sex = 'M';

-- No of Records that have Year>1945 and Sex=’M’ and Non null values in Medal column

SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Year > 1945 AND Sex = 'M'
        AND Medal IS NOT NULL;

-- No of Records that have Year>1945 and Sex=’M’ and Non null values in Medal column and Team=’Germany’
	
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Year > 1945 AND Sex = 'M'
        AND Medal IS NOT NULL
        AND Team = 'Germany';

-- No of Records that have Team=’Germany’ and non null values in Medal column
        
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Team = 'Germany' AND Medal IS NOT NULL;
 
-- No of Records that have Team=’Germany’ and non null values in Medal column and value of the Sex column=’M’ 
 
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Team = 'Germany' AND Medal IS NOT NULL
        AND Sex = 'M';

-- No of Records that have Team=’Germany’ and non null values in Medal column and value of the Sex column=’M’ and Year>1945
        
SELECT 
    COUNT(*)
FROM
    olympics
WHERE
    Team = 'Germany' AND Medal IS NOT NULL
        AND Sex = 'M'
        AND Year > 1945; 
        


    
