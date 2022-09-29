CREATE TABLE Cliente_PF (
	IdCliente_PF int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Nome varchar(25),
	Sobrenome varchar(35),
	CPF varchar(14)
);


CREATE TABLE Cliente_PJ (
	IdCliente_PJ int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Razao_Social varchar(25),
	Nome_Fantasia varchar(35),
	CNPJ varchar(14)
);

CREATE TABLE TipoPag (
	IdTipoPag int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Nome varchar(25)
);

CREATE TABLE Forma_Pagamento (
	IdPag int PRIMARY KEY NOT NULL IDENTITY(1,1),
	IdTipoPag int not null,
	Nome varchar(25),
	Numero_Cartao int,
	CCV int,
	Ativo int,
	CONSTRAINT fk_TipoPag FOREIGN KEY (IdTipoPag) REFERENCES TipoPag (IdTipoPag),
);

CREATE TABLE Produto (
	IdProduto int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Modelo varchar(15),
	Descricao varchar(25),
	Valor decimal(10,2)
);

CREATE TABLE Estoque (
	IdEstoque int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Quantidade int,
	Codigo varchar(15),
);

CREATE TABLE Fornecedor (
	IdFornecedor int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Nome varchar(30),
	CNPJ varchar(18),
	Nome_Fantasia varchar(35)
);

CREATE TABLE Pedido (
	IdPedido int PRIMARY KEY NOT NULL IDENTITY(1,1),
	IdClientePF int null,
	IdClientePJ int null,
	Status varchar(20),
	Descricao varchar(25),
	Valor decimal(10,2),
	Frete decimal(10,2)
	CONSTRAINT fk_Cliente_PF FOREIGN KEY (IdClientePF) REFERENCES Cliente_PF (IdCliente_PF),
	CONSTRAINT fk_Cliente_PJ FOREIGN KEY (IdClientePJ) REFERENCES Cliente_PJ (IdCliente_PJ)

);

CREATE TABLE Envio (
	IdEnvio int PRIMARY KEY NOT NULL IDENTITY(1,1),
	IdPedido int not null,
	IdClientePF int null,
	IdClientePJ int null,
	Codigo varchar(40),
	Status varchar(15),
	CONSTRAINT fk_Envio_Cliente_PF FOREIGN KEY (IdClientePF) REFERENCES Cliente_PF (IdCliente_PF),
	CONSTRAINT fk_Envio_Cliente_PJ FOREIGN KEY (IdClientePJ) REFERENCES Cliente_PJ (IdCliente_PJ),
	CONSTRAINT fk_Envio_Pedido FOREIGN KEY (IdPedido) REFERENCES Cliente_PF (IdCliente_PF),
);

------------- CRIAÇÃO DE TABELAS COM FK

CREATE TABLE Fornecedor_Produto (
	IdFornecedor_Produto int PRIMARY KEY NOT NULL IDENTITY(1,1),
	IdProduto int not null,
	IdFornecedor int Not null,
	CONSTRAINT fk_Produto FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto),
	CONSTRAINT fk_Fornecedor FOREIGN KEY (IdFornecedor) REFERENCES Fornecedor (IdFornecedor),
);

CREATE TABLE Produto_Estoque (
	IdProduto_Estoque int PRIMARY KEY NOT NULL IDENTITY(1,1),
	IdProduto int not null,
	IdEstoque int Not null,
	Quantidade int,
	CONSTRAINT fk_Estoque_Produto FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto),
	CONSTRAINT fk_Produto_Estoque FOREIGN KEY (IdEstoque) REFERENCES Estoque (IdEstoque),
);

CREATE TABLE Produto_Pedido (
	IdProduto_Pedido int PRIMARY KEY NOT NULL IDENTITY(1,1),
	IdProduto int not null,
	IdPedido int Not null,
	CONSTRAINT fk_Pedido_Produto FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto),
	CONSTRAINT fk_Produto_Pedido FOREIGN KEY (IdPedido) REFERENCES Pedido (IdPedido),
);