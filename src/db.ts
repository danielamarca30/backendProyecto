import { DataTypes, Sequelize } from "sequelize";
const DB_CONFIG = {
    username: process.env.dbUser || 'root',
    password: process.env.dbPassword || 'root',
    name: process.env.dbName || 'colegio'
};
export const sequelize = new Sequelize(
    `mysql://${DB_CONFIG.username}:${DB_CONFIG.password}@localhost:3306/${DB_CONFIG.name}`,
    {
        logging: false,
        pool: {
            max: 10,
            min: 0
        }
    }
);
await sequelize.authenticate();

export const UnidadEducativa = sequelize.define('unidad_educativa', {
    cod_sie: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    nombre: DataTypes.STRING,
    tipo: DataTypes.ENUM('PRIVADO', 'FISCAL', 'CONVENIO'),
    pais: DataTypes.STRING,
    departamento: DataTypes.STRING,
    localidad: DataTypes.STRING,
    distrito: DataTypes.STRING,
    direccion: DataTypes.STRING,
    telefono: DataTypes.STRING,
    nit: DataTypes.STRING
});
export const Rude = sequelize.define('rude', {
    cod_rude: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    nombres: DataTypes.STRING,
    apellidoPaterno: DataTypes.STRING,
    apellidoMaterno: DataTypes.STRING,
    nombreCompleto: DataTypes.STRING,
    nacimientoPais: DataTypes.STRING,
    nacimientoProvincia: DataTypes.STRING,
    nacimientoDepto: DataTypes.STRING,
    nacimientoLocalidad: DataTypes.STRING,
    certificadoNacimientoOficialia: DataTypes.STRING,
    certificadoNacimientoLibro: DataTypes.STRING,
    certificadoNacimientoFolio: DataTypes.STRING,
    nacimientoDia: DataTypes.INTEGER,
    nacimientoMes: DataTypes.INTEGER,
    nacimientoAno: DataTypes.INTEGER,
    identificacionNumero: DataTypes.INTEGER,
    identificacionComplemento: DataTypes.STRING,
    identificacionExpedido: DataTypes.STRING,
    sexo: DataTypes.ENUM('F', 'M'),
});
export const EstudianteDiscapacidad = sequelize.define('estudiante_discapacidad', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_rude: {
        type: DataTypes.STRING,
        references: {
            model: Rude,
            key: 'cod_rude'
        }
    },
    codigo: DataTypes.STRING,
    discapacidadTipo: DataTypes.STRING,
    discapacidadGrado: DataTypes.STRING
});
export const Curso = sequelize.define('curso', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    curso: DataTypes.ENUM('1', '2', '3', '4', '5', '6'),
    nivel: DataTypes.ENUM('INICIAL', 'PRIMARIA', 'SECUNDARIA'),
    paralelo: DataTypes.ENUM('A', 'B', 'C', 'D'),
    ano: DataTypes.FLOAT
});
export const MateriaCampo = sequelize.define('materia_campo', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_curso: {
        type: DataTypes.STRING,
        references: {
            model: Curso,
            key: 'id'
        }
    },
    area: DataTypes.STRING,
    ano: DataTypes.INTEGER
});
export const Persona = sequelize.define('persona', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    ci: DataTypes.STRING,
    nombre: DataTypes.STRING,
    apellidoPaterno: DataTypes.STRING,
    apellidoMaterno: DataTypes.STRING,
    nombreCompleto: DataTypes.STRING,
    sexo: DataTypes.ENUM('M', 'F'),
    fechaNac: DataTypes.DATE,
    telefono: DataTypes.STRING,
    email: DataTypes.STRING,
    direccion: DataTypes.STRING
});
export const Profesor = sequelize.define('profesor', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    rda: DataTypes.STRING,
    profesion: DataTypes.STRING,
    id_persona: {
        type: DataTypes.STRING,
        references: {
            model: Persona,
            key: 'id'
        }
    }
});
export const MateriaArea = sequelize.define('materia_detalle', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_campo: {
        type: DataTypes.STRING,
        references: {
            model: MateriaCampo,
            key: 'id'
        }
    },
    id_profesor: {
        type: DataTypes.STRING,
        references: {
            model: Profesor,
            key: 'id'
        }
    },
    nombre: DataTypes.STRING,
    ano: DataTypes.INTEGER
})
export const Estudiante = sequelize.define('estudiante', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    cod_rude: {
        type: DataTypes.STRING,
        references: {
            model: Rude,
            key: 'cod_rude'
        }
    },
    id_curso: {
        type: DataTypes.STRING,
        references: {
            model: Curso,
            key: 'id'
        }
    }
});

export const EstudianteInscripcion = sequelize.define('estudiante_inscripcion', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_estudiante: {
        type: DataTypes.STRING,
        references: {
            model: Estudiante,
            key: 'cod_rude'
        }
    },
    fecha: DataTypes.DATE,
    descripcion: DataTypes.STRING
});
export const UnidadProcedencia = sequelize.define('inscripcion_unidad_procedencia', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_estudiante_inscripcion: {
        type: DataTypes.STRING,
        references: {
            model: EstudianteInscripcion,
            key: 'id'
        }
    },
    id_unidad_educativa: {
        type: DataTypes.STRING,
        references: {
            model: UnidadEducativa,
            key: 'cod_sie',
        }
    }
});
export const EstudianteDireccion = sequelize.define('estudiante_direccion', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_estudiante: {
        type: DataTypes.STRING,
        references: {
            model: Estudiante,
            key: 'id'
        }
    },
    departamento: DataTypes.STRING,
    provincia: DataTypes.STRING,
    Municipio: DataTypes.STRING,
    Localidad: DataTypes.STRING,
    Zona: DataTypes.STRING,
    Calle: DataTypes.STRING,
    Vivienda: DataTypes.STRING
});
export const EstudianteAspectoSocioEconomico = sequelize.define('estudiante_aspectosocioeconomico', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_estudiante: {
        type: DataTypes.STRING,
        references: {
            model: Estudiante,
            key: 'id'
        }
    },
    puebloOriginario: DataTypes.ENUM('aymara', 'quechua'),
    idiomas: DataTypes.STRING
});


export const Tutor = sequelize.define('tutor', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_estudiante: {
        type: DataTypes.STRING,
        references: {
            model: Estudiante,
            key: 'id'
        }
    },
    parentesco: DataTypes.ENUM('padre', 'madre', 'tio', 'tia', 'abuelo', 'abuela', 'otro familiar'),
    idioma: DataTypes.ENUM('ingles', 'castellano', 'español', 'aymara', 'quechua'),
    ocupacion: DataTypes.STRING,
    gradoInstruccion: DataTypes.ENUM('primaria', 'secundaria', 'bachiller', 'licenciatura', 'diplomado', 'especialidad', 'maestria', 'doctorado'),
    id_persona: {
        type: DataTypes.STRING,
        references: {
            model: Persona,
            key: 'id'
        }
    }
});
export const EstudiantePago = sequelize.define('estudiante_pago', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_estudiante: {
        type: DataTypes.STRING,
        references: {
            model: Estudiante,
            key: 'id'
        }
    },
    monto: DataTypes.FLOAT,
    referencia: DataTypes.ENUM('mensualidad', 'matricula'),
    mes: DataTypes.INTEGER,
    gestion: DataTypes.INTEGER,
    fecha: DataTypes.DATE
});
export const EsudianteDescuento = sequelize.define('estudiante_descuento', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_estudiante_pago: {
        type: DataTypes.STRING,
        references: {
            model: EstudiantePago,
            key: 'id'
        }
    },
    tipoDescuento: DataTypes.ENUM('tercerHermano', 'estudio'),
    monto: DataTypes.FLOAT
});


export const SalarioProfesor = sequelize.define('salario_profesor', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_profesor: {
        type: DataTypes.STRING,
        references: {
            model: Profesor,
            key: 'id'
        }
    },
    monto: DataTypes.FLOAT,

});
export const SalarioDescuento = sequelize.define('salario_profesor_descuendo', {
    id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    id_salario_profesor: {
        type: DataTypes.STRING,
        references: {
            model: SalarioProfesor,
            key: 'id'
        }
    },
    monto: DataTypes.FLOAT,
    motivoDescuento: DataTypes.STRING,
});


// relaciones
Estudiante.hasMany(EstudianteInscripcion, {
    foreignKey: 'id_estudiante',
    onDelete: 'CASCADE'
});

Estudiante.hasMany(EstudianteDireccion, {
    foreignKey: 'id_estudiante',
    onDelete: 'CASCADE'
});
Estudiante.hasMany(EstudianteAspectoSocioEconomico, {
    foreignKey: 'id_estudiante',
    onDelete: 'CASCADE'
});
Estudiante.hasMany(EstudiantePago, {
    foreignKey: 'id_estudiante',
    onDelete: 'CASCADE'
});
Estudiante.hasMany(Tutor, {
    foreignKey: 'id_estudiante',
    onDelete: 'CASCADE'
});


Rude.hasMany(Estudiante, {
    foreignKey: 'cod_rude',
    onDelete: 'CASCADE'
});
Rude.hasMany(EstudianteDiscapacidad, {
    foreignKey: 'cod_rude',
    onDelete: 'CASCADE'
});


Curso.hasMany(Estudiante, {
    foreignKey: 'id_curso',
    onDelete: 'CASCADE'
});
Curso.hasMany(MateriaCampo, {
    foreignKey: 'id_curso',
    onDelete: 'CASCADE'
})

await sequelize.sync({ force: true });