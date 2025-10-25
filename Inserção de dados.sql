-- Inserção de dados e queries

-- Tabela Clients- Fname, Minit, Lname, cpf, address, birth_date
INSERT INTO clients (Fname, Minit, Lname, cpf, address, birth_date) VALUES
	('João', 'A', 'Silva', '12345678901', 'Rua A, 100', '1985-05-15'),
	('Maria', 'C', 'Santos', '98765432109', 'Av. B, 250', '1992-11-20'),
	('Pedro', 'F', 'Oliveira', '11223344556', 'Travessa C, 30', '2000-01-01'),
	('Ana', 'G', 'Pereira', '66554433221', 'Estrada D, 88', '1978-07-25'),
	('Lucas', 'B', 'Almeida', '10987654321', 'Praça E, 12', '1995-03-10'),
	('Sofia', 'D', 'Gomes', '21098765432', 'Alameda F, 45', '1989-09-30');
    
    
-- Tabela Product- Pname, classification_kids, category, product_rating, size
INSERT INTO product (Pname, classification_kids, category, product_rating, size) VALUES
	('Notebook', false, 'Eletrônico', 4.5, '15 pol'),
	('Boneca', true, 'Brinquedo', 4.9, 'Pequeno'),
	('Camiseta', false, 'Roupas', 4.0, 'G'),
	('Arroz', false, 'Alimentos', 3.8, '5kg'),
	('Liquidif.', false, 'Casa', 4.2, 'Médio'),
	('Bola', true, 'Brinquedo', 4.7, 'Único');


-- Tabela Orders- idOrderClient, orderStatus, orderDescription, paymentCash, sendValue
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, paymentCash, sendValue) VALUES
	(1, 'Confirmado', 'Pedido de eletrônicos', false, 15.50), -- Cliente 1 (João)
	(2, 'Em processamento', 'Livros e material de escritório', false, 10.00), -- Cliente 2 (Maria)
	(3, 'Cancelado', 'Item indisponível', true, 0.00), -- Cliente 3 (Pedro)
	(4, 'Confirmado', 'Produtos de limpeza', true, 10.00), -- Cliente 4 (Ana)
	(5, 'Confirmado', 'Roupas de inverno', false, 25.00), -- Cliente 5 (Lucas)
	(6, 'Em processamento', 'Pedido de alimentos básicos', false, 5.00); -- Cliente 6 (Sofia)


-- Tabela Payment- idClient, idPayment, paymentValue, paymentDate, paymentMethod, paymentStatus
INSERT INTO payment (idClient, idPayment, paymentValue, paymentDate, paymentMethod, paymentStatus) VALUES
	(1, 1, 150.75, '2025-10-25 10:30:00', 'PIX', 'Aprovado'),        -- Cliente 1, Primeiro pagamento
	(2, 1, 45.00, '2025-10-24 14:00:00', 'Boleto', 'Pendente'),      -- Cliente 2, Primeiro pagamento
	(3, 1, 99.90, '2025-10-25 09:15:00', 'Cartão de Crédito', 'Aprovado'), -- Cliente 3, Primeiro pagamento
	(4, 1, 220.50, '2025-10-23 18:45:00', 'PIX', 'Aprovado'),        -- Cliente 4, Primeiro pagamento
	(5, 1, 55.20, '2025-10-22 11:55:00', 'Cartão de Crédito', 'Negado'),  -- Cliente 5, Primeiro pagamento
	(1, 2, 30.00, '2025-10-25 15:30:00', 'Boleto', 'Pendente');      -- Cliente 1, Segundo pagamento


-- Tabela ProductStorage- storage_location, quantity
INSERT INTO productStorage (storage_location, quantity) VALUES
	('São Paulo, Centro de Distribuição A', 1000),
	('Rio de Janeiro, Armazém Principal', 550),
	('Minas Gerais, Galpão Industrial', 2500),
	('Bahia, Ponto de Coleta Rápida', 120),
	('Amazonas, Estoque Secundário', 300),
	('Paraná, CD de Devoluções', 15);


-- Tabela Supplier- legalName, cnpj, contact
INSERT INTO supplier (legalName, cnpj, contact) VALUES
	('Tecnologia Avançada LTDA', '00000000000100', '11988887777'),
	('Distribuidores Alfa S.A.', '11111111111100', '21977776666'),
	('Componentes do Sul EPP', '22222222222200', '31966665555'),
	('Materiais Essenciais MEI', '33333333333300', '41955554444'),
	('Embalagens Rápidas', '44444444444400', '51944443333'),
	('Produtos Naturais Organicos', '55555555555500', '61933332222');


-- Tabela Salesman- legalName, abstName, cnpj, cpf, location, contact
INSERT INTO salesman (legalName, abstName, cnpj, cpf, location, contact) VALUES
	('Vendas Online Rápida LTDA', 'Vendas Rápida', '99999999999999', '11111111111', 'São Paulo/SP', '11911112222'),
	('Distribuição Sudeste EPP', 'Distr. Sudeste', '88888888888888', '22222222222', 'Rio de Janeiro/RJ', '21933334444'),
	('Representação Comercial Sul', 'Repres. Sul', '77777777777777', '33333333333', 'Porto Alegre/RS', '51955556666'),
	('Comércio do Nordeste', 'Comércio NE', '66666666666666', '44444444444', 'Recife/PE', '81977778888'),
	('Atacado e Varejo Brasil', 'Atacado Brasil', '55555555555555', '55555555555', 'Belo Horizonte/MG', '31900001111'),
	('Loja Virtual Central', 'Virtual Central', '44444444444444', '66666666666', 'Brasília/DF', '61922223333');


-- Tabela ProductSalesman- idProdSalesman, idProduct, prodQuantity
INSERT INTO productSalesman (idProdSalesman, idProduct, prodQuantity) VALUES
	(1, 1, 50), -- Vendedor 1 vende 50 unidades do Produto 1 (Notebook)
	(1, 2, 120), -- Vendedor 1 vende 120 unidades do Produto 2 (Boneca)
	(2, 3, 300), -- Vendedor 2 vende 300 unidades do Produto 3 (Camiseta)
	(3, 4, 800), -- Vendedor 3 vende 800 unidades do Produto 4 (Arroz)
	(4, 5, 25), -- Vendedor 4 vende 25 unidades do Produto 5 (Liquidificador)
	(5, 6, 150); -- Vendedor 5 vende 150 unidades do Produto 6 (Bola)


-- Tabela ProductOrder- idPOproduct, idPOorder, poQuantity, poStatus
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
	(1, 1, 1, 'Disponível'),     -- Produto 1 (Notebook) no Pedido 1
	(3, 1, 2, 'Disponível'),     -- Produto 3 (Camiseta) também no Pedido 1
	(2, 2, 5, 'Disponível'),     -- Produto 2 (Boneca) no Pedido 2
	(4, 3, 10, 'Sem estoque'),  -- Produto 4 (Arroz) no Pedido 3 (Status "Cancelado" no pedido original)
	(5, 4, 1, 'Disponível'),     -- Produto 5 (Liquidificador) no Pedido 4
	(6, 6, 3, 'Disponível');     -- Produto 6 (Bola) no Pedido 6


-- Tabela StorageLocation- idLProduct, idLStorage, location
INSERT INTO storageLocation (idLProduct, idLStorage, location) VALUES
	(1, 1, 'Corredor A, Prateleira 3'),   -- Produto 1 (Notebook) no CD A
	(1, 4, 'Área de Teste 2'),            -- Produto 1 (Notebook) também no Ponto de Coleta Rápida
	(2, 2, 'Setor Infantil, Gôndola B'),  -- Produto 2 (Boneca) no Armazém Principal
	(3, 3, 'Prateleira Superior 10'),     -- Produto 3 (Camiseta) no Galpão Industrial
	(4, 3, 'Câmara Fria 5'),              -- Produto 4 (Arroz) também no Galpão Industrial
	(5, 5, 'Caixa Pallet 15, Nível 2');   -- Produto 5 (Liquidificador) no Estoque Secundário



-- Tabela ProductSupplier-
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
	(1, 1, 500),  -- Fornecedor 1 (Tecnologia Avançada) fornece 500 unidades do Produto 1 (Notebook)
	(1, 5, 200),  -- Fornecedor 1 também fornece 200 unidades do Produto 5 (Liquidificador)
	(2, 2, 800),  -- Fornecedor 2 (Distribuidores Alfa) fornece 800 unidades do Produto 2 (Boneca)
	(3, 3, 1500), -- Fornecedor 3 (Componentes do Sul) fornece 1500 unidades do Produto 3 (Camiseta)
	(4, 4, 3000), -- Fornecedor 4 (Materiais Essenciais) fornece 3000 unidades do Produto 4 (Arroz)
	(5, 6, 400);  -- Fornecedor 5 (Embalagens Rápidas) fornece 400 unidades do Produto 6 (Bola)














