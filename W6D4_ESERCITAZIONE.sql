-- Esercizio 1
SELECT 
	ProductKey,
    p.ProductSubcategoryKey,
    EnglishProductName
FROM dimproduct p
LEFT JOIN dimproductsubcategory sc
ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
ORDER BY ProductSubcategoryKey DESC;

-- Esercizio 2
SELECT
	ProductKey,
    p.ProductSubcategoryKey,
    c.ProductCategoryKey,
    EnglishProductName
FROM dimproduct p
LEFT JOIN dimproductsubcategory sc
ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
LEFT JOIN dimproductcategory c
ON sc.ProductCategoryKey = c.ProductCategoryKey
ORDER BY ProductKey desc, ProductCategoryKey desc, ProductSubcategoryKey desc;

-- Esercizio 3
SELECT
	p.ProductKey,
    EnglishProductName,
    ListPrice,
    OrderDate
FROM dimproduct p
INNER JOIN factresellersales res
ON p.ProductKey = res.ProductKey
ORDER BY OrderDate DESC;

-- Esercizio 4
SELECT
	ProductKey,
    EnglishProductName
FROM dimproduct p
WHERE p.FinishedGoodsFlag = '%1%';

-- Esercizio 5
SELECT
	res.ProductKey,
    EnglishProductName,
    OrderDate
FROM factresellersales res
LEFT JOIN dimproduct p
ON res.ProductKey = p.ProductKey;

-- Esercizio 6
SELECT
	EnglishProductName as ProductName,
    OrderDate,
    c.EnglishProductCategoryName as CategoryName,
    sc.EnglishProductSubcategoryName as SubcategoryName
FROM factresellersales res
LEFT JOIN dimproduct p
ON res.ProductKey = p.ProductKey
RIGHT JOIN dimproductsubcategory sc
ON sc.ProductSubcategoryKey = p.ProductSubcategoryKey
RIGHT JOIN dimproductcategory c
ON sc.ProductCategoryKey = c.ProductCategoryKey;

-- Esercizio 7
SELECT *
FROM dimreseller;

-- Esercizio 8
SELECT 
	ResellerName,
    City,
    StateProvinceName
FROM dimreseller r
LEFT JOIN dimgeography geo
ON r.GeographyKey = geo.GeographyKey;

-- Esercizio 9
SELECT
	SalesOrderNumber,
    SalesOrderLineNumber,
    OrderDate,
    UnitPrice,
    OrderQuantity as Quantity,
    TotalProductCost,
    EnglishProductName as ProductName,
    EnglishProductCategoryName as CategoryName,
	EnglishProductSubcategoryName as SubcategoryName,
    ResellerName,
    SalesTerritoryCountry as Country,
    City
FROM factresellersales sales
LEFT JOIN dimproduct p
ON sales.ProductKey = p.ProductKey
RIGHT JOIN dimproductsubcategory sc
ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
RIGHT JOIN dimproductcategory c
ON sc.ProductCategoryKey = c.ProductCategoryKey
RIGHT JOIN dimreseller res
ON sales.ResellerKey = res.ResellerKey
RIGHT JOIN dimsalesterritory ter
ON sales.SalesTerritoryKey = ter.SalesTerritoryKey
RIGHT JOIN dimgeography geo
ON ter.SalesTerritoryKey = geo.SalesTerritoryKey;