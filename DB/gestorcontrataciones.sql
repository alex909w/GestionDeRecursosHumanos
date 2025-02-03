CREATE
DATABASE IF NOT EXISTS gestorcontrataciones;
USE
gestorcontrataciones;

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
       ('Coordinador de Logística', 'Planificación de la distribución', 1);

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
       ('Tecnología', 'Desarrollo y soporte tecnológico');

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
INSERT INTO `empleados` (`nombre`, `apellido`, `fechaNacimiento`, `genero`, `direccion`, `telefono`,
                         `correoElectronico`)
VALUES ('Juan', 'Pérez', '1990-05-15', 'M', 'Calle 123, Ciudad', '555-1234', 'juan.perez@example.com');

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
       ('Medio Tiempo');

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
