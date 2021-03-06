-- MySQL Script generated by MySQL Workbench
-- 04/16/17 00:05:59
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema focus_db
-- -----------------------------------------------------
-- Database for CSC401 final Project from ERD

-- -----------------------------------------------------
-- Schema focus_db
--
-- Database for CSC401 final Project from ERD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `focus_db` DEFAULT CHARACTER SET utf8 ;
USE `focus_db` ;

-- -----------------------------------------------------
-- Table `focus_db`.`logininfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`logininfo` (
  `id` VARCHAR(20) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  `role` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`gurdian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`gurdian` (
  `gur_id` VARCHAR(20) NOT NULL,
  `gur_fname` VARCHAR(45) NOT NULL,
  `gur_lname` VARCHAR(45) NOT NULL,
  `gur_email` VARCHAR(45) NOT NULL,
  `gur_phone` VARCHAR(45) NOT NULL,
  `gur_gender` VARCHAR(45) NOT NULL,
  `gurdiancol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gur_id`),
  UNIQUE INDEX `gur_id_UNIQUE` (`gur_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`school`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`school` (
  `sc_name` VARCHAR(45) NOT NULL,
  `sc_dept_no` INT NOT NULL,
  PRIMARY KEY (`sc_name`),
  UNIQUE INDEX `sc_name_UNIQUE` (`sc_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`departmet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`departmet` (
  `dept_name` VARCHAR(45) NOT NULL,
  `dept_faculties_no` INT NOT NULL,
  `sc_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dept_name`, `sc_name`),
  UNIQUE INDEX `dept_name_UNIQUE` (`dept_name` ASC),
  INDEX `fk_departmet_school1_idx` (`sc_name` ASC),
  CONSTRAINT `fk_departmet_school1`
    FOREIGN KEY (`sc_name`)
    REFERENCES `focus_db`.`school` (`sc_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`faculty` (
  `fa_id` VARCHAR(20) NOT NULL,
  `fa_fname` VARCHAR(45) NOT NULL,
  `fa_lname` VARCHAR(45) NOT NULL,
  `fa_room` VARCHAR(45) NOT NULL,
  `fa_address` MEDIUMTEXT NOT NULL,
  `fa_email` VARCHAR(45) NOT NULL,
  `fa_phone` VARCHAR(45) NOT NULL,
  `fa_gender` VARCHAR(45) NOT NULL,
  `fa_blood` VARCHAR(45) NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  `sc_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fa_id`, `dept_name`, `sc_name`),
  UNIQUE INDEX `fa_id_UNIQUE` (`fa_id` ASC),
  INDEX `fk_faculty_departmet1_idx` (`dept_name` ASC, `sc_name` ASC),
  CONSTRAINT `fk_faculty_departmet1`
    FOREIGN KEY (`dept_name` , `sc_name`)
    REFERENCES `focus_db`.`departmet` (`dept_name` , `sc_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`admission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`admission` (
  `adm_id` INT NOT NULL AUTO_INCREMENT,
  `adm_semester` VARCHAR(45) NULL,
  `adm_year` VARCHAR(45) NULL,
  `adm_cutoff` VARCHAR(45) NULL,
  `adm_total_marks` VARCHAR(45) NULL,
  PRIMARY KEY (`adm_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`student` (
  `stu_id` VARCHAR(20) NOT NULL,
  `stu_fname` VARCHAR(45) NOT NULL,
  `stu_lname` VARCHAR(45) NOT NULL,
  `stu_fa_name` VARCHAR(45) NOT NULL,
  `stu_mo_name` VARCHAR(45) NOT NULL,
  `stu_address` MEDIUMTEXT NOT NULL,
  `stu_gender` VARCHAR(45) NOT NULL,
  `stu_phone` VARCHAR(45) NOT NULL,
  `stu_email` VARCHAR(45) NOT NULL,
  `stu_blood` VARCHAR(45) NOT NULL,
  `stu_major` VARCHAR(45) NOT NULL,
  `stu_minor` VARCHAR(45) NOT NULL,
  `stu_cgpa` DECIMAL(2) NOT NULL DEFAULT 0.00,
  `stu_credit` VARCHAR(45) NOT NULL,
  `gur_id` VARCHAR(20) NOT NULL,
  `faculty_fa_id` VARCHAR(20) NOT NULL,
  `faculty_dept_name` VARCHAR(45) NOT NULL,
  `faculty_sc_name` VARCHAR(45) NOT NULL,
  `adm_id` INT NOT NULL,
  PRIMARY KEY (`stu_id`, `gur_id`, `faculty_fa_id`, `faculty_dept_name`, `faculty_sc_name`, `adm_id`),
  UNIQUE INDEX `stu_id_UNIQUE` (`stu_id` ASC),
  INDEX `fk_student_gurdian_idx` (`gur_id` ASC),
  INDEX `fk_student_faculty1_idx` (`faculty_fa_id` ASC, `faculty_dept_name` ASC, `faculty_sc_name` ASC),
  INDEX `fk_student_admission1_idx` (`adm_id` ASC),
  CONSTRAINT `fk_student_gurdian`
    FOREIGN KEY (`gur_id`)
    REFERENCES `focus_db`.`gurdian` (`gur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_faculty1`
    FOREIGN KEY (`faculty_fa_id` , `faculty_dept_name` , `faculty_sc_name`)
    REFERENCES `focus_db`.`faculty` (`fa_id` , `dept_name` , `sc_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_admission1`
    FOREIGN KEY (`adm_id`)
    REFERENCES `focus_db`.`admission` (`adm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`enrollment` (
  `enroll_id` VARCHAR(20) NOT NULL,
  `enroll_semester` VARCHAR(45) NOT NULL,
  `enroll_grade` VARCHAR(45) NULL,
  PRIMARY KEY (`enroll_id`),
  UNIQUE INDEX `enroll_id_UNIQUE` (`enroll_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`student_has_enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`student_has_enrollment` (
  `stu_id` VARCHAR(20) NOT NULL,
  `enroll_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`stu_id`, `enroll_id`),
  INDEX `fk_student_has_enrollment_enrollment1_idx` (`enroll_id` ASC),
  INDEX `fk_student_has_enrollment_student1_idx` (`stu_id` ASC),
  CONSTRAINT `fk_student_has_enrollment_student1`
    FOREIGN KEY (`stu_id`)
    REFERENCES `focus_db`.`student` (`stu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_enrollment_enrollment1`
    FOREIGN KEY (`enroll_id`)
    REFERENCES `focus_db`.`enrollment` (`enroll_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`course` (
  `c_id` VARCHAR(10) NOT NULL,
  `c_name` VARCHAR(45) NOT NULL,
  `c_credit` VARCHAR(45) NOT NULL,
  `c_prereq` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`c_id`, `dept_name`),
  UNIQUE INDEX `c_id_UNIQUE` (`c_id` ASC),
  INDEX `fk_course_departmet1_idx` (`dept_name` ASC),
  CONSTRAINT `fk_course_departmet1`
    FOREIGN KEY (`dept_name`)
    REFERENCES `focus_db`.`departmet` (`dept_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`timeslot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`timeslot` (
  `time_id` INT NOT NULL AUTO_INCREMENT,
  `time_start_time` VARCHAR(45) NULL,
  `time_end_time` VARCHAR(45) NULL,
  PRIMARY KEY (`time_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`room` (
  `room_no` VARCHAR(10) NOT NULL,
  `room_capacity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`room_no`),
  UNIQUE INDEX `room_no_UNIQUE` (`room_no` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`section` (
  `sec_id` INT NOT NULL AUTO_INCREMENT,
  `sec_no` VARCHAR(45) NOT NULL,
  `sec_capacity` VARCHAR(45) NOT NULL,
  `enroll_id` VARCHAR(20) NOT NULL,
  `c_id` VARCHAR(10) NOT NULL,
  `time_id` INT NOT NULL,
  `room_no` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`sec_id`, `enroll_id`, `c_id`, `time_id`, `room_no`),
  INDEX `fk_section_enrollment1_idx` (`enroll_id` ASC),
  INDEX `fk_section_course1_idx` (`c_id` ASC),
  INDEX `fk_section_timeslot1_idx` (`time_id` ASC),
  INDEX `fk_section_room1_idx` (`room_no` ASC),
  CONSTRAINT `fk_section_enrollment1`
    FOREIGN KEY (`enroll_id`)
    REFERENCES `focus_db`.`enrollment` (`enroll_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`c_id`)
    REFERENCES `focus_db`.`course` (`c_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_timeslot1`
    FOREIGN KEY (`time_id`)
    REFERENCES `focus_db`.`timeslot` (`time_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_room1`
    FOREIGN KEY (`room_no`)
    REFERENCES `focus_db`.`room` (`room_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`scholarship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`scholarship` (
  `sch_id` INT NOT NULL AUTO_INCREMENT,
  `sch_type` VARCHAR(45) NOT NULL,
  `sch_gurantor_fname` VARCHAR(45) NOT NULL,
  `sch_gurantor_lname` VARCHAR(45) NOT NULL,
  `parcentage` VARCHAR(45) NOT NULL,
  `stu_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`sch_id`, `stu_id`),
  INDEX `fk_scholarship_student1_idx` (`stu_id` ASC),
  CONSTRAINT `fk_scholarship_student1`
    FOREIGN KEY (`stu_id`)
    REFERENCES `focus_db`.`student` (`stu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`candidate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`candidate` (
  `can_id` INT NOT NULL AUTO_INCREMENT,
  `can_fname` VARCHAR(45) NOT NULL,
  `can_lame` VARCHAR(45) NOT NULL,
  `can_father` VARCHAR(45) NOT NULL,
  `can_mother` VARCHAR(45) NOT NULL,
  `can_gender` VARCHAR(45) NOT NULL,
  `cab_blood` VARCHAR(45) NOT NULL,
  `can_high` VARCHAR(45) NOT NULL,
  `can_college` VARCHAR(45) NOT NULL,
  `can_ssc` VARCHAR(45) NOT NULL,
  `can_hsc` VARCHAR(45) NOT NULL,
  `can_ssc_year` VARCHAR(45) NOT NULL,
  `can_hsc_year` VARCHAR(45) NOT NULL,
  `can_major` VARCHAR(45) NOT NULL,
  `can_minor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`can_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focus_db`.`candidate_has_admission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `focus_db`.`candidate_has_admission` (
  `can_id` INT NOT NULL,
  `adm_id` INT NOT NULL,
  `gained_marks` VARCHAR(45) NULL,
  PRIMARY KEY (`can_id`, `adm_id`),
  INDEX `fk_candidate_has_admission_admission1_idx` (`adm_id` ASC),
  INDEX `fk_candidate_has_admission_candidate1_idx` (`can_id` ASC),
  CONSTRAINT `fk_candidate_has_admission_candidate1`
    FOREIGN KEY (`can_id`)
    REFERENCES `focus_db`.`candidate` (`can_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidate_has_admission_admission1`
    FOREIGN KEY (`adm_id`)
    REFERENCES `focus_db`.`admission` (`adm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
