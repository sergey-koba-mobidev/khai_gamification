CREATE DATABASE  IF NOT EXISTS `gamestudy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gamestudy`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: gamestudy
-- ------------------------------------------------------
-- Server version	5.6.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(45) NOT NULL COMMENT 'суть достижения',
  `type` varchar(1) NOT NULL COMMENT 'тип достижения: p-положительное, n-негативное, m-(middle) нейтральное',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL COMMENT 'описание',
  `image` varchar(30) NOT NULL COMMENT 'изображение бейджа',
  `category_id` int(11) NOT NULL COMMENT 'к какой категории относится бейдж',
  `value` float DEFAULT NULL COMMENT 'сколько баллов приносит',
  `discipline_id` int(11) DEFAULT NULL COMMENT 'к какой дисциплине добавляются баллы',
  PRIMARY KEY (`id`),
  KEY `discipline_id_idx` (`discipline_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `discipline_id4` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'название категории бейджев "учеба", "спорт", "досуг"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_discipline`
--

DROP TABLE IF EXISTS `comment_discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `discipline_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id_idx` (`comment_id`),
  KEY `discipline_id_idx` (`discipline_id`),
  CONSTRAINT `comment_id2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discipline_id5` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_discipline`
--

LOCK TABLES `comment_discipline` WRITE;
/*!40000 ALTER TABLE `comment_discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_student`
--

DROP TABLE IF EXISTS `comment_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id_idx` (`comment_id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_id4` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_student`
--

LOCK TABLES `comment_student` WRITE;
/*!40000 ALTER TABLE `comment_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_teacher`
--

DROP TABLE IF EXISTS `comment_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id_idx` (`comment_id`),
  KEY `teacher_id_idx` (`teacher_id`),
  CONSTRAINT `comment_id3` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_id2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_teacher`
--

LOCK TABLES `comment_teacher` WRITE;
/*!40000 ALTER TABLE `comment_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL COMMENT 'содержание комментария',
  `time` datetime NOT NULL COMMENT 'время отправления комментария',
  `checked` tinyint(1) NOT NULL COMMENT 'проверен коммент или нет',
  `from_student_id` int(11) DEFAULT NULL COMMENT 'комент написан студентом',
  `from_teacher_id` int(11) DEFAULT NULL COMMENT 'комент написан преподавателем',
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`from_student_id`),
  KEY `teacher_id_idx` (`from_teacher_id`),
  CONSTRAINT `from_student_id` FOREIGN KEY (`from_student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `from_teacher_id` FOREIGN KEY (`from_teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `university_id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `university_id_idx` (`university_id`),
  CONSTRAINT `university_id3` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'k105(108)');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discipline_student`
--

DROP TABLE IF EXISTS `discipline_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discipline_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_id` int(11) NOT NULL,
  `student_d` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discipline_id_idx` (`discipline_id`),
  KEY `student_d_idx` (`student_d`),
  CONSTRAINT `discipline_id6` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_id5` FOREIGN KEY (`student_d`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline_student`
--

LOCK TABLES `discipline_student` WRITE;
/*!40000 ALTER TABLE `discipline_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `discipline_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplines`
--

DROP TABLE IF EXISTS `disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'Название предмета',
  `university_id` int(11) NOT NULL COMMENT 'в каком вузе преподается эта дисциплина',
  `photo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discipline_id_idx` (`university_id`),
  CONSTRAINT `university_id` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplines`
--

LOCK TABLES `disciplines` WRITE;
/*!40000 ALTER TABLE `disciplines` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discipline`
--

DROP TABLE IF EXISTS `group_discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT 'у какой группы',
  `discipline_id` int(11) NOT NULL COMMENT 'какой предмет',
  PRIMARY KEY (`id`),
  KEY `group_id_idx` (`group_id`),
  KEY `discipline_id_idx` (`discipline_id`),
  CONSTRAINT `group_id2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discipline_id3` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discipline`
--

LOCK TABLES `group_discipline` WRITE;
/*!40000 ALTER TABLE `group_discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'Название группы',
  `faculty` varchar(45) NOT NULL COMMENT 'факультет',
  `department_id` int(11) NOT NULL COMMENT 'кафедра',
  `rating` int(11) NOT NULL COMMENT 'рейтинг',
  PRIMARY KEY (`id`),
  KEY `department_id_idx` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'126ст','Самолетостроительный',1,994);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practices`
--

DROP TABLE IF EXISTS `practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_id` int(11) NOT NULL COMMENT 'По какому предмету лабораторная',
  `number` int(11) NOT NULL COMMENT 'Номер лабораторной',
  `theme` varchar(100) NOT NULL COMMENT 'Тема лабораторной',
  `knowledge` varchar(200) NOT NULL COMMENT 'Какие навыки приобретет студент выполнив лабу',
  `term` date DEFAULT NULL COMMENT 'крайний срок сдачи лабораторной ',
  PRIMARY KEY (`id`),
  KEY `discipline_id_idx` (`discipline_id`),
  CONSTRAINT `discipline_id` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practices`
--

LOCK TABLES `practices` WRITE;
/*!40000 ALTER TABLE `practices` DISABLE KEYS */;
/*!40000 ALTER TABLE `practices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_achievement`
--

DROP TABLE IF EXISTS `student_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT 'у какого студента',
  `achievement_id` int(11) NOT NULL COMMENT 'какое достижение',
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`student_id`),
  KEY `achievement_id_idx` (`achievement_id`),
  CONSTRAINT `student_id3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `achievement_id` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_achievement`
--

LOCK TABLES `student_achievement` WRITE;
/*!40000 ALTER TABLE `student_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_badge`
--

DROP TABLE IF EXISTS `student_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'какому студенту вручен бейдж',
  `student_id` int(11) NOT NULL COMMENT 'кому вручен бейдж',
  `badge_id` int(11) NOT NULL COMMENT 'какой бейдж',
  `date` date NOT NULL COMMENT 'дата вручения',
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`student_id`),
  KEY `badge_id_idx` (`badge_id`),
  CONSTRAINT `student_id2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `badge_id` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_badge`
--

LOCK TABLES `student_badge` WRITE;
/*!40000 ALTER TABLE `student_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_practice`
--

DROP TABLE IF EXISTS `student_practice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_practice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT 'кто выполнил лабораторную',
  `practice_id` int(11) NOT NULL COMMENT 'какую лабораторную выполнил',
  `mark` float NOT NULL COMMENT 'оценка',
  `date` date NOT NULL COMMENT 'дата сдачи лабораторной',
  `attend` tinyint(1) NOT NULL COMMENT 'присутствие студента на паре 1-был 0-энка',
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`student_id`),
  KEY `practice_id_idx` (`practice_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `practice_id` FOREIGN KEY (`practice_id`) REFERENCES `practices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_practice`
--

LOCK TABLES `student_practice` WRITE;
/*!40000 ALTER TABLE `student_practice` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_practice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT 'группа в которой учится студент',
  `name` varchar(60) NOT NULL COMMENT 'имя студента',
  `surname` varchar(60) NOT NULL COMMENT 'фамилия студента',
  `username` varchar(100) NOT NULL COMMENT 'логин',
  `password` varchar(100) NOT NULL COMMENT 'пароль',
  `rating` int(11) NOT NULL COMMENT 'рейтинг',
  `photo` varchar(30) NOT NULL COMMENT 'аватарка студента',
  `status` varchar(45) NOT NULL COMMENT 'завние(статус) студента "студент", "бакалавр", "магистр"',
  `year` int(11) NOT NULL COMMENT '(год обучения в вузе) (academic) year',
  `leader` tinyint(1) NOT NULL COMMENT 'староста',
  PRIMARY KEY (`id`),
  KEY `group_id_idx` (`group_id`),
  CONSTRAINT `group_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,1,'Мария','Воробьева','maryart','123456798',150,'/4.png','студент',3,0);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_discipline`
--

DROP TABLE IF EXISTS `teacher_discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT 'кто преподает',
  `discipline_id` int(11) NOT NULL COMMENT 'что преподает',
  PRIMARY KEY (`id`),
  KEY `teacher_id_idx` (`teacher_id`),
  KEY `discipline_id_idx` (`discipline_id`),
  CONSTRAINT `teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discipline_id2` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_discipline`
--

LOCK TABLES `teacher_discipline` WRITE;
/*!40000 ALTER TABLE `teacher_discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT 'Имя преподавателя',
  `surname` varchar(60) NOT NULL COMMENT 'Фамилия преподавателя',
  `academic_rank` varchar(100) NOT NULL COMMENT 'Ученое звание(ученая степень)',
  `university_id` int(11) NOT NULL COMMENT 'в каком вузе преподает ',
  `username` varchar(100) NOT NULL COMMENT 'логин',
  `password` varchar(100) NOT NULL COMMENT 'пароль',
  `photo` varchar(30) NOT NULL COMMENT 'аватарка преподавателя',
  PRIMARY KEY (`id`),
  KEY `university_id_idx` (`university_id`),
  CONSTRAINT `university_id2` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Сергей','Коба','аспирант',1,'desgnkiss','123456789','/avatar3.jpg');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) NOT NULL COMMENT 'Название университета',
  `address` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL COMMENT 'город в котором нахдится университет',
  `rating` int(11) NOT NULL COMMENT 'рейтинг',
  `username` varchar(100) NOT NULL COMMENT 'логин админа университета',
  `password` varchar(100) NOT NULL COMMENT 'пароль админа университета',
  `description` varchar(300) DEFAULT NULL COMMENT 'описание вуза',
  `photo` varchar(30) DEFAULT NULL COMMENT 'фото вуза',
  `site` varchar(45) DEFAULT NULL COMMENT 'сайт вуза',
  `telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,'Национальный аэрокосмический университет \"ХАИ\"','г. Харьков, ул. Чкалова, 17','Харьков',5000,'khayovnya','1234567890','Тут супер!','/photo1.jpg','www.khai.edu','+380 57 788 4696');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-11 22:07:59
