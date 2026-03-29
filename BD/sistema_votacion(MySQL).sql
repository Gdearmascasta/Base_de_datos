CREATE DATABASE sistema_votacion1;
USE sistema_votacion1;

CREATE TABLE partido (
    cod_par INT AUTO_INCREMENT NOT NULL,
    nom_par VARCHAR(100) NOT NULL,
    CONSTRAINT partido_pk PRIMARY KEY (cod_par)
);
CREATE TABLE empresa (
    cod_emp INT AUTO_INCREMENT NOT NULL,
    nom_emp VARCHAR(100) NOT NULL,
    dir_emp VARCHAR(150) NOT NULL,
    tel_emp VARCHAR(20) NOT NULL,
    CONSTRAINT empresa_pk PRIMARY KEY (cod_emp)
);
CREATE TABLE mesa (
    cod_mesa INT AUTO_INCREMENT NOT NULL,
    des_mesa VARCHAR(100) NOT NULL,
    ubi_mesa VARCHAR(150) NOT NULL,
    CONSTRAINT mesa_pk PRIMARY KEY (cod_mesa)
);
CREATE TABLE candidato (
    cod_can INT AUTO_INCREMENT NOT NULL,
    nom_can VARCHAR(100) NOT NULL,
    dir_can VARCHAR(150),
    tel_can VARCHAR(20),
    foto_can VARCHAR(255) NOT NULL,
    cod_par INT NOT NULL,
    CONSTRAINT candidato_pk PRIMARY KEY (cod_can),
    CONSTRAINT candidato_partido_fk FOREIGN KEY (cod_par)
        REFERENCES partido (cod_par)
);
CREATE TABLE jurado (
    ced_jur INT AUTO_INCREMENT NOT NULL,
    nom_jur VARCHAR(100) NOT NULL,
    dir_jur VARCHAR(150),
    cod_mesa INT NOT NULL,
    cod_emp INT NOT NULL,
    CONSTRAINT jurado_pk PRIMARY KEY (ced_jur),
    CONSTRAINT jurado_mesa_fk FOREIGN KEY (cod_mesa) REFERENCES mesa (cod_mesa),
    CONSTRAINT jurado_empresa_fk FOREIGN KEY (cod_emp) REFERENCES empresa (cod_emp)
);
CREATE TABLE registro (
    cod_can INT NOT NULL,
    cod_mesa INT NOT NULL,
    num_vot INT NOT NULL,
    CONSTRAINT registro_pk PRIMARY KEY (cod_can , cod_mesa),
    CONSTRAINT registro_candidato_fk FOREIGN KEY (cod_can) REFERENCES candidato (cod_can),
    CONSTRAINT registro_mesa_fk FOREIGN KEY (cod_mesa) REFERENCES mesa (cod_mesa),
    CONSTRAINT registro_votos_ck CHECK (num_vot >= 0)
);

