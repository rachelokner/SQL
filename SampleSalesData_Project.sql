--Inspecting the data
SELECT *
FROM dbo.sales_data

--Checking unique data

SELECT DISTINCT STATUS FROM dbo.sales_data
SELECT DISTINCT YEAR_ID FROM dbo.sales_data
SELECT DISTINCT PRODUCTLINE FROM dbo.sales_data
SELECT DISTINCT COUNTRY FROM dbo.sales_data
SELECT DISTINCT DEALSIZE FROM dbo.sales_data
SELECT DISTINCT TERRITORY FROM dbo.sales_data

--ANALYSIS
-------------------------------------------------------
--grouping sales by productline
SELECT PRODUCTLINE, SUM(SALES) AS Revenue
FROM dbo.sales_data
GROUP BY PRODUCTLINE
ORDER BY Revenue desc

SELECT YEAR_ID, SUM(SALES) AS Revenue
FROM dbo.sales_data
GROUP BY YEAR_ID
ORDER BY Revenue desc

SELECT DEALSIZE, SUM(SALES) AS Revenue
FROM dbo.sales_data
GROUP BY DEALSIZE
ORDER BY Revenue desc

--What was the best month for sales in a specific year? How much was earned that month?
SELECT MONTH_ID, SUM(SALES) AS Revenue, COUNT(ORDERNUMBER) AS Frequency
FROM dbo.sales_data
WHERE YEAR_ID=2004 --CHANGE YEAR
GROUP BY MONTH_ID
ORDER BY Revenue desc

--November seems to be the best month, which product do they sell in November?
SELECT MONTH_ID, PRODUCTLINE, SUM(SALES) AS Revenue, COUNT(ORDERNUMBER) AS Frequency
FROM dbo.sales_data
WHERE YEAR_ID=2003 AND MONTH_ID=11 --CAN CHANGE YEAR
GROUP BY MONTH_ID, PRODUCTLINE
ORDER BY Revenue desc

--What city has the highest number of sales in a specific country
SELECT CITY, SUM (SALES) AS Revenue
FROM dbo.sales_data
WHERE COUNTRY = 'USA' --can change the country
GROUP BY CITY
ORDER BY Revenue desc

---What is the best product in a specific country?
SELECT COUNTRY, YEAR_ID, PRODUCTLINE, SUM(SALES) AS Revenue
FROM dbo.sales_data
WHERE COUNTRY = 'Canada' --can change the country
GROUP BY COUNTRY, YEAR_ID, PRODUCTLINE
ORDER BY Revenue desc
