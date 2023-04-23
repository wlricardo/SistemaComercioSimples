use dbcomercio;

create table Categoria (
	id int primary key,
	nome varchar(50) not null,
	descricao varchar(100)
);

create table Apresentacao (
	id int primary key,
	nome varchar(50) not null,
	descricao varchar(100)
);

create table Produto (
	id int primary key,
	codigo varchar(20) not null,
	nome varchar(50) not null,
	descricao varchar(200),
	imagem image,
	idCategoria int not null,
	idApresentacao int not null,

	constraint fk_idCategoria foreign key (idCategoria) references Categoria (id)
);

alter table Produto
add constraint fk_idApresentacao foreign key (idApresentacao) references Apresentacao (id);

create table Fornecedor (
	id int primary key,
	cnpj varchar(30) not null,
	telefone varchar(20) not null,
	email varchar(50)
);

create table Funcionario (
	id int primary key,
	nome varchar(30) not null,
	sobrenome varchar(30) not null,
	dataNascimento date not null,
	sexo varchar(1) not null,
	telefone varchar (20) not null,
	email varchar(50),
	codAcesso varchar(20) not null,
	usuario varchar(30) not null,
	senha varchar(30) not null
);

create table Entrada (
	id int primary key,
	idFuncionario int not null,
	idFornecedor int not null,
	data date not null,
	tipoComprovante varchar(30) not null,
	serie varchar(4) not null,
	correlativo varchar(7) not null,
	imposto decimal(2),

	constraint fk_idFuncionario foreign key (idFuncionario) references Funcionario (id),
	constraint fk_idForneceddor foreign key (idFornecedor) references Fornecedor (id)
);

create table DescEntrada (
	id int primary key,
	idEntrada int not null,
	idProduto int not null,
	valorCompra money not null,
	precoVenda money not null,
	estoqueInicial int not null,
	estoqueAtual int not null,
	dataFabricacao date,
	dataVencimento date not null

	constraint fk_idEntrada foreign key (idEntrada) references Entrada (id),
	constraint fk_idProduto foreign key (idProduto) references Produto (id)
);

create table Cliente (
	id int primary key,
	nome varchar(30) not null,
	sobrenome varchar(30),
	sexo varchar(1),
	tipoDocumento varchar(30),
	numDocumento varchar(30),
	telefone varchar(30),
	email varchar(50)
);

create table Venda (
	id int primary key,
	idCliente int not null,
	idFuncionario int not null,
	tipoComprovante varchar(50) not null,
	serie varchar(4) not null,
	correlativo varchar(7) not null,
	imposto decimal(5,2),

	constraint fk_VendaCliente foreign key (idCliente) references Cliente(id),
	constraint fk_VendaFuncionario foreign key (idFuncionario) references Funcionario(id)
);

create table DescVenda (
	id int primary key,
	idVenda int not null,
	idDescEntrada int not null,
	quantidade int not null,
	precoVenda money not null,
	desconto money,

	constraint fk_DescricaoVenda foreign key (idVenda) references Venda(id),
	constraint fk_DescricaoEntrada foreign key (idDescEntrada) references DescEntrada(id)
);