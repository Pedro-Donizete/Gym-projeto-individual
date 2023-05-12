-- a) Criar um banco de dados chamado Venda.
CREATE DATABASE Venda;

-- b) Selecionar esse banco de dados.
USE Venda;

-- c) Criar as tabelas correspondentes à sua modelagem.
Create table Cliente(
idCliente int primary key auto_increment,
Nome VARCHAR (45),
Email VARCHAR(45),
FKCliente_Indicado INT,
CONSTRAINT FKCliente_I FOREIGN KEY (FKCliente_Indicado) REFERENCES Cliente(idCliente)
);

Create table Endereço(
idEndereco INT PRIMARY KEY auto_increment,
Rua VARCHAR(45),
Bairro VARCHAR(45),
Numero INT,
FkCliente_E INT,
CONSTRAINT FkClienteEnde FOREIGN KEY (FkCliente_E) REFERENCES Cliente (idCliente)
) AUTO_INCREMENT = 100;

Create table Vendas(
IdVendas INT AUTO_INCREMENT,
Total DECIMAL (6,2),
DtVendas DATETIME DEFAULT CURRENT_TIMESTAMP,
FkClientes_V INT,
CONSTRAINT FkClienteVendas FOREIGN KEY (FkClientes_V) REFERENCES Cliente (idCliente),
CONSTRAINT PKVendas primary key (idVendas , FkClientes_V)
) AUTO_INCREMENT = 10;

Create table Produto(
idProduto INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(45),
Descricao VARCHAR(45),
Preco DECIMAL (6,2)
) AUTO_INCREMENT = 1000;

Create table VendaProduto(
idVendaProduto INT auto_increment,
FKVendas INT,
CONSTRAINT FKVendas_F FOREIGN KEY (FkVendas) REFERENCES Vendas(idVendas),
FkProdutos INT,
CONSTRAINT FkProdutos_P FOREIGN KEY (FkProdutos) REFERENCES Produto (idProduto),
CONSTRAINT PKVenda PRIMARY KEY (IdVendaProduto, FkVendas, fkProdutos),
Quantidade INT,
Desconto DECIMAL (6,2)
);

/* d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
cliente, e mais de um cliente sendo indicado por outro cliente.*/
-- Inserindo 5 clientes:
INSERT INTO Cliente VALUES
	(null, 'João', 'joao@gmail.com', NULL),
	(null, 'Maria', 'maria@hotmail.com', 1),
	(null, 'Pedro', 'pedro@yahoo.com', 2),
	(null, 'Ana', 'ana@gmail.com', 1),
	(null, 'Lucas', 'lucas@hotmail.com', 3);
    
-- Inserindo 5 endereços para clientes:
INSERT INTO Endereço VALUES
	(null, 'Rua A', 'Centro', 100, 1),
	(null, 'Rua B', 'Bela Vista', 200, 2),
	(null, 'Rua C', 'Jardim', 300, 3),
	(null, 'Rua D', 'Vila Nova', 400, 4),
	(null, 'Rua E', 'São José', 500, 5);
    
-- Inserindo 3 vendas para clientes:
INSERT INTO Vendas (IdVendas, Total, FkClientes_V) VALUES
	(null, 200.50, 1),
	(null, 500.00, 2),
	(null, 1000.00, 1);
    
-- Inserindo 4 produtos:
INSERT INTO Produto VALUES
	(null, 'Camisa', 'Camisa polo masculina', 59.90),
	(null, 'Calça', 'Calça jeans feminina', 89.90),
	(null, 'Tênis', 'Tênis esportivo', 89.90),
	(null, 'Relógio', 'Relógio de pulso', 249.90);
    
-- Inserindo os produtos nas vendas:
INSERT INTO VendaProduto VALUES
	(null, 10, 1000, 2, 10.00),
	(null, 11, 1001, 3, 0.00),
	(null, 12, 1001, 1, 15.00),
	(null, 10, 1002, 3, 0.00),
	(null, 12, 1003, 5, 20.00);
    
-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM CLIENTE;
SELECT * FROM Endereço;
SELECT * FROM Vendas;
SELECT * FROM Produto;
SELECT * FROM VendaProduto;

/* f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
das tabelas. 
Feitos na criação de tabelas */

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas
SELECT * FROM Cliente 
	JOIN Vendas 
		ON IdCliente = FkClientes_V;
        
/* h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
e os dados de suas respectivas vendas. */
SELECT * FROM Cliente 
	JOIN Vendas 
		ON IdCliente = FkClientes_V WHERE Cliente.nome = 'João';
        
-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
SELECT * FROM Cliente as Antigos JOIN Cliente as Indicados 
	ON Antigos.FKCliente_Indicado = Indicados.idCliente;
    
/* j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
indicadores, porém somente de um determinado cliente indicador (informar o nome
do cliente que indicou na consulta). */ 
SELECT * FROM Cliente as Antigos JOIN Cliente as Indicados 
	ON Antigos.FKCliente_Indicado = Indicados.idCliente 
		WHERE Antigos.nome = 'Ana';
        
/* l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
dados das respectivas vendas e dos produtos.*/
SELECT * FROM Cliente as Antigos JOIN Cliente as Indicados 
	ON Antigos.FKCliente_Indicado = Indicados.idCliente 
		JOIN Vendas ON Antigos.idCliente = Vendas.FkClientes_V
			JOIN VendaProduto ON VendaProduto.FkVendas = Vendas.idVendas
				JOIN Produto ON Produto.IdProduto = VendaProduto.FkProdutos;
                
/* m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto
numa determinada venda. */
SELECT Vendas.DtVendas, Produto.nome, VendaProduto.Quantidade FROM Vendas 
	JOIN VendaProduto ON Vendas.idVendas = VendaProduto.fKVendas
		JOIN Produto ON Produto.idProduto = VendaProduto.fkprodutos;
        
/* n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
produtos vendidos agrupados pelo nome do produto. */
SELECT Produto.nome, Produto.preco, sum(VendaProduto.quantidade) FROM Produto 
	JOIN VendaProduto ON Produto.idProduto = VendaProduto.fkProdutos
		group by produto.nome, produto.preco;
        
/*o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
vendas, e os clientes que não realizaram nenhuma venda.*/

INSERT INTO Cliente VALUES
	(null, 'Murilo', 'Murilo@gmail.com', NULL);
use Venda;
SELECT * FROM Cliente LEFT JOIN Vendas ON Cliente.idCliente = Vendas.fkClientes_V;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
 SELECT MIN(Preco), Max(Preco) from Produto;
 
-- q) Exibir a soma e a média dos preços dos produtos;
SELECT SUM(Preco), ROUND(AVG(Preco),2) from produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
SELECT COUNT(*) FROM Produto WHERE Preco > (SELECT AVG(PRECO) FROM PRODUTO);

-- s) Exibir a soma dos preços distintos dos produtos;
SELECT DISTINCT SUM(PRECO) FROM PRODUTO;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
select idvendas, sum(produto.preco) from produto 
	join VendaProduto on idProduto = fkProdutos
		join vendas on idVendas = fkVendas group by IdVendas;