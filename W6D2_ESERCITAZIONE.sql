SELECT * FROM DimProduct;

SELECT 
    ProductKey AS ChiaveProdotto,
    ProductAlternateKey AS ChiaveAlternativaProdotto,
    EnglishProductName AS NomeProdotto,
    Color AS Colore,
    StandardCost AS CostoStandard,
    FinishedGoodsFlag AS ProdottoFinito
FROM 
    DimProduct
WHERE 
    FinishedGoodsFlag = 1;
    

SELECT 
    ProductKey AS CodiceProdotto,
    ProductAlternateKey AS Modello,
    EnglishProductName AS NomeProdotto,
    StandardCost AS CostoStandard,
    ListPrice AS PrezzoDiListino
FROM 
    DimProduct
WHERE 
    ProductAlternateKey LIKE 'FR%' 
    OR ProductAlternateKey LIKE 'BK%';
    
SELECT 
    ProductKey AS CodiceProdotto,
    ProductAlternateKey AS Modello,
    EnglishProductName AS NomeProdotto,
    StandardCost AS CostoStandard,
    ListPrice AS PrezzoDiListino,
    (ListPrice - StandardCost) AS Markup
FROM 
    DimProduct
WHERE 
    ProductAlternateKey LIKE 'FR%' 
    OR ProductAlternateKey LIKE 'BK%';


SELECT 
    ProductKey AS CodiceProdotto,
    ProductAlternateKey AS Modello,
    EnglishProductName AS NomeProdotto,
    StandardCost AS CostoStandard,
    ListPrice AS PrezzoDiListino
FROM 
    DimProduct
WHERE 
    FinishedGoodsFlag = 1
    AND ListPrice BETWEEN 1000 AND 2000;
    
SELECT * FROM dimemployee;

SELECT * FROM dimemployee
WHERE SalespersonFlag = 1;

SELECT 
	SalesOrderNumber AS NumeroOrdine,
    ProductKey AS CodiceProdotto,
    OrderDate AS DataOrdine,
	(SalesAmount - TotalProductCost) AS Profitto

FROM FactResellerSales

WHERE (
ProductKey = 597
OR ProductKey = 598
OR ProductKey = 477
OR ProductKey = 214)
AND OrderDate >= '2020-01-01';