-- ---------------------------------
-- CREACION DE BASE DE DATOS
-- ---------------------------------

drop database if exists gestorcontrataciones;
create database gestorcontrataciones;
use gestorcontrataciones;

-- ---------------------------------
-- CREACION DE TABLAS
-- ---------------------------------

drop table if exists departamento;
create table departamento (
    id_departamento int primary key auto_increment,
    nombre_departamento varchar(50),
    descripcion_departamento text
);

drop table if exists cargos;
create table cargos (
    id_cargo int primary key auto_increment,
    cargo varchar(50),
    descripcion_cargo text,
    jefatura boolean
);

drop table if exists tipocontratacion;
create table tipocontratacion (
    id_tipo_contratacion int primary key auto_increment,
    tipo_contratacion varchar(100)
);

drop table if exists empleados;
create table empleados (
    id_empleado int primary key auto_increment,
    numero_dui varchar(9),
    nombre_persona varchar(50),
    usuario varchar(50),
    numero_telefono varchar(9),
    correo_institucional varchar(50),
    fecha_nacimiento date
);

drop table if exists contrataciones;
create table contrataciones (
    id_contratacion int primary key auto_increment,
    id_departamento int,
    id_empleado int,
    id_cargo int,
    id_tipo_contratacion int,
    fecha_contratacion date,
    salario decimal(10, 2),
    estado boolean,
    constraint fk_con_dep foreign key (id_departamento) references departamento(id_departamento),
    constraint fk_con_emp foreign key (id_empleado) references empleados(id_empleado),
    constraint fk_con_car foreign key (id_cargo) references cargos(id_cargo),
    constraint fk_con_tco foreign key (id_tipo_contratacion) references tipocontratacion(id_tipo_contratacion)
);

-- ---------------------------------
-- INSERTS INICIALES
-- ---------------------------------

-- Tabla Departamento

insert into departamento (nombre_departamento, descripcion_departamento) 
values
('Recursos Humanos', 'Gestiona el personal'),
('Finanzas', 'Administra el presupuesto'),
('Marketing', 'Promociona los productos'),
('Ventas', 'Gestiona las ventas'),
('Producción', 'Fabrica los productos');

-- Tabla Cargos

insert into cargos (cargo, descripcion_cargo, jefatura) 
values
('Director General', 'Dirige la empresa', true),
('Director de RRHH', 'Gestiona el personal', true),
('Director Financiero', 'Administra las finanzas', true),
('Gerente de Producción', 'Supervisa la producción', false),
('Especialista en Marketing', 'Crea campañas de marketing', false);

-- Tabla TipoContratacion

insert into tipocontratacion (tipo_contratacion) 
values
('Indefinido'),
('Temporal'),
('Por obra o servicio'),
('Eventual'),
('Prácticas');

-- Tabla Empleados

insert into empleados (numero_dui, nombre_persona, usuario, numero_telefono, correo_institucional, fecha_nacimiento)
values
('123456789', 'Juan Pérez', 'juanp', '123456789', 'juan.perez@empresa.com', '1990-01-01'),
('987654321', 'María Gómez', 'mariag', '987654321', 'maria.gomez@empresa.com', '1985-05-05'),
('456789123', 'Carlos López', 'carlosl', '456789123', 'carlos.lopez@empresa.com', '1995-10-10'),
('789123456', 'Ana Rodríguez', 'anar', '789123456', 'ana.rodriguez@empresa.com', '1980-12-12'),
('147258369', 'Pedro Sánchez', 'pedros', '147258369', 'pedro.sanchez@empresa.com', '1992-03-15');

-- Tabla Contrataciones

insert into contrataciones (id_departamento, id_empleado, id_cargo, id_tipo_contratacion, fecha_contratacion, salario, estado) 
values
(1, 1, 1, 1, '2023-01-15', 2000.00, true),
(2, 2, 2, 2, '2023-02-20', 2500.00, true),
(3, 3, 3, 3, '2023-03-25', 3000.00, true),
(4, 4, 4, 4, '2023-04-30', 3500.00, true),
(5, 5, 5, 5, '2023-05-05', 4000.00, true);