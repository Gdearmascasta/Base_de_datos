-- BD en PostgreSQL para sistema electoral--
-- Esta parte del script es para evitar errores al ejecutar la BD varias veces, eliminando las tablas si ya existen antes de crearlas nuevamente.--

DROP TABLE IF EXISTS registro;
DROP TABLE IF EXISTS jurado;
DROP TABLE IF EXISTS candidato;
DROP TABLE IF EXISTS mesa;
DROP TABLE IF EXISTS empresa;
DROP TABLE IF EXISTS partido;

-- Crear tablas en orden seguro
CREATE TABLE partido (
    cod_par VARCHAR(20) NOT NULL,
    nom_par VARCHAR(200) NOT NULL,
    CONSTRAINT pk_partido PRIMARY KEY (cod_par)
);

CREATE TABLE candidato (
    cod_can VARCHAR(20) NOT NULL,
    nom_can VARCHAR(200) NOT NULL,
    dir_can VARCHAR(300),
    tel_can VARCHAR(50),
    foto_can VARCHAR(300),
    cod_par VARCHAR(20) NOT NULL,
    CONSTRAINT pk_candidato PRIMARY KEY (cod_can),
    CONSTRAINT fk_candidato_partido FOREIGN KEY (cod_par) REFERENCES partido(cod_par)
);

CREATE TABLE mesa (
    cod_mesa VARCHAR(20) PRIMARY KEY,
    des_mesa VARCHAR(200) NOT NULL,
    ubi_mesa VARCHAR(200)
);

CREATE TABLE empresa (
    cod_emp VARCHAR(20) PRIMARY KEY,
    nom_emp VARCHAR(200) NOT NULL,
    dir_emp VARCHAR(300),
    tel_emp VARCHAR(50)
);

CREATE TABLE jurado (
    ced_jur VARCHAR(20) NOT NULL,
    nom_jur VARCHAR(200) NOT NULL,
    dir_jur VARCHAR(300),
    cod_mesa VARCHAR(20) NOT NULL,
    cod_emp VARCHAR(20) NOT NULL,
    CONSTRAINT pk_jurado PRIMARY KEY (ced_jur),
    CONSTRAINT fk_jurado_mesa FOREIGN KEY (cod_mesa) REFERENCES mesa(cod_mesa),
    CONSTRAINT fk_jurado_empresa FOREIGN KEY (cod_emp) REFERENCES empresa(cod_emp)
);

CREATE TABLE registro (
    cod_can VARCHAR(20) NOT NULL,
    cod_mesa VARCHAR(20) NOT NULL,
    num_vot INTEGER DEFAULT 0,
    CONSTRAINT pk_registro PRIMARY KEY (cod_can, cod_mesa),
    CONSTRAINT fk_registro_candidato FOREIGN KEY (cod_can) REFERENCES candidato(cod_can),
    CONSTRAINT fk_registro_mesa FOREIGN KEY (cod_mesa) REFERENCES mesa(cod_mesa)
);
