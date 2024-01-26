




















DROP TABLE IF EXISTS `cursos`;


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






LOCK TABLES `cursos` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `estudiante_aspectosocioeconomicos`;


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






LOCK TABLES `estudiante_aspectosocioeconomicos` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `estudiante_descuentos`;


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






LOCK TABLES `estudiante_descuentos` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `estudiante_direccions`;


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






LOCK TABLES `estudiante_direccions` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `estudiante_discapacidads`;


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






LOCK TABLES `estudiante_discapacidads` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `estudiante_inscripcions`;


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






LOCK TABLES `estudiante_inscripcions` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `estudiante_pagos`;


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






LOCK TABLES `estudiante_pagos` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `estudiantes`;


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






LOCK TABLES `estudiantes` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `inscripcion_unidad_procedencia`;


CREATE TABLE `inscripcion_unidad_procedencia` (
  `id` varchar(255) NOT NULL,
  `id_unidad_educativa` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_unidad_educativa` (`id_unidad_educativa`),
  CONSTRAINT `inscripcion_unidad_procedencia_ibfk_1` FOREIGN KEY (`id_unidad_educativa`) REFERENCES `unidad_educativas` (`cod_sie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






LOCK TABLES `inscripcion_unidad_procedencia` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `materia_campos`;


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






LOCK TABLES `materia_campos` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `materia_detalles`;


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






LOCK TABLES `materia_detalles` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `personas`;


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






LOCK TABLES `personas` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `profesors`;


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






LOCK TABLES `profesors` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `rudes`;


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






LOCK TABLES `rudes` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `salario_profesor_descuendos`;


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






LOCK TABLES `salario_profesor_descuendos` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `salario_profesors`;


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






LOCK TABLES `salario_profesors` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `tutors`;


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






LOCK TABLES `tutors` WRITE;


UNLOCK TABLES;





DROP TABLE IF EXISTS `unidad_educativas`;


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






LOCK TABLES `unidad_educativas` WRITE;


UNLOCK TABLES;











