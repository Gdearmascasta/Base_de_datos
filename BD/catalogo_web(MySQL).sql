CREATE DATABASE catalogo_web;
USE catalogo_web;

CREATE TABLE grupo (
    cod_gru INT AUTO_INCREMENT NOT NULL,
    nom_gru VARCHAR(100) NOT NULL,

    CONSTRAINT grupo_pk PRIMARY KEY (cod_gru)
);
CREATE TABLE ciudad (
    cod_ciu INT AUTO_INCREMENT NOT NULL,
    nom_ciu VARCHAR(100) NOT NULL,

    CONSTRAINT ciudad_pk PRIMARY KEY (cod_ciu)
);
CREATE TABLE zona (
    cod_zon INT AUTO_INCREMENT NOT NULL,
    nom_zon VARCHAR(100) NOT NULL,

    CONSTRAINT zona_pk PRIMARY KEY (cod_zon)
);
CREATE TABLE producto (
    cod_pro INT AUTO_INCREMENT NOT NULL,
    nom_pro VARCHAR(100) NOT NULL,
    exi_pro INT NOT NULL,
    stockmin_pro INT NOT NULL,
    stockmax_pro INT NOT NULL,
    preu_pro DECIMAL(10,2) NOT NULL,
    cod_gru INT NOT NULL,

    CONSTRAINT producto_pk PRIMARY KEY (cod_pro),
    CONSTRAINT producto_grupo_fk FOREIGN KEY (cod_gru) REFERENCES grupo(cod_gru),
	CONSTRAINT producto_stock_ck CHECK (stockmin_pro <= stockmax_pro)
);
CREATE TABLE cliente (
    cod_cli INT AUTO_INCREMENT NOT NULL,
    nom_cli VARCHAR(100) NOT NULL,
    dir_cli VARCHAR(150) NOT NULL,
    tel_cli VARCHAR(20) NOT NULL,
    cel_cli VARCHAR(20) NOT NULL,
    mail_cli VARCHAR(100) NOT NULL,
    cod_ciu INT NOT NULL NOT NULL,

    CONSTRAINT cliente_pk PRIMARY KEY (cod_cli),
    CONSTRAINT cliente_ciudad_fk FOREIGN KEY (cod_ciu) REFERENCES ciudad(cod_ciu)
);
CREATE TABLE vendedor (
    cod_ven INT AUTO_INCREMENT NOT NULL,
    nom_ven VARCHAR(100) NOT NULL,
    mail_ven VARCHAR(100) NOT NULL,
    genero_ven CHAR(1) NOT NULL,
    cod_zon INT NOT NULL,

    CONSTRAINT vendedor_pk PRIMARY KEY (cod_ven),
    CONSTRAINT vendedor_zona_fk FOREIGN KEY (cod_zon) REFERENCES zona(cod_zon),
	CONSTRAINT vendedor_genero_ck CHECK (genero_ven IN ('M','F'))
);
CREATE TABLE pedido (
    num_ped INT AUTO_INCREMENT NOT NULL,
    fec_ped DATE NOT NULL,
    val_ped DECIMAL(10,2) NOT NULL,
    cod_cli INT NOT NULL,
    cod_ven INT NOT NULL,

    CONSTRAINT pedido_pk PRIMARY KEY (num_ped),
    CONSTRAINT pedido_cliente_fk FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli),
    CONSTRAINT pedido_vendedor_fk FOREIGN KEY (cod_ven) REFERENCES vendedor(cod_ven)
);

CREATE TABLE prod_pedido (
    num_ped INT NOT NULL,
    cod_pro INT NOT NULL,
    can_pro INT NOT NULL,
    valu_pro DECIMAL(10,2) NOT NULL,

    CONSTRAINT prod_pedido_pk PRIMARY KEY (num_ped, cod_pro),
    CONSTRAINT prodpedido_pedido_fk FOREIGN KEY (num_ped) REFERENCES pedido(num_ped),
    CONSTRAINT prodpedido_producto_fk FOREIGN KEY (cod_pro) REFERENCES producto(cod_pro),
    CONSTRAINT prodpedido_cantidad_ck CHECK (can_pro > 0)
);