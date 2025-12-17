# 🛒 Banco de Dados para E-commerce

Projeto de **modelagem e implementação de um banco de dados relacional** para um sistema de **e-commerce**, desenvolvido em **SQL**.  
O objetivo é representar, de forma estruturada, as principais entidades envolvidas no processo de venda online, garantindo **integridade dos dados**, **consistência relacional** e suporte a **consultas analíticas**.


## 📁 Estrutura do Projeto

A organização do projeto está dividida da seguinte forma:

- **`01_create_database.sql`**  
  Script responsável pela criação do banco de dados, tabelas, chaves primárias, chaves estrangeiras e restrições de integridade.

- **`02_insert_data.sql`**  
  Contém a inserção de dados fictícios, utilizados para testes, validação do modelo e execução das consultas.

- **`03_queries.sql`**  
  Conjunto de consultas SQL voltadas à extração de informações, análises e verificação dos relacionamentos entre as entidades.

- **`img/`**  
  Diretório destinado às imagens do projeto, incluindo o diagrama entidade-relacionamento (ER).


## 🗂️ Entidades Principais

O banco de dados é composto pelas seguintes entidades:

- Clientes  
- Produtos  
- Pedidos  
- Pagamentos  
- Estoque  
- Fornecedores  
- Vendedores  

A modelagem contempla relacionamentos **1:N** e **N:N**, utilização de **tabelas associativas** e aplicação de restrições como **PRIMARY KEY**, **FOREIGN KEY**, **UNIQUE** e **ENUM**, assegurando a integridade referencial do banco.


## 📊 Diagrama Entidade-Relacionamento (ER)

O diagrama abaixo representa a estrutura lógica do banco de dados, bem como os relacionamentos entre suas entidades:

![Diagrama Entidade-Relacionamento do E-commerce](img/diagrama-er-ecommerce.png)


## 🎯 Objetivo do Projeto

Projeto desenvolvido com fins **acadêmicos e práticos**, com foco na aplicação de conceitos de **modelagem de dados**, **normalização**, **integridade referencial** e **consultas SQL**.  
