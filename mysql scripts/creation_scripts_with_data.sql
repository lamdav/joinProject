-- MySQL Script generated by MySQL Workbench
-- 04/19/16 19:04:20
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema JoinSchema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `JoinSchema` ;

-- -----------------------------------------------------
-- Schema JoinSchema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `JoinSchema` DEFAULT CHARACTER SET latin1 ;
USE `JoinSchema` ;

-- -----------------------------------------------------
-- Table `JoinSchema`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`User` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`User` (
  `UserID` INT(11) NOT NULL AUTO_INCREMENT,
  `TimeZone` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `UserID_UNIQUE` ON `JoinSchema`.`User` (`UserID` ASC);

CREATE UNIQUE INDEX `Email_UNIQUE` ON `JoinSchema`.`User` (`Email` ASC);

INSERT INTO `JoinSchema`.`User`
(`UserID`,
`TimeZone`,
`Password`,
`Email`)
VALUES
('1','Alaska Time','password!!','emailjunk1@spam.com'),
('2','Pacific Time','pass123123','emailjunk2@spam.com'),
('3','Alaska Time','dbpassword','emailjunk3@spam.com'),
('4','Central Time','supersecure','emailjunk4@spam.com'),
('5','Alaska Time','12345678','emailjunk5@spam.com'),
('6','Eastern Time','qwerty123','emailjunk6@spam.com'),
('7','Alaska Time','password','emailjunk7@spam.com'),
('8','Pacific Time','password12','emailjunk8@spam.com'),
('9','Eastern Time','password9909','emailjunk9@spam.com'),
('10','Eastern Time','passhello','emailjunk10@spam.com'),
('11','Pacific Time','helloWorld','emailjunk11@spam.com'),
('12','Eastern Time','iamagoodpass','emailjunk12@spam.com'),
('13','Central Time','lastpasssucks','emailjunk13@spam.com'),
('14','Pacific Time','mustmemorize','emailjunk14@spam.com'),
('15','Alaska Time','happiness','emailjunk15@spam.com'),
('16','Central Time','musicwins','emailjunk16@spam.com'),
('17','Alaska Time','DaveWillPlayLeague','emailjunk17@spam.com'),
('18','Central Time','tryndamere','emailjunk18@spam.com'),
('19','Alaska Time','password!123123','emailjunk19@spam.com'),
('20', 'Alaska Time', 'safepassword123', 'leagueoflegends@lamd.com');



-- -----------------------------------------------------
-- Table `JoinSchema`.`Available Hour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Available Hour` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Available Hour` (
  `HourID` INT(11) NOT NULL,
  `Day` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`HourID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `JoinSchema`.`Available Hour`
(`HourID`,
`Day`)
VALUES
('1','Sunday'),
('25','Monday'),
('49','Tuesday'),
('73','Wednesday'),
('97','Thursday'),
('121','Friday'),
('145','Saturday'),
('122','Friday'),
('146','Saturday'),
('147','Saturday'),
('148','Saturday'),
('123','Friday'),
('149','Saturday'),
('50','Tuesday'),
('150','Saturday'),
('124','Friday'),
('125','Friday'),
('151','Saturday'),
('152','Saturday'),
('26', 'Monday');
-- -----------------------------------------------------
-- Table `JoinSchema`.`Available`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Available` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Available` (
  `UserID` INT(11) NULL DEFAULT NULL,
  `HourID` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Available_User`
    FOREIGN KEY (`UserID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Available_Hour`
    FOREIGN KEY (`HourID`)
    REFERENCES `JoinSchema`.`Available Hour` (`HourID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `Available_User_idx` ON `JoinSchema`.`Available` (`UserID` ASC);

CREATE INDEX `Available_Hour_idx` ON `JoinSchema`.`Available` (`HourID` ASC);

INSERT INTO `JoinSchema`.`Available`
(`UserID`,
`HourID`)
VALUES
('1','1'),
('2','25'),
('3','49'),
('4','73'),
('5','97'),
('6','121'),
('7','145'),
('8','122'),
('9','146'),
('10','147'),
('11','148'),
('12','123'),
('13','149'),
('14','50'),
('15','150'),
('16','124'),
('17','125'),
('18','151'),
('19','152'),
('20', '26');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Message` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Message` (
  `MessageID` INT(10) NOT NULL AUTO_INCREMENT,
  `TimeStamp` VARCHAR(45) NULL DEFAULT NULL,
  `Contents` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`MessageID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `MessageID_UNIQUE` ON `JoinSchema`.`Message` (`MessageID` ASC);

INSERT INTO `JoinSchema`.`Message`
(`MessageID`,
`TimeStamp`,
`Contents`)
VALUES
('1','1', 'hello'),
('2','25', 'goodbye'),
('3','49', 'wow'),
('4','73', 'I'),
('5','97', 'LOVE'),
('6','121', 'LEAGUE'),
('7','145', 'OF'),
('8','122', 'LEGENDS'),
('9','146', 'PLZ'),
('10','147', 'PLAY'),
('11','148', 'LEAGUE'),
('12','123', 'So bored'),
('13','149', 'tedious'),
('14','50', 'why'),
('15','150', 'can''t'),
('16','124', 'I'),
('17','125', 'Speed'),
('18','151', 'up'),
('19','152', 'life'),
('20', '26', 'seriously');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Comes From`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Comes From` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Comes From` (
  `UserID` INT(11) NULL DEFAULT NULL,
  `MessageID` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Comes_From_User_FK`
    FOREIGN KEY (`UserID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Comes_From_Message_FK`
    FOREIGN KEY (`MessageID`)
    REFERENCES `JoinSchema`.`Message` (`MessageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `Comes_From_User_idx` ON `JoinSchema`.`Comes From` (`UserID` ASC);

CREATE INDEX `Comes_From_Message_FK_idx` ON `JoinSchema`.`Comes From` (`MessageID` ASC);

INSERT INTO `JoinSchema`.`Comes From`
(`UserID`,
`MessageID`)
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20', '20');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Game` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Game` (
  `GameID` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NULL DEFAULT NULL,
  `Price` VARCHAR(45) NULL DEFAULT NULL,
  `Rating` VARCHAR(45) NULL DEFAULT NULL,
  `Platform` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`GameID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `GameID_UNIQUE` ON `JoinSchema`.`Game` (`GameID` ASC);

INSERT INTO `JoinSchema`.`Game`
(`GameID`,
`Title`,
`Price`,
`Rating`,
`Platform`)
VALUES
('1','game1', '1', 'E', 'PC'),
('2','game2', '2', 'M', 'PC'),
('3','game3', '3', 'E', 'PC'),
('4','game4', '4', 'M', 'PC'),
('5','game5', '5', 'E', 'PC'),
('6','game6', '6', 'M', 'PC'),
('7','game7', '7', 'E', 'PC'),
('8','game8', '8', 'M', 'PC'),
('9','game9', '9', 'E', 'PC'),
('10','game10', '10', 'M', 'PC'),
('11','game11', '11', 'E', 'PC'),
('12','game12', '12', 'M', 'PC'),
('13','game13', '13', 'E', 'PC'),
('14','game14', '14', 'M', 'PC'),
('15','game15', '15', 'E', 'PC'),
('16','game16', '16', 'M', 'PC'),
('17','game17', '17', 'E', 'PC'),
('18','game18', '18', 'M', 'PC'),
('19','game19', '19', 'E', 'PC'),
('20', 'game20', '20', 'M', 'PC');

-- -----------------------------------------------------
-- Table `JoinSchema`.`Gaming Accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Gaming Accounts` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Gaming Accounts` (
  `GameAccountID` INT(11) NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`GameAccountID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `GameAccountID_UNIQUE` ON `JoinSchema`.`Gaming Accounts` (`GameAccountID` ASC);

CREATE UNIQUE INDEX `UserName_UNIQUE` ON `JoinSchema`.`Gaming Accounts` (`UserName` ASC);

INSERT INTO `JoinSchema`.`Gaming Accounts`
(`GameAccountID`,
`UserName`,
`Type`)
VALUES
('1','user1', 'Curse'),
('2','user2', 'Curse'),
('3','user3', 'Curse'),
('4','user4', 'Curse'),
('5','user5', 'Curse'),
('6','user6', 'Curse'),
('7','user7', 'Curse'),
('8','user8', 'Curse'),
('9','user9', 'Curse'),
('10','user10', 'Steam'),
('11','user11', 'Steam'),
('12','user12', 'Steam'),
('13','user13', 'Steam'),
('14','user14', 'Steam'),
('15','user15', 'Steam'),
('16','user16', 'Steam'),
('17','user17', 'Steam'),
('18','user18', 'Steam'),
('19','user19', 'Steam'),
('20', 'user20', 'Steam');

-- -----------------------------------------------------
-- Table `JoinSchema`.`Goes_To`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Goes_To` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Goes_To` (
  `UserID` INT(11) NULL DEFAULT NULL,
  `MessageID` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Goes_To_Message`
    FOREIGN KEY (`MessageID`)
    REFERENCES `JoinSchema`.`Message` (`MessageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Goes_To_User`
    FOREIGN KEY (`UserID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `Goes_To_User_idx` ON `JoinSchema`.`Goes_To` (`UserID` ASC);

CREATE INDEX `Goes_To_Message_idx` ON `JoinSchema`.`Goes_To` (`MessageID` ASC);

INSERT INTO `JoinSchema`.`Goes_To`
(`UserID`,
`MessageID`)
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20', '20');

-- -----------------------------------------------------
-- Table `JoinSchema`.`Preference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Preference` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Preference` (
  `PreferenceID` INT(10) NOT NULL AUTO_INCREMENT,
  `FavoriteGenre` VARCHAR(45) NULL DEFAULT NULL,
  `FavoritePlatform` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`PreferenceID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `PreferenceID_UNIQUE` ON `JoinSchema`.`Preference` (`PreferenceID` ASC);

INSERT INTO `JoinSchema`.`Preference`
(`PreferenceID`,
`FavoriteGenre`,
`FavoritePlatform`)
VALUES
('1','shooter', 'PC'),
('2','shooter', 'PC'),
('3','shooter', 'PC'),
('4','shooter', 'PC'),
('5','shooter', 'PC'),
('6','shooter', 'PC'),
('7','shooter', 'PC'),
('8','shooter', 'PC'),
('9','shooter', 'PC'),
('10','shooter', 'PC'),
('11','shooter', 'PC'),
('12','shooter', 'PC'),
('13','shooter', 'PC'),
('14','shooter', 'PC'),
('15','shooter', 'PC'),
('16','shooter', 'PC'),
('17','shooter', 'PC'),
('18','shooter', 'PC'),
('19','shooter', 'PC'),
('20', 'shooter', 'PC');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Has`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Has` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Has` (
  `PreferenceID` INT(11) NULL DEFAULT NULL,
  `UserID` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Has_Preference_FK`
    FOREIGN KEY (`PreferenceID`)
    REFERENCES `JoinSchema`.`Preference` (`PreferenceID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Has_UserID_FK`
    FOREIGN KEY (`UserID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `Has_Preference_FK_idx` ON `JoinSchema`.`Has` (`PreferenceID` ASC);

CREATE INDEX `Has_UserID_FK_idx` ON `JoinSchema`.`Has` (`UserID` ASC);

INSERT INTO `JoinSchema`.`Has`
(`PreferenceID`,
`UserID`)
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20', '20');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Tag` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Tag` (
  `TagID` INT(11) NOT NULL AUTO_INCREMENT,
  `TagName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TagID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `TagID_UNIQUE` ON `JoinSchema`.`Tag` (`TagID` ASC);

INSERT INTO `JoinSchema`.`Tag`
(`TagID`,
`TagName`)
VALUES
('1','tag1'),
('2','tag2'),
('3','tag3'),
('4','tag4'),
('5','tag5'),
('6','tag6'),
('7','tag7'),
('8','tag8'),
('9','tag9'),
('10','tag10'),
('11','tag11'),
('12','tag12'),
('13','tag13'),
('14','tag14'),
('15','tag15'),
('16','tag16'),
('17','tag17'),
('18','tag18'),
('19','tag19'),
('20', 'tag20');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Have`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Have` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Have` (
  `GameID` INT(11) NULL DEFAULT NULL,
  `TagID` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Have_Game_FK`
    FOREIGN KEY (`GameID`)
    REFERENCES `JoinSchema`.`Game` (`GameID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Have_Tag_FK`
    FOREIGN KEY (`TagID`)
    REFERENCES `JoinSchema`.`Tag` (`TagID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `GameID_idx` ON `JoinSchema`.`Have` (`GameID` ASC);

CREATE INDEX `Have_Tag_FK_idx` ON `JoinSchema`.`Have` (`TagID` ASC);

INSERT INTO `JoinSchema`.`Have`
(`GameID`,
`TagID`)
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20', '20');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Owns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Owns` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Owns` (
  `GameID` INT(11) NULL DEFAULT NULL,
  `UserID` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Owns_Game_FK`
    FOREIGN KEY (`GameID`)
    REFERENCES `JoinSchema`.`Game` (`GameID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Owns_User_FK`
    FOREIGN KEY (`UserID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `Owns_Game_FK_idx` ON `JoinSchema`.`Owns` (`GameID` ASC);

CREATE INDEX `Owns_User_FK_idx` ON `JoinSchema`.`Owns` (`UserID` ASC);

INSERT INTO `JoinSchema`.`Owns`
(`GameID`,
`UserID`)
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20', '20');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Play As`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Play As` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Play As` (
  `UserID` INT(11) NULL DEFAULT NULL,
  `GameAccountID` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Play_As_GA_FK`
    FOREIGN KEY (`GameAccountID`)
    REFERENCES `JoinSchema`.`Game` (`GameID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Play_As_User_FK`
    FOREIGN KEY (`UserID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `Play_As_User_FK_idx` ON `JoinSchema`.`Play As` (`UserID` ASC);

CREATE INDEX `Play_As_GA_FK_idx` ON `JoinSchema`.`Play As` (`GameAccountID` ASC);

INSERT INTO `JoinSchema`.`Play As`
(`UserID`,
`GameAccountID`)
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20', '20');


-- -----------------------------------------------------
-- Table `JoinSchema`.`Rates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JoinSchema`.`Rates` ;

CREATE TABLE IF NOT EXISTS `JoinSchema`.`Rates` (
  `UserRateID` INT(11) NULL DEFAULT NULL,
  `UserRatedID` INT(11) NULL DEFAULT NULL,
  `SCORE` INT(11) NULL DEFAULT NULL,
  CONSTRAINT `Rates_User_FK2`
    FOREIGN KEY (`UserRatedID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Rates_User_FK1`
    FOREIGN KEY (`UserRateID`)
    REFERENCES `JoinSchema`.`User` (`UserID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `Rates_User_FK_idx` ON `JoinSchema`.`Rates` (`UserRateID` ASC);

CREATE INDEX `Rates_User_FK2_idx` ON `JoinSchema`.`Rates` (`UserRatedID` ASC);

INSERT INTO `JoinSchema`.`Rates`
(`UserRateID`,
`UserRatedID`,
`SCORE`)
VALUES
('1','2', '1'),
('2','3', '2'),
('3','4', '3'),
('4','5', '4'),
('5','6', '5'),
('6','7', '6'),
('7','8', '7'),
('8','9', '8'),
('9','10', '9'),
('10','11', '10'),
('11','12', '1'),
('12','13', '2'),
('13','14', '3'),
('14','15', '4'),
('15','16', '5'),
('16','17', '6'),
('17','18', '7'),
('18','19', '8'),
('19','20', '9'),
('20', '1', '10');

USE `JoinSchema`;

DELIMITER $$

USE `JoinSchema`$$
DROP TRIGGER IF EXISTS `JoinSchema`.`password_check` $$
USE `JoinSchema`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `JoinSchema`.`password_check`
BEFORE INSERT ON `JoinSchema`.`User`
FOR EACH ROW
BEGIN
	IF CHAR_LENGTH(New.Password) < 8 THEN 
    SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'A password must be at least 8 characters long';
	END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;