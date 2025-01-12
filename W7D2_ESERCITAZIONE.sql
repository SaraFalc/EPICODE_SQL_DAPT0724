-- Esercizio 1
-- Per verificare che il campo ProductKey in Dimproduct sia una chiave primaria, questo campo deve: avere valori univoci, non deve contenere valori vuoti (null), posso vedere se productkey è considerato nella tabella chiave primaria
SELECT 
	ProductKey,
    COUNT(*)
FROM dimproduct
GROUP BY ProductKey
HAVING COUNT(*)>1;

SELECT
	ProductKey
FROM dimproduct
WHERE ProductKey IS NULL;

SHOW CREATE TABLE DimProduct; -- vedo che ProductKey è primarykey

-- Esercizio 2
SELECT
	SalesOrderNumber,
    SalesOrderLineNumber,
    COUNT(*)
FROM factresellersales
GROUP BY SalesOrderNumber, SalesOrderLineNumber
HAVING COUNT(*)>1;

SELECT
	SalesOrderNumber,
    SalesOrderLineNumber
FROM factresellersales
WHERE SalesOrderLineNumber IS NULL OR SalesOrderNumber IS NULL;

-- Esercizio 3
SELECT
	OrderDate as DataOrdine,
    COUNT(SalesOrderNumber) as NrTransazioniGiornaliere
FROM factresellersales
WHERE OrderDate >= '2020-01-01'
GROUP BY OrderDate
ORDER BY OrderDate;

-- Esercizio 4
SELECT
	EnglishProductName as NomeProdotto,
    SUM(SalesAmount) as FatturatoTotale,
    SUM(OrderQuantity) as QuantitàVenduta,
    AVG(UnitPrice) as PrezzoMedio
FROM factresellersales sales
LEFT JOIN dimproduct p
ON sales.ProductKey = p.ProductKey
WHERE OrderDate >= '2020-01-01'
GROUP BY p.EnglishProductName
ORDER BY FatturatoTotale DESC;

-- Esercizio 5
SELECT
	EnglishProductCategoryName as Categoria,
    FORMAT(SUM(SalesAmount),0) as FatturatoTotale,
	SUM(OrderQuantity) as QuantitàVenduta
FROM factresellersales sales
INNER JOIN dimproduct p
ON sales.ProductKey = p.ProductKey
INNER JOIN dimproductsubcategory sub
ON p.ProductSubcategoryKey = sub.ProductSubcategoryKey
INNER JOIN dimproductcategory cat
ON sub.ProductCategoryKey = cat.ProductCategoryKey
GROUP BY Categoria
ORDER BY FatturatoTotale DESC;

-- Esercizio 6
SELECT 
	City as Città,
    FORMAT(SUM(SalesAmount),0) as FatturatoTotale
FROM factresellersales sales
INNER JOIN dimgeography geo
ON sales.SalesTerritoryKey = geo.SalesTerritoryKey
WHERE OrderDate >= '2020-01-01'
GROUP BY geo.City
HAVING SUM(SalesAmount) > 60000
ORDER BY SUM(SalesAmount) desc;



