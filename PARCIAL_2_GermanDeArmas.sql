-- CREAR BASE DE DATOS --
create table zona(
	cod_zona serial not null,
	nom_zona varchar(80) not null,
	constraint zona_pk primary key(cod_zona)
);
create table grupo(
	cod_grupo serial not null,
	nom_grupo varchar(80) not null,
	constraint grupo_pk primary key(cod_grupo)
);
create table cliente(
	cod_cliente varchar(15) not null,
	nom_cliente varchar(80) not null,
	dir_cliente varchar(80),
	tel_cliente varchar(15),
    email_cliente varchar(80) not null,
	constraint cliente_pk primary key(cod_cliente)
);
create table vendedor(
	cod_ven varchar(15) not null,
	nom_ven varchar(80) not null,
	email_ven varchar(80) not null,
	gen_ven varchar(1) not null,
    cod_zona int not null,
	constraint vendedor_pk primary key(cod_ven),
	constraint vendedor_gen_ven_ck check(gen_ven='M' or gen_ven='F' or gen_ven='N'),
    constraint vendedor_cod_zona_fk foreign key(cod_zona) references zona(cod_zona)
);
create table producto(
	cod_prod varchar(15) not null,
	nom_prod varchar(80) not null,
	exist_prod int  not null,
    stockmax_prod int not null,
    stockmin_prod int not null,
    precio_prod double precision not null,
    cod_grupo int not null,
	constraint producto_pk primary key(cod_prod),
	constraint producto_cod_grup_fk foreign key(cod_grupo) references grupo(cod_grupo)
);
create table pedido(
	num_ped serial not null,
	fecha_ped date not null,
    valor_ped double precision not null,
    cod_ven varchar(15) not null,
    cod_cliente varchar(15) not null,
	constraint pedido_pk primary key(num_ped),
	constraint pedido_cod_ven_fk foreign key(cod_ven) references vendedor(cod_ven),
    constraint pedido_cod_cliente_fk foreign key(cod_cliente) references cliente(cod_cliente)
);
create table producto_pedido(
	codigo serial not null,
	cod_prod varchar(15) not null,
    can_prod int not null,
    valor_prod double precision not null,
    num_ped int not null,
    constraint producto_pedido_pk primary key(codigo),
	constraint producto_pedido_uk unique (cod_prod,num_ped),
    constraint producto_pedido_cod_prod_fk foreign key(cod_prod) references producto(cod_prod),
    constraint producto_pedido_num_ped_fk foreign key(num_ped) references pedido(num_ped)
);
-- POBLAR BASE DE DATOS --
INSERT INTO ZONA(nom_zona) VALUES('NORTE');
INSERT INTO ZONA(nom_zona) VALUES('CENTRO');
INSERT INTO ZONA(nom_zona) VALUES('SUR');
INSERT INTO ZONA(nom_zona) VALUES('ORIENTAL');
INSERT INTO ZONA(nom_zona) VALUES('OCCIDENTAL');
INSERT INTO GRUPO(nom_grupo) VALUES('LACTEOS');
INSERT INTO GRUPO(nom_grupo) VALUES('ASEO');
INSERT INTO GRUPO(nom_grupo) VALUES('CARNICOS');
INSERT INTO GRUPO(nom_grupo) VALUES('SNACK');
INSERT INTO GRUPO(nom_grupo) VALUES('ASEO PERSONAL');
INSERT INTO CLIENTE(cod_cliente,nom_cliente,dir_cliente,tel_cliente,email_cliente) VALUES('1','PEDRO JOSE ROMAN','CRA 26 NO. 34-34','6358417','pj@gmail.com');
INSERT INTO CLIENTE(cod_cliente,nom_cliente,dir_cliente,tel_cliente,email_cliente) VALUES('2','SERGIO MEDINA',NULL,NULL,'sm@gmail.com');
INSERT INTO CLIENTE(cod_cliente,nom_cliente,dir_cliente,tel_cliente,email_cliente) VALUES('3','LUISA LENAE','CRA 90 NO. 50-54',NULL,'ll@gmail.com');
INSERT INTO CLIENTE(cod_cliente,nom_cliente,dir_cliente,tel_cliente,email_cliente) VALUES('4','MARIA MEDINA',NULL,'467634','mm@gmail.com');
INSERT INTO CLIENTE(cod_cliente,nom_cliente,dir_cliente,tel_cliente,email_cliente) VALUES('5','CATALINA GOMEZ',NULL,NULL,'pj@gmail.com');
INSERT INTO VENDEDOR(cod_ven,nom_ven,email_ven,gen_ven,cod_zona) VALUES('1','PEDRO LOPEZ','pl@gmail.com','M',1);
INSERT INTO VENDEDOR(cod_ven,nom_ven,email_ven,gen_ven,cod_zona) VALUES('2','LAURA MEDINA','ll@gmail.com','F',2);
INSERT INTO VENDEDOR(cod_ven,nom_ven,email_ven,gen_ven,cod_zona) VALUES('3','ROBERTO RUIZ','RR@gmail.com','M',3);
INSERT INTO VENDEDOR(cod_ven,nom_ven,email_ven,gen_ven,cod_zona) VALUES('4','LUISA GOMEZ','lgo@gmail.com','F',4);
INSERT INTO VENDEDOR(cod_ven,nom_ven,email_ven,gen_ven,cod_zona) VALUES('5','ARMANDO PEREZ','ap@gmail.com','M',1);
INSERT INTO VENDEDOR(cod_ven,nom_ven,email_ven,gen_ven,cod_zona) VALUES('6','CARLA CASTILLO','cc@gmail.com','F',2);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('1','LECHE ALPINA',100,30,50,3500,1);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('2','KUMIS ALPINA',20,30,60,2800,1);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('3','ESCOBA',50,40,60,15000,2);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('4','TRAPERO',20,40,60,17000,2);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('5','LOMO FINO',50,70,90,35000,3);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('6','COSTILLA',60,30,60,20000,3);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('7','DE TODITO',120,150,200,4000,4);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('8','MANI MOTO',100,40,60,3000,4);
INSERT INTO PRODUCTO(cod_prod,nom_prod,exist_prod,stockmax_prod,stockmin_prod,precio_prod,cod_grupo) VALUES('9','JABON',100,110,150,5600,5);
INSERT INTO PEDIDO(fecha_ped,valor_ped,cod_ven,cod_cliente) VALUES('2023-10-01',1500000,1,1);
INSERT INTO PEDIDO(fecha_ped,valor_ped,cod_ven,cod_cliente) VALUES('2023-11-10',3500000,2,2);
INSERT INTO PEDIDO(fecha_ped,valor_ped,cod_ven,cod_cliente) VALUES('2024-05-07',4500000,3,3);
INSERT INTO PEDIDO(fecha_ped,valor_ped,cod_ven,cod_cliente) VALUES('2024-06-01',5600000,4,4);
INSERT INTO PEDIDO(fecha_ped,valor_ped,cod_ven,cod_cliente) VALUES('2024-08-01',4300000,5,5);
INSERT INTO PEDIDO(fecha_ped,valor_ped,cod_ven,cod_cliente) VALUES('2024-10-01',3700000,1,1);
INSERT INTO PEDIDO(fecha_ped,valor_ped,cod_ven,cod_cliente) VALUES('2024-11-01',2300000,2,2);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('1',50,120000,1);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('2',20,700000,1);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('3',80,2000000,2);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('4',60,1800000,2);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('5',20,350000,3);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('6',30,430000,3);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('7',10,130000,4);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('8',20,340000,4);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('9',10,220000,5);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('1',20,430000,5);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('2',15,280000,6);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('3',25,460000,6);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('3',10,240000,7);
INSERT INTO PRODUCTO_PEDIDO(cod_prod,can_prod,valor_prod,num_ped) VALUES('1',20,360000,7);

-- Preguntas parcial (CONSULTAS)--

-- 1)  Pedidos realizados de los grupos LACTEOS, SNACK, CARNICOS. Mostrar número pedido, fecha pedido, valor pedido, nombre del cleinte y nombre del grupo, ordenado por el nombre del grupo ascendente y dentro del nombrec del grupo, por el valor del pedido descendente.
-- Aqui podria usar select distinc para quitar los duplicados, pero usare solo lo visto en clase --
SELECT  p.num_ped, p.fecha_ped, p.valor_ped, c.nom_cliente, g.nom_grupo
FROM pedido p
JOIN producto_pedido pp ON p.num_ped = pp.num_ped
JOIN producto pr ON pp.cod_prod = pr.cod_prod
JOIN grupo g ON pr.cod_grupo = g.cod_grupo
JOIN cliente c ON p.cod_cliente = c.cod_cliente
WHERE g.nom_grupo IN ('LACTEOS','SNACK','CARNICOS')
ORDER BY g.nom_grupo ASC, p.valor_ped DESC;

-- 2) Productos que han tenido pedidos (nombre de producto)
SELECT  pr.nom_prod
FROM producto pr
JOIN producto_pedido pp ON pr.cod_prod = pp.cod_prod
ORDER BY pr.nom_prod ASC;

-- 3) Valor total de los pedidos por grupo
SELECT g.nom_grupo, SUM(pp.valor_prod) AS valor_total
FROM grupo g
JOIN producto pr ON pr.cod_grupo = g.cod_grupo
JOIN producto_pedido pp ON pp.cod_prod = pr.cod_prod
GROUP BY g.nom_grupo
ORDER BY valor_total DESC;

-- 4) Valor máximo de los pedidos por zona
SELECT z.nom_zona, MAX(p.valor_ped) AS valor_maximo
FROM zona z
JOIN vendedor v ON v.cod_zona = z.cod_zona
JOIN pedido p ON p.cod_ven = v.cod_ven
GROUP BY z.nom_zona
ORDER BY z.nom_zona ASC;

-- 5) Vendedores con más de 1 pedido
SELECT v.nom_ven, COUNT(p.num_ped) AS cantidad_pedidos
FROM vendedor v
JOIN pedido p ON p.cod_ven = v.cod_ven
GROUP BY v.nom_ven
HAVING COUNT(p.num_ped) > 1
ORDER BY cantidad_pedidos DESC;