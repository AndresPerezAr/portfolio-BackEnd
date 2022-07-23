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
-- Table `Portfolio-AndresPerez`.`Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Foto` (
  `idFoto` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Carpeta` VARCHAR(255) NOT NULL,
  `Fecha` DATE NOT NULL,
  PRIMARY KEY (`idFoto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Título` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`idPersona`, `Foto_idFoto`),
  INDEX `fk_Persona_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Foto1`
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
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idExperiencia`, `Persona_idPersona`),
  INDEX `fk_Experiencia_Persona_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Educacion` (
  `idEducacion` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idEducacion`, `Persona_idPersona`),
  INDEX `fk_Educacion_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Habilidades` (
  `idHabilidades` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Porcentaje` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idHabilidades`, `Persona_idPersona`),
  INDEX `fk_Habilidades_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Habilidades_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Proyectos` (
  `idProyectos` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Descripción` VARCHAR(255) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idProyectos`, `Persona_idPersona`),
  INDEX `fk_Proyectos_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Experiencia_has_Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Experiencia_has_Foto` (
  `Experiencia_idExperiencia` INT NOT NULL,
  `Experiencia_Persona_idPersona` INT NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`Experiencia_idExperiencia`, `Experiencia_Persona_idPersona`, `Foto_idFoto`),
  INDEX `fk_Experiencia_has_Foto_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  INDEX `fk_Experiencia_has_Foto_Experiencia1_idx` (`Experiencia_idExperiencia` ASC, `Experiencia_Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_has_Foto_Experiencia1`
    FOREIGN KEY (`Experiencia_idExperiencia` , `Experiencia_Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Experiencia` (`idExperiencia` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_has_Foto_Foto1`
    FOREIGN KEY (`Foto_idFoto`)
    REFERENCES `Portfolio-AndresPerez`.`Foto` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Educacion_has_Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Educacion_has_Foto` (
  `Educacion_idEducacion` INT NOT NULL,
  `Educacion_Persona_idPersona` INT NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`Educacion_idEducacion`, `Educacion_Persona_idPersona`, `Foto_idFoto`),
  INDEX `fk_Educacion_has_Foto_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  INDEX `fk_Educacion_has_Foto_Educacion1_idx` (`Educacion_idEducacion` ASC, `Educacion_Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_has_Foto_Educacion1`
    FOREIGN KEY (`Educacion_idEducacion` , `Educacion_Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Educacion` (`idEducacion` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Educacion_has_Foto_Foto1`
    FOREIGN KEY (`Foto_idFoto`)
    REFERENCES `Portfolio-AndresPerez`.`Foto` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-AndresPerez`.`Proyectos_has_Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-AndresPerez`.`Proyectos_has_Foto` (
  `Proyectos_idProyectos` INT NOT NULL,
  `Proyectos_Persona_idPersona` INT NOT NULL,
  `Foto_idFoto` INT NOT NULL,
  PRIMARY KEY (`Proyectos_idProyectos`, `Proyectos_Persona_idPersona`, `Foto_idFoto`),
  INDEX `fk_Proyectos_has_Foto_Foto1_idx` (`Foto_idFoto` ASC) VISIBLE,
  INDEX `fk_Proyectos_has_Foto_Proyectos1_idx` (`Proyectos_idProyectos` ASC, `Proyectos_Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_has_Foto_Proyectos1`
    FOREIGN KEY (`Proyectos_idProyectos` , `Proyectos_Persona_idPersona`)
    REFERENCES `Portfolio-AndresPerez`.`Proyectos` (`idProyectos` , `Persona_idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyectos_has_Foto_Foto1`
    FOREIGN KEY (`Foto_idFoto`)
    REFERENCES `Portfolio-AndresPerez`.`Foto` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
