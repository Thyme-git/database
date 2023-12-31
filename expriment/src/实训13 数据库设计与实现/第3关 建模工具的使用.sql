# 请将利用MySQL Workbench软件的Modeling工具，经forward engineering 导出的创建schema的SQL语句完整粘到此处：
-- MySQL Script generated by MySQL Workbench
-- Thu May 19 17:05:16 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema rbac
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rbac` ;

-- -----------------------------------------------------
-- Schema rbac
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rbac` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
SHOW WARNINGS;
USE `rbac` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `aprole` (
  `RoleNo` INT NOT NULL COMMENT '角色编号',
  `RoleName` CHAR(20) NOT NULL COMMENT '角色名',
  `Comment` VARCHAR(50) NULL DEFAULT NULL COMMENT '角色描述',
  `Status` SMALLINT NULL DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`RoleNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '角色表';

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `apuser` (
  `UserID` CHAR(8) NOT NULL COMMENT '用户工号',
  `UserName` CHAR(8) NULL DEFAULT NULL COMMENT '用户姓名',
  `Comment` VARCHAR(50) NULL DEFAULT NULL COMMENT '用户描述',
  `PassWord` CHAR(32) NULL DEFAULT NULL COMMENT '口令',
  `Status` SMALLINT NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '用户表';

SHOW WARNINGS;
CREATE UNIQUE INDEX `ind_username` ON `apuser` (`UserName` ASC) VISIBLE;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `apgroup` (
  `UserID` CHAR(8) NOT NULL COMMENT '用户编号',
  `RoleNo` INT NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`UserID`, `RoleNo`),
  CONSTRAINT `FK_apGroup_apRole`
    FOREIGN KEY (`RoleNo`)
    REFERENCES `aprole` (`RoleNo`),
  CONSTRAINT `FK_apGroup_apUser`
    FOREIGN KEY (`UserID`)
    REFERENCES `apuser` (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '角色分配表';

SHOW WARNINGS;
CREATE INDEX `FK_apGroup_apRole` ON `apgroup` (`RoleNo` ASC) VISIBLE;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `apmodule` (
  `ModNo` BIGINT NOT NULL COMMENT '模块编号',
  `ModID` CHAR(10) NULL DEFAULT NULL COMMENT '系统或模块的代码',
  `ModName` CHAR(20) NULL DEFAULT NULL COMMENT '系统或模块的名称',
  PRIMARY KEY (`ModNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '功能模块登记表';

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `apright` (
  `RoleNo` INT NOT NULL COMMENT '角色编号',
  `ModNo` BIGINT NOT NULL COMMENT '模块编号',
  PRIMARY KEY (`RoleNo`, `ModNo`),
  CONSTRAINT `FK_apRight_apModule`
    FOREIGN KEY (`ModNo`)
    REFERENCES `apmodule` (`ModNo`),
  CONSTRAINT `FK_apRight_apRole`
    FOREIGN KEY (`RoleNo`)
    REFERENCES `aprole` (`RoleNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '角色权限表';

SHOW WARNINGS;
CREATE INDEX `FK_apRight_apModule` ON `apright` (`ModNo` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;