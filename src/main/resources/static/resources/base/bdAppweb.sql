-- MySQL Script generated by MySQL Workbench
-- Mon Nov  7 14:19:47 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyectodsw_202202_2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectodsw_202202_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectodsw_202202_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `proyectodsw_202202_2` ;

-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_bus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_bus` (
  `Cod_Bus` INT NOT NULL AUTO_INCREMENT,
  `Registro` VARCHAR(100) NULL DEFAULT NULL,
  `Cantidad_Asientos` INT NULL DEFAULT NULL,
  `Marca` VARCHAR(100) NULL DEFAULT NULL,
  `Modelo` VARCHAR(100) NULL DEFAULT NULL,
  `Estado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Bus`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_tipoasiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_tipoasiento` (
  `Cod_Tipo_Asiento` INT NOT NULL,
  `Tipo_ASiento` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Tipo_Asiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_asiento` (
  `Cod_Asiento` INT NOT NULL AUTO_INCREMENT,
  `Alias_Asiento` VARCHAR(20) NULL DEFAULT NULL,
  `Cod_Bus` INT NULL DEFAULT NULL,
  `Cod_Tipo_Asiento` INT NULL DEFAULT NULL,
  `Estado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Asiento`),
  INDEX `Cod_Bus` (`Cod_Bus` ASC) VISIBLE,
  INDEX `Cod_Tipo_Asiento` (`Cod_Tipo_Asiento` ASC) VISIBLE,
  CONSTRAINT `tb_asiento_ibfk_1`
    FOREIGN KEY (`Cod_Bus`)
    REFERENCES `proyectodsw_202202_2`.`tb_bus` (`Cod_Bus`),
  CONSTRAINT `tb_asiento_ibfk_2`
    FOREIGN KEY (`Cod_Tipo_Asiento`)
    REFERENCES `proyectodsw_202202_2`.`tb_tipoasiento` (`Cod_Tipo_Asiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_tipodoc`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_tipodoc` (
  `codigo` int auto_increment ,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_cliente`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_cliente` (
  `id_cli` INT NOT NULL AUTO_INCREMENT,
  `cod_cli`int,
  `tipo` int ,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `apellido` VARCHAR(30) NULL DEFAULT NULL,
  `edad` INT NULL DEFAULT NULL,
  `Estado` INT NULL DEFAULT '1',
 
  `tipogen` INT NULL,
  PRIMARY KEY (`id_cli`),
  INDEX `tipo` (`tipo` ASC) VISIBLE,
      INDEX `tipogen` (`tipogen` ASC) VISIBLE,
  CONSTRAINT `tb_cliente_ibfk_1`
    FOREIGN KEY (`tipo`)
    REFERENCES `proyectodsw_202202_2`.`tb_tipodoc` (`codigo`),

    CONSTRAINT `tb_cliente_ibfk_2`
    FOREIGN KEY (`tipogen`)
    REFERENCES `proyectodsw_202202_2`.`tb_genero` (`id_genero`))
    
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_departamento` (
  `Cod_Departamento` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Departamento` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Departamento`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_usuario` (
  `Cod_Usuario` INT NOT NULL AUTO_INCREMENT,
  `Correo_Usuario` VARCHAR(30) NULL DEFAULT NULL,
  `Contraseña_Usuario` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_ventapasaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_ventapasaje` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Cod_Usuario` INT NULL DEFAULT NULL,
  `Fecha_Venta` DATETIME NULL DEFAULT NULL,
  `Monto_Total` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Cod_Usuario` (`Cod_Usuario` ASC) VISIBLE,
  CONSTRAINT `tb_ventapasaje_ibfk_1`
    FOREIGN KEY (`Cod_Usuario`)
    REFERENCES `proyectodsw_202202_2`.`tb_usuario` (`Cod_Usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_terminalterrestre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_terminalterrestre` (
  `Cod_Terminal` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Terminal` VARCHAR(100) NULL DEFAULT NULL,
  `Cod_Departamento` INT NULL DEFAULT NULL,
  `Estado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Terminal`),
  INDEX `Cod_Departamento` (`Cod_Departamento` ASC) VISIBLE,
  CONSTRAINT `tb_terminalterrestre_ibfk_1`
    FOREIGN KEY (`Cod_Departamento`)
    REFERENCES `proyectodsw_202202_2`.`tb_departamento` (`Cod_Departamento`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_ruta` (
  `Cod_Ruta` INT NOT NULL AUTO_INCREMENT,
  `Alias_Ruta` VARCHAR(100) NULL DEFAULT NULL,
  `Tiempo_Promedio_Ruta` BIGINT NULL DEFAULT NULL,
  `Cod_Terminal_Origen` INT NULL DEFAULT NULL,
  `Cod_Terminal_Destino` INT NULL DEFAULT NULL,
  `DistanciaKm` FLOAT NULL DEFAULT NULL,
  `Estado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Ruta`),
  INDEX `Cod_Terminal_Origen` (`Cod_Terminal_Origen` ASC) VISIBLE,
  INDEX `Cod_Terminal_Destino` (`Cod_Terminal_Destino` ASC) VISIBLE,
  CONSTRAINT `tb_ruta_ibfk_1`
    FOREIGN KEY (`Cod_Terminal_Origen`)
    REFERENCES `proyectodsw_202202_2`.`tb_terminalterrestre` (`Cod_Terminal`),
  CONSTRAINT `tb_ruta_ibfk_2`
    FOREIGN KEY (`Cod_Terminal_Destino`)
    REFERENCES `proyectodsw_202202_2`.`tb_terminalterrestre` (`Cod_Terminal`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_viaje` (
  `Cod_Viaje` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Hora_Partida` DATETIME NULL DEFAULT NULL,
  `Fecha_Hora_Llegada` DATETIME NULL DEFAULT NULL,
  `Cod_Ruta` INT NULL DEFAULT NULL,
  `Cod_Bus` INT NULL DEFAULT NULL,
  `Estado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Viaje`),
  INDEX `Cod_Ruta` (`Cod_Ruta` ASC) VISIBLE,
  INDEX `Cod_Bus` (`Cod_Bus` ASC) VISIBLE,
  CONSTRAINT `tb_viaje_ibfk_1`
    FOREIGN KEY (`Cod_Ruta`)
    REFERENCES `proyectodsw_202202_2`.`tb_ruta` (`Cod_Ruta`),
  CONSTRAINT `tb_viaje_ibfk_2`
    FOREIGN KEY (`Cod_Bus`)
    REFERENCES `proyectodsw_202202_2`.`tb_bus` (`Cod_Bus`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_detalleventapasaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_detalleventapasaje` (
  `Id_Venta` INT NULL DEFAULT NULL,
  `Cod_Viaje` INT NULL DEFAULT NULL,
  `id_cli` INT NULL DEFAULT NULL,
  `Cod_Asiento` INT NULL DEFAULT NULL,
  `Voucher` VARCHAR(20) NULL DEFAULT NULL,
  `Costo_Ticket` FLOAT NULL DEFAULT NULL,
  `Descuento` FLOAT NULL DEFAULT NULL,
  `Sub_total` DOUBLE NULL DEFAULT NULL,
  INDEX `Id_Venta` (`Id_Venta` ASC) VISIBLE,
  INDEX `Cod_Viaje` (`Cod_Viaje` ASC) VISIBLE,
  INDEX `id_cli` (`id_cli` ASC) VISIBLE,
  INDEX `Cod_Asiento` (`Cod_Asiento` ASC) VISIBLE,
  CONSTRAINT `tb_detalleventapasaje_ibfk_1`
    FOREIGN KEY (`Id_Venta`)
    REFERENCES `proyectodsw_202202_2`.`tb_ventapasaje` (`Id`),
  CONSTRAINT `tb_detalleventapasaje_ibfk_2`
    FOREIGN KEY (`Cod_Viaje`)
    REFERENCES `proyectodsw_202202_2`.`tb_viaje` (`Cod_Viaje`),
  CONSTRAINT `tb_detalleventapasaje_ibfk_3`
    FOREIGN KEY (`id_cli`)
    REFERENCES `proyectodsw_202202_2`.`tb_cliente` (`id_cli`),
  CONSTRAINT `tb_detalleventapasaje_ibfk_4`
    FOREIGN KEY (`Cod_Asiento`)
    REFERENCES `proyectodsw_202202_2`.`tb_asiento` (`Cod_Asiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyectodsw_202202_2`.`tb_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectodsw_202202_2`.`tb_genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `desc_gen` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
select* from tb_genero;