-- Criação de DB para E-commerce
-- drop database ecommerce;


create database ecommerce;
use ecommerce;

-- Criar tabela cliente
create table clients (
	idClient INT auto_increment primary key,
    Fname varchar(10),
    Minit char (3),
    Lname varchar (20),
    cpf char (11) not null,
    address varchar (30),
    birth_date date,
    constraint unique_cpf_client unique (cpf)
);
alter table clients auto_increment=1; -- Usado para reinicializar o contador de identificadores (IDs) automáticos
									  -- O DB ajusta automaticamente o próximo valor para ser o maior ID existente +1


-- Criar tabela produto
-- Size= Dimensões dos produtos
create table product (
	idProduct INT auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Brinquedo', 'Roupas', 'Alimentos', 'Casa') not null,
    product_rating float default 0,
    size varchar(10)
);
alter table product auto_increment=1;


-- Criar tabela pedido
create table orders (
	idOrder INT auto_increment primary key,
    idOrderClient int, 
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    paymentCash bool default false,
    sendValue float default 10, 
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);    
alter table orders auto_increment=1;


-- Criat tabela de pagamento
create table payment (
	idPayment INT,
    idClient INT,
    paymentValue decimal(10, 2) not null,
    paymentDate datetime not null,
    paymentMethod enum('Boleto', 'Cartão de Crédito', 'PIX') not null,
    paymentStatus enum('Aprovado', 'Negado', 'Cancelado', 'Pendente') default 'Pendente',
    primary key(idClient, idPayment)
);


-- Criar tabela estoque
create table productStorage (
	idProdStorage int auto_increment primary key,
    storage_location varchar(255) not null,
    quantity int not null default 0
);
alter table productStorage auto_increment=1;


-- Criar tabela fornecedor
create table supplier(
	idSupplier INT auto_increment primary key,
    legalName varchar(50) not null,
    cnpj char(15) not null,
    contact char(11) not null unique,
    constraint unique_supplier unique(cnpj)
);
alter table supplier auto_increment=1;


-- Criar tabela vendedor
create table salesman(
	idSalesman INT auto_increment primary key,
	legalName varchar(50) not null,
    abstName varchar(255),
    cnpj char(15) not null,
    cpf char(11) not null,
    location varchar(255),
    contact char(11) not null unique,
    constraint unique_cnpj_salesman unique (cnpj),
    constraint unique_cpf_salesman unique (cpf)
);
alter table salesman auto_increment=1;


-- Criar tabela produto_vendedor
-- A tabela 'productSalesman' existe para vincular instâncias específicas das tabelas de salesman e product, pois é impossível
-- representar essa relação (muitos produtos e muitos vendendores, N:N) diretamente nas tabelas
create table productSalesman(
	idProdSalesman int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idProdSalesman, idProduct), -- O Vendedor A e o Produto X só podem aparecer juntos em uma única linha
    constraint fk_product_salesman foreign key (idProdSalesman) references salesman(idSalesman),
	constraint fk_product_product foreign key (idProduct) references product (idProduct)
);


-- Registra quais produtos estão em qual pedido e armazena atributos específicos dessa relação
create table productOrder(
	idPOproduct int, -- ID do Produto. É a Chave Estrangeira (FK) que se conecta à tabela product.
    idPOorder int, -- ID do Pedido. É a Chave Estrangeira (FK) que se conecta à tabela orders.
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_po_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_po_order foreign key (idPOorder) references orders(idOrder)
);


-- Tabela para rastrear a localização de um produto específico dentro de um local de armazenamento
create table storageLocation( 
	 idLProduct int,
     idLStorage int,
     location varchar(255) not null, 
     primary key (idLProduct, idLStorage),
     constraint fk_sl_product foreign key (idLProduct) references product(idProduct),
     constraint fk_sl_storage foreign key (idLStorage) references productStorage(idProdStorage)
);


create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
	constraint fk_product_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
