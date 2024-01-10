-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: colegio
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` varchar(255) NOT NULL,
  `curso` enum('1','2','3','4','5','6') DEFAULT NULL,
  `nivel` enum('INICIAL','PRIMARIA','SECUNDARIA') DEFAULT NULL,
  `paralelo` enum('A','B','C','D') DEFAULT NULL,
  `ano` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante_aspectosocioeconomicos`
--

DROP TABLE IF EXISTS `estudiante_aspectosocioeconomicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante_aspectosocioeconomicos` (
  `id` varchar(255) NOT NULL,
  `id_estudiante` varchar(255) DEFAULT NULL,
  `puebloOriginario` enum('aymara','quechua') DEFAULT NULL,
  `idiomas` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `estudiante_aspectosocioeconomicos_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante_aspectosocioeconomicos`
--

LOCK TABLES `estudiante_aspectosocioeconomicos` WRITE;
/*!40000 ALTER TABLE `estudiante_aspectosocioeconomicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante_aspectosocioeconomicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante_descuentos`
--

DROP TABLE IF EXISTS `estudiante_descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante_descuentos` (
  `id` varchar(255) NOT NULL,
  `id_estudiante_pago` varchar(255) DEFAULT NULL,
  `tipoDescuento` enum('tercerHermano','estudio') DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante_pago` (`id_estudiante_pago`),
  CONSTRAINT `estudiante_descuentos_ibfk_1` FOREIGN KEY (`id_estudiante_pago`) REFERENCES `estudiante_pagos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante_descuentos`
--

LOCK TABLES `estudiante_descuentos` WRITE;
/*!40000 ALTER TABLE `estudiante_descuentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante_descuentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante_direccions`
--

DROP TABLE IF EXISTS `estudiante_direccions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante_direccions` (
  `id` varchar(255) NOT NULL,
  `id_estudiante` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `Municipio` varchar(255) DEFAULT NULL,
  `Localidad` varchar(255) DEFAULT NULL,
  `Zona` varchar(255) DEFAULT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `Vivienda` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `estudiante_direccions_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante_direccions`
--

LOCK TABLES `estudiante_direccions` WRITE;
/*!40000 ALTER TABLE `estudiante_direccions` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante_direccions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante_discapacidads`
--

DROP TABLE IF EXISTS `estudiante_discapacidads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante_discapacidads` (
  `id` varchar(255) NOT NULL,
  `id_rude` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `discapacidadTipo` varchar(255) DEFAULT NULL,
  `discapacidadGrado` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rude` (`id_rude`),
  CONSTRAINT `estudiante_discapacidads_ibfk_1` FOREIGN KEY (`id_rude`) REFERENCES `rudes` (`cod_rude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante_discapacidads`
--

LOCK TABLES `estudiante_discapacidads` WRITE;
/*!40000 ALTER TABLE `estudiante_discapacidads` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante_discapacidads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante_inscripcions`
--

DROP TABLE IF EXISTS `estudiante_inscripcions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante_inscripcions` (
  `id` varchar(255) NOT NULL,
  `cod_rude` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cod_rude` (`cod_rude`),
  CONSTRAINT `estudiante_inscripcions_ibfk_1` FOREIGN KEY (`cod_rude`) REFERENCES `estudiantes` (`cod_rude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante_inscripcions`
--

LOCK TABLES `estudiante_inscripcions` WRITE;
/*!40000 ALTER TABLE `estudiante_inscripcions` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante_inscripcions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante_pagos`
--

DROP TABLE IF EXISTS `estudiante_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante_pagos` (
  `id` varchar(255) NOT NULL,
  `id_estudiante` varchar(255) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `referencia` enum('mensualidad','matricula') DEFAULT NULL,
  `mes` varchar(255) DEFAULT NULL,
  `gestion` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `estudiante_pagos_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante_pagos`
--

LOCK TABLES `estudiante_pagos` WRITE;
/*!40000 ALTER TABLE `estudiante_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id` varchar(255) NOT NULL,
  `cod_rude` varchar(255) DEFAULT NULL,
  `id_curso` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cod_rude` (`cod_rude`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`cod_rude`) REFERENCES `rudes` (`cod_rude`),
  CONSTRAINT `estudiantes_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion_unidad_procedencia`
--

DROP TABLE IF EXISTS `inscripcion_unidad_procedencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion_unidad_procedencia` (
  `id` varchar(255) NOT NULL,
  `id_unidad_educativa` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_unidad_educativa` (`id_unidad_educativa`),
  CONSTRAINT `inscripcion_unidad_procedencia_ibfk_1` FOREIGN KEY (`id_unidad_educativa`) REFERENCES `unidad_educativas` (`cod_sie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion_unidad_procedencia`
--

LOCK TABLES `inscripcion_unidad_procedencia` WRITE;
/*!40000 ALTER TABLE `inscripcion_unidad_procedencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcion_unidad_procedencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_campos`
--

DROP TABLE IF EXISTS `materia_campos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_campos` (
  `id` varchar(255) NOT NULL,
  `id_curso` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `materia_campos_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_campos`
--

LOCK TABLES `materia_campos` WRITE;
/*!40000 ALTER TABLE `materia_campos` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia_campos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_detalles`
--

DROP TABLE IF EXISTS `materia_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_detalles` (
  `id` varchar(255) NOT NULL,
  `id_campo` varchar(255) DEFAULT NULL,
  `id_profesor` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_campo` (`id_campo`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `materia_detalles_ibfk_1` FOREIGN KEY (`id_campo`) REFERENCES `materia_campos` (`id`),
  CONSTRAINT `materia_detalles_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_detalles`
--

LOCK TABLES `materia_detalles` WRITE;
/*!40000 ALTER TABLE `materia_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` varchar(255) NOT NULL,
  `ci` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidoPaterno` varchar(255) DEFAULT NULL,
  `apellidoMaterno` varchar(255) DEFAULT NULL,
  `nombreCompleto` varchar(255) DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `fechaNac` datetime DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesors`
--

DROP TABLE IF EXISTS `profesors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesors` (
  `id` varchar(255) NOT NULL,
  `rda` varchar(255) DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `id_persona` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `profesors_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesors`
--

LOCK TABLES `profesors` WRITE;
/*!40000 ALTER TABLE `profesors` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rudes`
--

DROP TABLE IF EXISTS `rudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rudes` (
  `cod_rude` varchar(255) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidoPaterno` varchar(255) DEFAULT NULL,
  `apellidoMaterno` varchar(255) DEFAULT NULL,
  `nombreCompleto` varchar(255) DEFAULT NULL,
  `nacimientoPais` varchar(255) DEFAULT NULL,
  `nacimientoProvincia` varchar(255) DEFAULT NULL,
  `nacimientoDepto` varchar(255) DEFAULT NULL,
  `nacimientoLocalidad` varchar(255) DEFAULT NULL,
  `certificadoNacimientoOficialia` varchar(255) DEFAULT NULL,
  `certificadoNacimientoLibro` varchar(255) DEFAULT NULL,
  `certificadoNacimientoFolio` varchar(255) DEFAULT NULL,
  `nacimientoDia` int DEFAULT NULL,
  `nacimientoMes` int DEFAULT NULL,
  `nacimientoAno` int DEFAULT NULL,
  `identificacionNumero` int DEFAULT NULL,
  `identificacionComplemento` varchar(255) DEFAULT NULL,
  `identificacionExpedido` varchar(255) DEFAULT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`cod_rude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rudes`
--

LOCK TABLES `rudes` WRITE;
/*!40000 ALTER TABLE `rudes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario_profesor_descuendos`
--

DROP TABLE IF EXISTS `salario_profesor_descuendos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario_profesor_descuendos` (
  `id` varchar(255) NOT NULL,
  `id_salario_profesor` varchar(255) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `motivoDescuento` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_salario_profesor` (`id_salario_profesor`),
  CONSTRAINT `salario_profesor_descuendos_ibfk_1` FOREIGN KEY (`id_salario_profesor`) REFERENCES `salario_profesors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario_profesor_descuendos`
--

LOCK TABLES `salario_profesor_descuendos` WRITE;
/*!40000 ALTER TABLE `salario_profesor_descuendos` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario_profesor_descuendos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario_profesors`
--

DROP TABLE IF EXISTS `salario_profesors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario_profesors` (
  `id` varchar(255) NOT NULL,
  `id_profesor` varchar(255) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `salario_profesors_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario_profesors`
--

LOCK TABLES `salario_profesors` WRITE;
/*!40000 ALTER TABLE `salario_profesors` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario_profesors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutors` (
  `id` varchar(255) NOT NULL,
  `id_estudiante` varchar(255) DEFAULT NULL,
  `parentesco` enum('padre','madre','tio','tia','abuelo','abuela','otro familiar') DEFAULT NULL,
  `idioma` enum('ingles','castellano','español','aymara','quechua') DEFAULT NULL,
  `ocupacion` varchar(255) DEFAULT NULL,
  `gradoInstruccion` enum('primaria','secundaria','bachiller','licenciatura','diplomado','especialidad','maestria','doctorado') DEFAULT NULL,
  `id_persona` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `tutors_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`),
  CONSTRAINT `tutors_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_educativas`
--

DROP TABLE IF EXISTS `unidad_educativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_educativas` (
  `cod_sie` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` enum('PRIVADO','FISCAL','CONVENIO') DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `distrito` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`cod_sie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_educativas`
--

LOCK TABLES `unidad_educativas` WRITE;
/*!40000 ALTER TABLE `unidad_educativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_educativas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09 18:39:34
