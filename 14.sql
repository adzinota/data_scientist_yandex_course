WITH 
y2011 AS (SELECT country_code,
                 AVG(funding_total) AS avg_funding_2011
          FROM company
          WHERE EXTRACT(YEAR FROM founded_at) = 2011
          GROUP BY country_code
),
y2012 AS (SELECT country_code,
                 AVG(funding_total) AS avg_funding_2012
          FROM company
          WHERE EXTRACT(YEAR FROM founded_at) = 2012
          GROUP BY country_code
),
y2013 AS (SELECT country_code,
                 AVG(funding_total) AS avg_funding_2013
          FROM company
          WHERE EXTRACT(YEAR FROM founded_at) = 2013
          GROUP BY country_code
)

SELECT * 
FROM y2011 JOIN y2012 USING(country_code) JOIN y2013 USING(country_code)
ORDER BY avg_funding_2011 DESC
