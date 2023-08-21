-- DATA CLEANING

SELECT *
FROM icos

-- sold column should be between 0%-100% but there were numbers greater than 100%
-- Here it was 1122
UPDATE icos
SET sold = 11.22
WHERE projectid = 'PRO179'

UPDATE icos
SET sold = 31.25
WHERE projectid = 'PRO787'

UPDATE icos
SET sold = 20.73
WHERE projectid = 'PRO78'


-- DATA ANALYSIS

-- The top 10 ICO categories that raised the highest?
SELECT
    category.category_name,
    SUM(raised_usd) AS Total_raised
FROM
    icos
JOIN
    category ON icos.categoryid = category.categoryid
WHERE
    raised_usd IS NOT NULL
GROUP BY
    category.category_name
ORDER BY
    Total_raised DESC
LIMIT 10;



-- The top 10 ICO platforms that raised the highest?
SELECT
    platform.platforn_name,
    SUM(raised_usd) AS Total_raised
FROM
    icos
JOIN
    platform ON icos.platformid = platform.platformid
WHERE
    raised_usd IS NOT NULL
GROUP BY
    platform.platforn_name
ORDER BY
    Total_raised DESC
LIMIT 10;



-- Token roles that raised the highest?
SELECT
    token_role.token_role,
    SUM(raised_usd) AS Total_raised
FROM
    icos
JOIN
    token_role ON icos.token_roleid = token_role.token_roleid
WHERE
    raised_usd IS NOT NULL
GROUP BY
    token_role.token_role
ORDER BY
    Total_raised DESC; -- Utility tokens are the most common


-- The start quarter that raised the highest?
SELECT 
    CASE 
        WHEN date.start_month BETWEEN 1 AND 3 THEN 'Q1'
        WHEN date.start_month BETWEEN 4 AND 6 THEN 'Q2'
        WHEN date.start_month BETWEEN 7 AND 9 THEN 'Q3'
        WHEN date.start_month BETWEEN 10 AND 12 THEN 'Q4'
    END AS Start_quarter,
    COUNT(projectid) AS Total_projects,
    SUM(raised_usd) AS Total_raised
FROM
    icos
JOIN
    date ON icos.dateid = date.dateid
WHERE
    raised_usd IS NOT NULL
GROUP BY
    Start_quarter
ORDER BY
    Total_raised DESC; -- Q2 raised the highest and also recorded the highest number of projects


-- Projects whose raised amount surpases their fundraise goal.
-- Calculate the percentage if or not raised_usd is greater than fundraise goal
SELECT 
    ROUND((COUNT(CASE WHEN raised_usd > fundraise_goal THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_true, -- 70.56% of projects raised_usd was greater than the fundraise goal
    ROUND((COUNT(CASE WHEN raised_usd < fundraise_goal THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_false, -- 9.98% of projects raised_usd was less than the fundraise goal
    ROUND((COUNT(CASE WHEN raised_usd = fundraise_goal THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_equal -- 19.46% of projects raised_usd was exactly equal to the fundraise goal
FROM
    icos
WHERE
    raised_usd IS NOT NULL
    AND fundraise_goal IS NOT NULL;



-- Create a temp table of ICO projects who raised above 10 million dollars
-- Create a temporary table containing ICOs meeting specific criteria
CREATE TEMP TABLE BigICOs AS
SELECT 
    project.project_name,
    date.start_date,
    date.end_date,
    category.category_name,
    platform.platforn_name,
    total_token,
    ico_price,
    fundraise_goal,
    raised_usd,
    sold
FROM
    icos
JOIN
    project ON icos.projectid = project.projectid
JOIN
    platform ON icos.platformid = platform.platformid
JOIN
    category ON icos.categoryid = category.categoryid
JOIN
    date ON icos.dateid = date.dateid
WHERE
    raised_usd >= 10000000
    AND ico_price IS NOT NULL
    AND total_token IS NOT NULL
    AND fundraise_goal IS NOT NULL
    AND sold IS NOT NULL;

-- Display ICO projects meeting the criteria
SELECT *
FROM BigICOs;

-- Analyze the distribution of ICOs based on the percentage of sold tokens
SELECT
    sold_range,
    COUNT(sold_range) AS Total
FROM (
    SELECT *,
        CASE 
            WHEN sold < 10 THEN 'Less than 10%'
            WHEN sold BETWEEN 10 AND 25 THEN '10% - 25%'
            WHEN sold BETWEEN 25 AND 50 THEN '25% - 50%'
            WHEN sold BETWEEN 50 AND 75 THEN '50% - 75%'
            WHEN sold BETWEEN 75 AND 100 THEN '75% - 100%'
        END AS Sold_range
    FROM BigICOs
) AS T1
GROUP BY 1
ORDER BY 2 DESC; -- Major projects sold between 0.25% - 25% of their total supply


-- Was the amount raised was based of the token price during the ICO
-- Analyze the distribution of ICOs based on the token price during the ICO
SELECT
    Price_range,
    COUNT(Price_range) AS Total
FROM (
    SELECT *,
        CASE 
            WHEN ico_price < 0.01 THEN 'Less than $0.01'
            WHEN ico_price BETWEEN 0.01 AND 1.00 THEN '$0.01 -  $1.00'
            WHEN ico_price BETWEEN 1.00 AND 5.00 THEN '$1.00 -  $5.00'
            WHEN ico_price BETWEEN 5.00 AND 20.00 THEN '$5.00 -  $20.00'
            WHEN ico_price BETWEEN 20.00 AND 50.00 THEN '$20.00 -  $50.00'
            WHEN ico_price BETWEEN 50.00 AND 100.00 THEN '$50.00 -  $100.00'
            WHEN ico_price BETWEEN 100.00 AND 250.00 THEN '$100.00 -  $250.00'
            WHEN ico_price BETWEEN 250.00 AND 500.00 THEN '$250.00 -  $500.00'
            WHEN ico_price BETWEEN 500.00 AND 750.00 THEN '$500.00 -  $750.00'
            WHEN ico_price BETWEEN 750.00 AND 1000.00 THEN '$750.00 -  $1000.00'
            WHEN ico_price > 1000.00 THEN 'Above $1k'
        END AS Price_range
    FROM BigICOs
) AS T1
GROUP BY 1
ORDER BY 2 DESC;  -- Major projects ICO price was not enormous for such large sale. Usually between "$0.01 -  $1.00"






















	
