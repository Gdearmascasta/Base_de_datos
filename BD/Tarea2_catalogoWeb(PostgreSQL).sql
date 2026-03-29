-- Esta parte del script es para evitar errores al ejecutar la BD varias veces, eliminando las tablas si ya existen antes de crearlas nuevamente.--
DROP TABLE IF EXISTS prod_pedido;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS zona;
DROP TABLE IF EXISTS ciudad;
DROP TABLE IF EXISTS grupo;

-- Crear tablas --
CREATE TABLE grupo (
    cod_gru VARCHAR(20) PRIMARY KEY,
    nom_gru VARCHAR(200) NOT NULL
);

CREATE TABLE ciudad (
    cod_ciu VARCHAR(20) PRIMARY KEY,
    nom_ciu VARCHAR(200) NOT NULL
);

CREATE TABLE zona (
    cod_zon VARCHAR(20) PRIMARY KEY,
    nom_zon VARCHAR(200) NOT NULL
);

CREATE TABLE producto (
    cod_pro VARCHAR(20) PRIMARY KEY,
    nom_pro VARCHAR(200) NOT NULL,
    exi_pro INTEGER DEFAULT 0,
    stockmin_pro INTEGER,
    stockmax_pro INTEGER,
    preu_pro NUMERIC(12,2),
    cod_gru VARCHAR(20) NOT NULL,
    CONSTRAINT fk_producto_grupo FOREIGN KEY (cod_gru) REFERENCES grupo(cod_gru)
);

CREATE TABLE cliente (
    cod_cli VARCHAR(20) PRIMARY KEY,
    nom_cli VARCHAR(200) NOT NULL,
    dir_cli VARCHAR(300),
    tel_cli VARCHAR(50),
    cel_cli VARCHAR(50),
    mail_cli VARCHAR(150),
    cod_ciu VARCHAR(20) NOT NULL,
    CONSTRAINT fk_cliente_ciudad FOREIGN KEY (cod_ciu) REFERENCES ciudad(cod_ciu)
);

CREATE TABLE vendedor (
    cod_ven VARCHAR(20) PRIMARY KEY,
    nom_ven VARCHAR(200) NOT NULL,
    mail_ven VARCHAR(150),
    genero_ven CHAR(1),
    cod_zon VARCHAR(20) NOT NULL,
    CONSTRAINT fk_vendedor_zona FOREIGN KEY (cod_zon) REFERENCES zona(cod_zon)
);

CREATE TABLE pedido (
    num_ped BIGINT PRIMARY KEY,
    fec_ped DATE,
    val_ped NUMERIC(12,2),
    cod_cli VARCHAR(20) NOT NULL,
    cod_ven VARCHAR(20) NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli),
    CONSTRAINT fk_pedido_vendedor FOREIGN KEY (cod_ven) REFERENCES vendedor(cod_ven)
);

CREATE TABLE prod_pedido (
    num_ped BIGINT NOT NULL,
    cod_pro VARCHAR(20) NOT NULL,
    can_pro INTEGER NOT NULL,
    valu_pro NUMERIC(12,2),
    PRIMARY KEY (num_ped, cod_pro),
    CONSTRAINT fk_prodpedido_pedido FOREIGN KEY (num_ped) REFERENCES pedido(num_ped),
    CONSTRAINT fk_prodpedido_producto FOREIGN KEY (cod_pro) REFERENCES producto(cod_pro)
);
