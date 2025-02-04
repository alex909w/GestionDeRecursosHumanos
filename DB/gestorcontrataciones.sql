CREATE DATABASE IF NOT EXISTS gestorcontrataciones;
USE gestorcontrataciones;

-- Eliminar tablas si existen
DROP TABLE IF EXISTS `contrataciones`, `cargos`, `departamento`, `empleados`, `tipocontratacion`;

-- Crear tabla cargos
CREATE TABLE `cargos`
(
    `idCargo`          INT         NOT NULL AUTO_INCREMENT,
    `cargo`            VARCHAR(50) NOT NULL,
    `descripcionCargo` TEXT,
    `jefatura`         TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertar datos en cargos
INSERT INTO `cargos` (`cargo`, `descripcionCargo`, `jefatura`)
VALUES ('Gerente', 'Responsable de la gestión del departamento', 1),
       ('Desarrollador', 'Encargado del desarrollo de software', 0),
       ('Analista Financiero', 'Análisis de estados financieros', 0),
       ('Ejecutivo de Ventas', 'Responsable de cerrar ventas', 0),
       ('Diseñador Gráfico', 'Creación de material gráfico', 0),
       ('Coordinador de Logística', 'Planificación de la distribución', 1),
       ('Administrador de Sistemas', 'Gestión y mantenimiento de infraestructuras tecnológicas', 0),
       ('Líder de Proyecto', 'Gestión de equipos de desarrollo de software', 1),
       ('Consultor IT', 'Asesoramiento en soluciones tecnológicas', 0),
       ('Desarrollador Front-End', 'Desarrollo de interfaces de usuario', 0);

-- Crear tabla departamento
CREATE TABLE `departamento`
(
    `idDepartamento`          INT         NOT NULL AUTO_INCREMENT,
    `nombreDepartamento`      VARCHAR(50) NOT NULL,
    `descripcionDepartamento` TEXT,
    PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertar datos en departamento
INSERT INTO `departamento` (`nombreDepartamento`, `descripcionDepartamento`)
VALUES ('Recursos Humanos', 'Gestión del personal y contrataciones'),
       ('Tecnología', 'Desarrollo y soporte tecnológico'),
       ('Ventas', 'Estrategias y ejecución de ventas'),
       ('Marketing', 'Creación y gestión de campañas de marketing'),
       ('Logística', 'Coordinación de distribución de productos');

-- Crear tabla tipo de contratación
CREATE TABLE `tipocontratacion`
(
    `idTipoContratacion` INT          NOT NULL AUTO_INCREMENT,
    `tipoContratacion`   VARCHAR(100) NOT NULL,
    PRIMARY KEY (`idTipoContratacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertar datos en tipo de contratación
INSERT INTO `tipocontratacion` (`tipoContratacion`)
VALUES ('Tiempo Completo'),
       ('Medio Tiempo'),
       ('Freelance'),
       ('Prácticas'),
       ('Contrato por Proyecto');

-- Crear tabla empleados
CREATE TABLE `empleados`
(
    `idEmpleado`        INT          NOT NULL AUTO_INCREMENT,
    `nombre`            VARCHAR(100) NOT NULL,
    `apellido`          VARCHAR(100) NOT NULL,
    `fechaNacimiento`   DATE         NOT NULL,
    `genero`            CHAR(1)      NOT NULL,
    `direccion`         VARCHAR(200),
    `telefono`          VARCHAR(15),
    `correoElectronico` VARCHAR(100) UNIQUE,
    PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertar datos en empleados
INSERT INTO `empleados` (`nombre`, `apellido`, `fechaNacimiento`, `genero`, `direccion`, `telefono`, `correoElectronico`)
VALUES ('Juan', 'Pérez', '1990-05-15', 'M', 'Calle 123, Ciudad', '555-1234', 'juan.perez@example.com'),
       ('Ana', 'Gómez', '1985-07-10', 'F', 'Calle 456, Ciudad', '555-5678', 'ana.gomez@example.com'),
       ('Carlos', 'Sánchez', '1992-11-20', 'M', 'Calle 789, Ciudad', '555-8765', 'carlos.sanchez@example.com'),
       ('María', 'Fernández', '1988-03-25', 'F', 'Calle 101, Ciudad', '555-4321', 'maria.fernandez@example.com'),
       ('Luis', 'Martínez', '1993-06-17', 'M', 'Calle 202, Ciudad', '555-1357', 'luis.martinez@example.com'),
       ('Paula', 'Ramírez', '1990-12-05', 'F', 'Calle 303, Ciudad', '555-2468', 'paula.ramirez@example.com'),
       ('Pedro', 'Hernández', '1987-02-12', 'M', 'Calle 404, Ciudad', '555-9876', 'pedro.hernandez@example.com'),
       ('Laura', 'Díaz', '1994-09-21', 'F', 'Calle 505, Ciudad', '555-6543', 'laura.diaz@example.com'),
       ('Ricardo', 'López', '1986-01-30', 'M', 'Calle 606, Ciudad', '555-3210', 'ricardo.lopez@example.com'),
       ('Sofia', 'García', '1991-04-18', 'F', 'Calle 707, Ciudad', '555-7412', 'sofia.garcia@example.com');

-- Crear tabla contrataciones
CREATE TABLE `contrataciones`
(
    `idContratacion`     INT            NOT NULL AUTO_INCREMENT,
    `idEmpleado`         INT            NOT NULL,
    `idDepartamento`     INT            NOT NULL,
    `idCargo`            INT            NOT NULL,
    `idTipoContratacion` INT            NOT NULL,
    `fechaContratacion`  DATE           NOT NULL,
    `salario`            DECIMAL(10, 2) NOT NULL,
    `estado`             TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`idContratacion`),
    FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE,
    FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE,
    FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`idCargo`) ON DELETE CASCADE,
    FOREIGN KEY (`idTipoContratacion`) REFERENCES `tipocontratacion` (`idTipoContratacion`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertar datos en contrataciones
INSERT INTO `contrataciones` (`idEmpleado`, `idDepartamento`, `idCargo`, `idTipoContratacion`, `fechaContratacion`, `salario`, `estado`)
VALUES (1, 1, 1, 1, '2015-06-01', 50000.00, 1),
       (2, 2, 2, 1, '2017-08-15', 45000.00, 1),
       (3, 2, 3, 2, '2018-03-10', 40000.00, 1),
       (4, 3, 4, 1, '2019-02-22', 35000.00, 1),
       (5, 4, 5, 3, '2020-05-30', 32000.00, 1),
       (6, 5, 6, 2, '2021-09-18', 38000.00, 1),
       (7, 1, 1, 1, '2016-07-11', 55000.00, 1),
       (8, 2, 7, 1, '2022-11-01', 47000.00, 1),
       (9, 3, 8, 4, '2022-01-20', 30000.00, 1),
       (10, 4, 9, 5, '2023-07-01', 31000.00, 1),
       (1, 5, 2, 2, '2015-06-01', 50000.00, 0),
       (2, 1, 6, 1, '2017-08-15', 46000.00, 1),
       (3, 4, 10, 1, '2018-03-10', 43000.00, 1),
       (4, 5, 3, 4, '2019-02-22', 34000.00, 1),
       (5, 3, 4, 5, '2020-05-30', 33000.00, 1),
       (6, 2, 3, 2, '2021-09-18', 39000.00, 1),
       (7, 1, 6, 3, '2016-07-11', 56000.00, 1),
       (8, 4, 7, 1, '2022-11-01', 48000.00, 1),
       (9, 5, 8, 4, '2022-01-20', 31000.00, 0),
       (10, 1, 1, 5, '2023-07-01', 32000.00, 1);
