USE startup_unicorns;
-- ==========================================================
-- Q1A / KPI 1: Average Time to Success (Time to Unicorn)
-- RESEARCH QUESTION: What is the average time it takes for a startup to become a unicorn?
-- RESULT: 11.40 years
-- ==========================================================
SELECT
    ROUND(AVG(time_to_unicorn), 1) AS avg_time_to_unicorn_years
FROM
    companies
WHERE
    is_unicorn = TRUE;
    
   select * from startup_unicorns.companies 
   
   -- ==========================================================
-- Q1B / H4: Average Time to Success per industry (Top 5)
-- ==========================================================
SELECT
    i.name AS industry_name,
    ROUND(AVG(c.time_to_unicorn), 1) AS avg_time_to_unicorn_years,
    -- 2. Conta o tamanho da amostra
    COUNT(c.company_id) AS unicorn_count
FROM
    companies c
JOIN
    industries i ON c.industry_id = i.industry_id
WHERE
    c.is_unicorn = TRUE -- Apenas empresas que se tornaram unicórnios
    AND c.time_to_unicorn IS NOT NULL -- Apenas dados válidos
GROUP BY
    i.name
HAVING
    COUNT(c.company_id) >= 5 -- Filtra indústrias com menos de 5 unicórnios
ORDER BY
    avg_time_to_unicorn_years ASC -- Ordena do mais rápido para o mais lento
LIMIT 5;



-- =========================================================
-- Q2 / Temporal Analysis: Annual Foundation Rate (Post-2001)
-- RESEARCH QUESTION: How has the annual foundation rate of technology startups evolved since the post-Dot-Com era (post-2001)?
-- FINDING: The peak period for startup foundations occurred between 2009 and 2011.
-- ==========================================================
SELECT
    foundation_year,
    COUNT(company_id) AS companies_founded_count
FROM
    companies
WHERE
    foundation_year >= 2002
GROUP BY
    foundation_year
ORDER BY
    companies_founded_count DESC;

-- ==========================================================
-- Q3A / KPI 3: Total Startups by Country and Top 5 Countries
-- ==========================================================
SELECT
    T2.name AS country_name,
    COUNT(T1.company_id) AS total_startups
FROM
    companies AS T1
JOIN
    countries AS T2 ON T1.country_id = T2.country_id
WHERE
    -- NEW FILTER: Exclude the 'Unknown' category from the ranking
    T2.name <> 'Unknown'
GROUP BY
    T2.name
ORDER BY
    total_startups DESC
LIMIT 5;




-- ==========================================================
-- Q3b / KPI 3: Total Unicorn Startups by Country and Top 5 Countries
-- ==========================================================
SELECT
    T2.name AS country_name,
    COUNT(T1.company_id) AS unicorn_count
FROM
    companies AS T1
JOIN
    countries AS T2 ON T1.country_id = T2.country_id
WHERE
    T1.is_unicorn = 1 -- FILTRO CRÍTICO: Contar SOMENTE Unicórnios
    AND T2.name <> 'Unknown' -- Excluir desconhecidos do ranking
GROUP BY
    T2.name
ORDER BY
    unicorn_count DESC
LIMIT 5;



-- ==========================================================
-- Q4 / H2: Count of Unicorns per Industry (Excluding Unknown Industries)
-- ==========================================================
SELECT
    T2.name AS industry_name,
    COUNT(T1.company_id) AS total_unicorns
FROM
    companies AS T1
JOIN
    industries AS T2 ON T1.industry_id = T2.industry_id
WHERE
    T1.is_unicorn = 1
    -- Filter out industries that might have been labeled as 'Unknown'
    AND T2.name <> 'Unknown'
GROUP BY
    T2.name
ORDER BY
    total_unicorns DESC
LIMIT 5;


-- ==========================================================
-- Q5A / KPI: Total Funding (Reported in Billions USD)
-- ==========================================================

SELECT
    ROUND(SUM(total_funding), 2) AS total_funding_billions_usd
FROM
    companies;

-- ==========================================================
-- Q5B / KPI: Average Funding (Reported in Millions USD)
-- ==========================================================

SELECT
    ROUND(AVG(total_funding), 2) AS average_funding_millions_usd
FROM
    companies;


-- Q5C / H3: Compare Average Funding between Unicorns and Non-Unicorns
-- This directly tests if total funding correlates with unicorn status.
-- 1000000
SELECT
    CASE 
        WHEN is_unicorn = 1 THEN 'Unicorn' 
        ELSE 'Non-Unicorn' 
    END AS status,
    ROUND(AVG(total_funding), 2) AS average_funding_millions_usd,
    COUNT(company_id) AS company_count
FROM
    companies
WHERE
    -- Important: Filter out 'Unknown' country records from this comparison if we want accurate averages
    country_id IS NOT NULL 
GROUP BY
    status;
    
    
    -- Q6A (Melhoria do Q1): Média para SOMENTE Unicórnios
SELECT
    ROUND(AVG(time_to_unicorn), 1) AS avg_time_to_unicorn_years
FROM
    companies
WHERE
    is_unicorn = TRUE;
    
    
    -- ==========================================================
-- Q6 / H5: Avarage Unicorn Value per country (samples >=5)
-- ==========================================================
SELECT
    t2.name AS country_name,
    COUNT(t1.company_id) AS unicorn_count,
    ROUND(AVG(t1.valuation_b_unicorn), 2) AS average_valuation_b_usd
FROM
    companies AS t1
JOIN
    countries AS t2 ON t1.country_id = t2.country_id
WHERE
    t1.is_unicorn = TRUE
    AND t2.name <> 'Unknown'
GROUP BY
    t2.name
HAVING
    COUNT(t1.company_id) >= 5 -- Foco em países com 5 ou mais unicórnios
ORDER BY
    average_valuation_b_usd DESC;