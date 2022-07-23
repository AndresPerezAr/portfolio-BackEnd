-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portfolio-AndresPerez
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Portfolio-AndresPerez
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portfolio-AndresPerez` DEFAULT CHARACTER SET utf8 ;
USE `Portfolio-AndresPerez` ;

-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Título` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Foto` (
  `idFoto` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Carpeta` VARCHAR(255) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idFoto`),
  INDEX `fk_Foto_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Foto_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Título` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`, `Foto_idFoto`),
  INDEX `fk_Usuarios_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Foto1`
    FOREIGN KEY (`Foto_idFoto`)
    REFERENCES `Portfolio-AndresPerez`.`Foto` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Experiencia` (
  `idExperiencia` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`idExperiencia`),
  INDEX `fk_Experiencia_Persona_idx` (`Persona_idPersona` ASC) VISIBLE,
  INDEX `fk_Experiencia_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Experiencia_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Portfolio-AndresPerez`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_Foto1`
    FOREIGN KEY (`Foto_idFoto`)
    REFERENCES `Portfolio-AndresPerez`.`Foto` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Educacion` (
  `idEducacion` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`idEducacion`),
  INDEX `fk_Educacion_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  INDEX `fk_Educacion_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Educacion_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Educacion_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Portfolio-AndresPerez`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Educacion_Foto1`
    FOREIGN KEY (`Foto_idFoto`)
    REFERENCES `Portfolio-AndresPerez`.`Foto` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Habilidades` (
  `idHabilidades` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Porcentaje` INT NOT NULL,
  PRIMARY KEY (`idHabilidades`),
  INDEX `fk_Habilidades_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  INDEX `fk_Habilidades_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Habilidades_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habilidades_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Portfolio-AndresPerez`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Proyectos` (
  `idProyectos` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`idProyectos`),
  INDEX `fk_Proyectos_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  INDEX `fk_Proyectos_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Proyectos_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyectos_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Portfolio-AndresPerez`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyectos_Foto1`
    FOREIGN KEY (`Foto_idFoto`)
    REFERENCES `Portfolio-AndresPerez`.`Foto` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
