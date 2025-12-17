-- Query para recuperar o número de clientes
use ecommerce;
show tables;
desc clients;
select count(*) from clients;



-- Query para verificar o número de pedidos
show tables;
desc orders; 
select 
	o.orderStatus,
    o.orderDescription,
    concat(Fname, ' ', Minit, ' ', Lname) as FName
from 
	clients c, orders o 
where 
	c.idClient = o.idOrderClient;
    


-- Query para operação de junção interna (INNER JOIN) entre três tabelas e descobrir número de pedidos por cliente
SELECT 
	c.idClient, Fname, count(*) as Numbers_of_orders FROM clients c
INNER JOIN 
	orders o
ON 
	c.idClient = o.idOrderClient
INNER JOIN 
	productOrder p
ON
	p.idPOorder = idOrder
GROUP BY 
	idClient;



-- Pedidos que estão "Em processamento" e não foram pagos em dinheiro
SELECT
    idOrder,
    idOrderClient,
    orderDescription,
    sendValue
FROM
    orders
WHERE
    orderStatus = 'Em processamento' AND paymentCash = false;

   

-- Expressões que geram atributos derivados: calcular o valor total do pedido (frete + produto) e o nome do cliente   
SELECT
    concat(C.Fname, ' ', C.Lname) AS Nome_Completo,
    O.sendValue AS Valor_Frete,
    (O.sendValue + 50.00) AS Valor_Total_Estimado -- Frete + R$ 50,00 de produto
FROM
    clients C
INNER JOIN
    orders O ON C.idClient = O.idOrderClient;
   
   
   
-- Ordenação dos dados, listando os produtos e organizando por categoria e, em seguida, avaliação
SELECT
    Pname,
    category,
    product_rating
FROM
    product
ORDER BY
    category ASC,       -- Ordena primeiro pela Categoria (A-Z)
    product_rating DESC;  -- Depois, pela Avaliação (Maior para Menor)



-- Identificando os clientes com mais de um pedido e qual é o total de pedidos desses clientes
SELECT
    c.Fname AS Nome_Cliente,
    COUNT(O.idOrder) AS Total_de_Pedidos
FROM
    clients c
INNER JOIN
    orders O ON C.idClient = O.idOrderClient
GROUP BY
    c.idClient, C.Fname
HAVING
    COUNT(O.idOrder) > 1; -- Condição HAVING: Filtra grupos com mais de 1 pedido



-- Mostra todos os produtos em estoque e quem são os vendedores que os fornecem, juntando 4 tabelas
SELECT
    p.Pname AS Produto,
    ps.storage_location AS Local_Estoque,
    s.legalName AS Fornecedor_Vendedor
FROM
    product p
INNER JOIN
    storageLocation sl ON p.idProduct = sl.idLStorage
INNER JOIN
    productStorage ps ON sl.idLStorage = ps.idProdStorage
INNER JOIN
    productSalesman psmn ON p.idProduct = psmn.idProdSalesman  
INNER JOIN
    salesman s ON psmn.idProdSalesman = s.idSalesman;



   
