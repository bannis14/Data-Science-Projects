-- World Database:


-- Question: Retrieve a list of distinct life expectancy values, ensuring there are no nulls.

SELECT DISTINCT lifeexpectancy FROM country WHERE lifeexpectancy IS NOT NULL ORDER BY lifeexpectancy;


-- Question: Determine the population per continent.

SELECT
  DISTINCT continent,
  SUM(population) OVER w1 as "Continent Population"
FROM country 
WINDOW w1 AS( PARTITION BY continent );


-- Question: Enhance the previous query by calculating the percentage of the world population for each continent.

SELECT
  DISTINCT continent,
  SUM(population) OVER w1 as "Continent Population",
  CONCAT( 
      ROUND( 
          ( 
            SUM( population::float4 ) OVER w1 / 
            SUM( population::float4 ) OVER() 
          ) * 100    
      ),'%' ) as "Percentage of Population"
FROM country 
WINDOW w1 AS( PARTITION BY continent );


-- Question: Identify the unique job titles present.

SELECT DISTINCT title FROM titles;


-- Question: Count the number of towns per region.

SELECT 
DISTINCT r.id, 
r."name", 
COUNT(t.id) OVER (
    PARTITION BY r.id
    ORDER BY r."name"
) AS "Number of Towns"
FROM regions AS r
JOIN departments AS d ON r.code = d.region 
JOIN towns AS t ON d.code = t.department
ORDER BY r.id;
