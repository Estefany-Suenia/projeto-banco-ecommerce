CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf_cnpj VARCHAR(20) UNIQUE,
    tipo_pessoa VARCHAR(2) CHECK (tipo_pessoa IN ('PF', 'PJ')),
    email VARCHAR(100)
);

CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100),
    cnpj VARCHAR(20)
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE ItemPedido (
    id_item INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    id_pedido INT,
    tipo_pagamento VARCHAR(50),
    status_pagamento VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Entrega (
    id_entrega INT PRIMARY KEY,
    id_pedido INT,
    status_entrega VARCHAR(50),
    codigo_rastreio VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
