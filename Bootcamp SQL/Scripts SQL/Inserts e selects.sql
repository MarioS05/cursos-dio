-- INSERT'S NO BANCO DE DADOS
/*
INSERT INTO Cliente_PF 
VALUES ('Ricardo', 'da Silva Costa', '123.321.234-43'),
		('Pedro', 'Antônio dos Santos', '987.098.458-43'),
		('José', 'Maria Aparecido', '346.862.649-03')

INSERT INTO Cliente_PJ
VALUES ('ABC LTDA', 'ABC DO ZÉ', '12.346.876/000'),
		('Tião do Gás Ltda.', 'Tião do Gás', '56.875.285/000')

INSERT INTO Fornecedor
VALUES	('CAMISAS POLO LTDA', '38.936.952/5738-98', 'CAMISARIA POLO'),
		('JEANS TEXTIL', '87.987.258/2656-23', 'JEANS VAREJO')

INSERT INTO Produto
VALUES ('JEANS MASC', 'CALÇA JEANS MASCULINA', '230.99'),
		('JEANS FEM', 'CALÇA JEANS FEMININA', '250.99'),
		('CINTO PRETO', 'CINTO PRETO UNISEX', '30.99'),
		('CAMISA POLO', 'CAMISA POLO MASCULINA', '99.99')

INSERT INTO Estoque
VALUES ('10', '#JEANS345'),
		('6', '#POLO6743'),
		('20', '#CINTO9836')

INSERT INTO TipoPag
VALUES ('Débito'),
		('Crédito'),
		('Dinheiro')

INSERT INTO Pedido
VALUES (NULL, '3', 'Em aprovação', 'N/A', '261.98', '15'),
		('4', NULL, 'Aprovado', 'Cliente pagou no débito', '230.99', '15')

*/

SELECT * FROM Cliente_PF
WHERE Nome = 'Ricardo'

SELECT * FROM Cliente_PJ
WHERE Razao_Social LIKE '%DA%'

SELECT * FROM Fornecedor

SELECT Modelo, SUM(Valor) AS 'VALOR' FROM Produto
GROUP BY Modelo
HAVING SUM(Valor) < 200

SELECT * FROM Estoque
ORDER BY Quantidade ASC

SELECT * FROM TipoPag

SELECT * FROM Pedido

SELECT * FROM Pedido Pe
INNER JOIN Produto Pr WITH(NOLOCK)
ON PE.Valor = Pr.Valor