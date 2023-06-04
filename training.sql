--? Using WHERE
SELECT *
FROM person.Person
WHERE LastName = 'miller' AND FirstName = 'anna';

SELECT *
FROM production.Product;

SELECT ProductID, Name, ProductNumber, MakeFlag, StandardCost, ListPrice, SafetyStockLevel
FROM production.Product
WHERE  ListPrice > 100
    AND ListPrice < 200

--? DESAFIO 
--? equipe de produção de produtos precisa 
--? do nome de todas as peças que pesam mais 
--? que 50kg mas não
--? mais que 700kg para inspeção

SELECT Name
FROM Production.Product
WHERE Weight > 50 AND Weight < 700

--? DESAFIO
--? Foi pedido pel marketing um relação de 
--? todos os empregados (employees) que são 
--? casados (single=solteiro, married =casado)
--?  e são asalariados(salaried)

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND
    SalariedFlag = 1 

--? DESAFIO
--? Um usuário chamado Peter Krebs está 
--? devendo um pagamento, consiga o email
--? dele para que possamos enviar uma 
--? cobrança! ( vocé vai ter que usar a 
--? tabela person.person e depois a tabela 
--? person.emailaddress)

--- Versão simples e com muitas linhas
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person 
WHERE FirstName = 'peter' AND LastName = 'krebs'

SELECT EmailAddress
FROM Person.EmailAddress
WHERE BusinessEntityID = 26

--- Versão reduzida utilizando JOIN e ON
SELECT EmailAddress
FROM Person.Person
    JOIN Person.EmailAddress
    ON Person.Person.BusinessEntityID = Person.EmailAddress.BusinessEntityID
WHERE Person.Person.FirstName = 'Peter' AND Person.Person.LastName = 'Krebs'

-- Using COUNT
-- SELECT COUNT(FirstName)
-- FROM Person.Person

--? DESAFIO
--? eu quero saber quantos produtos em nossa
--? tabela de produtos (production.product)
SELECT COUNT(ProductID)
FROM Production.Product

--? DESAFIO
--? eu quero saber quantos tamanhos de 
--? produtos temos cadastrado em nossa tabela
--? (production.product)
SELECT COUNT(Size)
FROM Production.Product

--? DESAFIO
--? eu quero saber quantos tamanhos diferentes 
--? de produtos (production.product)
--? eu tenho cadastrado em nossa tabela.
SELECT COUNT(DISTINCT Size)
FROM Production.Product

-- Using ORDER BY, TOP

--? Desafio
--? Obter o Productld dos 19 produtos mais 
--? caros cadastrados no sistema, listando do
--? mais caro para o mais barato
SELECT Top(19)
    ProductID, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

--? Desafio
--? oter o nome e numero do produto dos 
--? produtos que tem o ProductID entre 1~4 
SELECT *
FROM Production.Product

--* 1º
SELECT Name, ProductNumber
FROM Production.Product
WHERE ProductID >= 1 AND ProductID <= 4

--* 2º
SELECT Name, ProductNumber
FROM Production.Product
WHERE ProductID BETWEEN 1 AND 4

--* 3º
SELECT TOP(4) Name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc

-- Using LIKE
SELECT *
FROM Person.Person
WHERE FirstName LIKE '%ro'

--? Desafio
--? Quantos produtos temos cadastrado no 
--? sistema que custam mais que 150 dolares?
SELECT *
FROM Production.Product

SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice > 1500

--? Desafio
--? Quantas pessoas temos com o sobrenome 
--? que inicia com a letra P?  
SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName LIKE 'P%'

--? Desafio
--? Em quantas cidades únicas estão 
--? cadastrados nossos clientes ?
SELECT COUNT(DISTINCT City)
FROM Person.Address

--? Desafio
--? Quais são as cidádes únicas que 
--? temos cadastrados em nosso sistema?
SELECT DISTINCT City
FROM Person.Address

--? Desafio
--? Quantos produtos vermelhos tem preco
--? entre 500 a 1000 dolares
SELECT *
FROM Production.Product

SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'Red' AND ListPrice BETWEEN 500 AND 1000