import { t } from 'elysia';
import { Rude, Estudiante, Curso, sequelize, EstudianteInscripcion, EstudianteDireccion, EstudianteAspectoSocioEconomico, Tutor, EstudiantePago, EstudianteDiscapacidad, MateriaCampo } from '../../db';
import { schemaCurso } from '../Curso/servicio';
import { nanoid } from 'nanoid';
export const schemaTutor = t.Object({
    id_persona: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id_persona",
        title: "Id_Persona"
    })),
    id_estudiante: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id_estudiante",
        title: "Id_Estudiante"
    })),
    parentesco: t.Optional(t.String({
        default: "padre",
        description: "Unicamente: ['padre', 'madre', 'tio', 'tia', 'abuelo', 'abuela', 'otro familiar']",
        title: 'Parentezco'
    })),
    idioma: t.Optional(t.String({
        default: "castellano",
        description: "Unicamente: ['ingles', 'castellano', 'español', 'aymara', 'quechua']",
        title: 'Idioma'
    })),
    ocupacion: t.Optional(t.String({
        default: "agricultor",
        description: "Unicamente: ocupación del tutor",
        title: 'Ocupación'
    })),
    gradoInstruccion: t.Optional(t.String({
        default: "licenciatura",
        description: "Unicamente: ['primaria', 'secundaria', 'bachiller', 'licenciatura', 'diplomado', 'especialidad', 'maestria', 'doctorado']",
        title: 'gradoInstrucción'
    }))
});
export const schemaEstudiantePago = t.Object({
    id: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id",
        title: "Id"
    })),
    id_estudiante: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id_estudiante",
        title: "Id_estudiante"
    })),
    monto: t.Optional(t.Numeric({
        default: 200.3,
        description: "Unicamente: Monto en bolivianos",
        title: 'Monto de Pago'
    })),
    referencia: t.Optional(t.String({
        default: "mensualidad",
        description: "Unicamente: ['mensualidad','matricula']",
        title: 'Referencia de pago'
    })),
    mes: t.Optional(t.Numeric({
        default: 1,
        description: "Unicamente: [1,2,3,4,5,6,7,8,9,10,11,12]",
        title: 'Mes'
    })),
    gestion: t.Optional(t.Numeric({
        default: 2024,
        description: "Unicamente: [2023,2024,2025]",
        title: 'Año'
    })),
    fecha: t.Optional(t.Numeric({
        default: new Date(),
        description: "Unicamente: Fecha de pago",
        title: 'Fecha de pago'
    }))
});
export const schemaEstudianteInscripcion = t.Object({
    id: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id",
        title: "Id"
    })),
    id_estudiante: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id_estudiante",
        title: "Id_estudiante"
    })),
    fecha: t.Date({
        default: new Date(),
        description: "Unicamente: fecha",
        title: "fecha Inscripcion"
    }),
    descripcion: t.Optional(t.String({
        default: 'Deudas anteriores gestiones',
        description: "Unicamente: Texto",
        title: "Descripcion"
    }))
});
export const schemaEstudianteAspectoSocioEconomico = t.Object({
    id: t.Optional(t.String({
        default: "34_456asdfs4",
        description: "Unicamente: id",
        title: "Id"
    })),
    id_estudiante: t.Optional(t.String({
        default: "234_456asdfs4",
        description: "Unicamente: id_estudiante",
        title: "Id"
    })),
    puebloOriginario: t.Optional(t.String({
        default: "aymara",
        description: "Unicamente: ['aymara','quechua]",
        title: "Pueblo Originario"
    })),
    idiomas: t.Optional(t.String({
        default: "ingles,quechua,castellano",
        description: "Unicamente: Idiomas separados por comas",
        title: "Idiomas"
    }))
});
export const schemaEstudianteDireccion = t.Object({
    id: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id",
        title: "Id"
    })),
    id_estudiante: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id_estudiante",
        title: "Id"
    })),
    departamento: t.Optional(t.String({
        default: 'Oruro',
        description: "Unicamente: Departamento",
        title: "Departamento"
    })),
    provincia: t.Optional(t.String({
        default: 'Cercado',
        description: "Unicamente: Provincia",
        title: "Provincia"
    })),
    Municipio: t.Optional(t.String({
        default: 'Oruro',
        description: "Unicamente: Municipio",
        title: "Municipio"
    })),
    Localidad: t.Optional(t.String({
        default: 'Oruro',
        description: "Unicamente: Localidad",
        title: "Localidad"
    })),
    Zona: t.Optional(t.String({
        default: 'Norte',
        description: "Unicamente: Zona",
        title: "Zona"
    })),
    Calle: t.Optional(t.String({
        default: 'Calle 10, entre B y C',
        description: "Unicamente: Calle",
        title: "Calle"
    })),
    Vivienda: t.Optional(t.String({
        default: 'N2',
        description: "Unicamente: Numero de Vivienda",
        title: "Vivienda"
    }))
});
export const schemaUnidadProcedencia = t.Object({
    id: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id",
        title: "Id"
    })),
    id_estudiante_inscripcion: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id_estudiante_inscripcion",
        title: "Id_estudiante_inscripcion"
    })),
    id_unidad_educativa: t.Optional(t.String({
        default: '234_456asdfs4',
        description: "Unicamente: id_unidad_educativa",
        title: "Id_unidad_educativa"
    }))
});
export const schemaRude = t.Object({
    cod_rude: t.String({
        default: "40640010",
        description: "Unicamente: codigo-rude",
        title: "Rude",
    }),
    nombres: t.Optional(t.String({
        default: "Miguel",
        description: "Unicamente: Nombre",
        title: "Nombre",
    })),
    apellidoPaterno: t.Optional(t.String({
        default: "Lopez",
        description: "Unicamente: Apellido Paterno",
        title: "Apellido Paterno",
    })),
    apellidoMaterno: t.Optional(t.String({
        default: "Mamani",
        description: "Unicamente: Apellido Materno",
        title: "Apellido Materno",
    })),
    nacimientoPais: t.Optional(t.String({
        default: "Bolivia",
        description: "Unicamente: Pais",
        title: "Pais",
    })),
    nacimientoProvincia: t.Optional(t.String({
        default: "Cercado",
        description: "Unicamente: Provincia",
        title: "Provincia",
    })),
    nacimientoDepto: t.Optional(t.String({
        default: "Oruro",
        description: "Unicamente: Departamento",
        title: "Departamento",
    })),
    nacimientoLocalidad: t.Optional(t.String({
        default: "Oruro",
        description: "Unicamente: Localidad",
        title: "Localidad",
    })),
    nacimientoDia: t.Optional(t.Number({
        default: 1,
        description: "Unicamente: Dia de nacimiento: [1-31]",
        title: "Dia Nacimiento",
    })),
    nacimientoMes: t.Optional(t.Number({
        default: 1,
        description: "Unicamente: Mes de nacimiento: [1-12]",
        title: "Mes Nacimiento",
    })),
    nacimientoAno: t.Optional(t.Number({
        default: 1996,
        description: "Unicamente: Año de nacimiento: [0-2019]",
        title: "Año Nacimiento",
    })),
    identificacionNumero: t.Optional(t.Number({
        default: 7278888,
        description: "Unicamente: Numero de carnet de identidad",
        title: "Numero Carnet Identidad",
    })),
    identificacionComplemento: t.Optional(t.String({
        default: "ACP",
        description: "Unicamente: Complemento de carnet de identidad",
        title: "Complemento de Carnet de Identidad",
    })),
    identificacionExpedido: t.Optional(t.String({
        default: "OR",
        description: "Unicamente: Lugar de Expedicion",
        title: "Expedicion",
    })),
    certificadoNacimientoOficialia: t.Optional(t.String({
        default: "003",
        description: "Unicamente: Oficialia Cert. Nac.",
        title: "Oficialia",
    })),
    certificadoNacimientoLibro: t.Optional(t.String({
        default: "AS-03",
        description: "Unicamente: Libro Cert. Nac.",
        title: "Libro",
    })),
    certificadoNacimientoFolio: t.Optional(t.String({
        default: "023",
        description: "Unicamente: Folio Cert. Nac.",
        title: "Folio",
    })),
    sexo: t.Optional(t.String({
        default: "M",
        description: "Unicamente: ['F' | 'M']",
        title: "Sexo",
    })),
});

export const schemaEstudiante = t.Object({
    cod_rude: t.Union([
        schemaRude,
        t.String(),
    ], {
        default: {
            cod_rude: "40640012",
            nombres: "Pablo",
            apellidoPaterno: "Bueno",
            sexo: "M"
        },
        description: "Excluyente: cod_rude: String | cod_rude: {nombres,apellidoPaterno,...}: Object",
        title: "Rude",
    }),
    id_curso: t.Union([
        schemaCurso,
        t.String(),
    ], {
        default: { curso: "1", nivel: "INICIAL", paralelo: "A", ano: 2024 },
        description: "Excluyente: id_curso: String | id_curso: {curso, nivel, paralelo, ano}: Object",
        title: "Rude",
    })
});
export const schemaEstudianteUpdate = t.Object({
    cod_rude: t.String({
        default: "40640012",
        description: "Excluyente: cod_rude: String",
        title: "Rude",
    }),
    id_curso: t.String({
        default: "asfgfd32f4g",
        description: "Excluyente: id_curso: String",
        title: "Rude",
    }),
});
export const schemaEstudianteDiscapacidad = t.Object({
    id: t.Optional(t.String()),
    codigo: t.String({
        default: "AA-2",
        description: "Codigo de Discapacidad",
        title: "Codigo",
    }),
    discapacidadTipo: t.String({
        default: "Autismo",
        description: "Unicamente: ['Psiquica', 'Autismo', 'Sindrome de Down', 'Intelectual', 'Auditivia', 'Fisica-Motora', 'Sordocequera', 'Multiple', 'Visual']",
        title: "Discapacidad Tipo",
    }),
    discapacidadGrado: t.String(),
});

const Servicio = {
    listarEstudiante: async function () {
        try {
            const response = await Estudiante.findAll();
            return response;
        } catch (err) {
            return err;
        }
    },
    listarRude: async function () {
        try {
            const response = await Rude.findAll();
            return response;
        } catch (err) {
            return err;
        }
    },
    listarCurso: async function () {
        try {
            const response = await Curso.findAll();
            return response;
        } catch (err) {
            return err;
        }
    },
    listarEstudianteID: async function ({ params }) {
        try {
            const response = await Estudiante.findOne({
                where: {
                    id: params.id
                }
            })
            return response;
        } catch (e) {
            throw new Error(e);
        }
    },
    listarRudeId: async function ({ params }) {
        try {
            const response = await Rude.findOne({
                where: {
                    cod_rude: params.cod_rude
                }
            })
            return response;
        } catch (e) {
            throw new Error(e);
        }
    },
    listarCursoId: async function ({ params }) {
        try {
            const response = await Curso.findOne({
                where: {
                    id: params.id,
                }
            });
            return response;

        } catch (e) {
            throw new Error(e);
        }
    },
    crearEstudiante: async function ({ body }) {
        const { id_curso, cod_rude, ...value } = body;
        console.log('estudiante', body);
        let rude, curso;
        return await sequelize.transaction(async (t) => {
            try {
                value.id = nanoid();
                if (typeof body.cod_rude === 'string') {
                    rude = await Rude.findOne({ where: { cod_rude: cod_rude }, transaction: t });
                    if (!rude) throw new Error('RUDE no encontrado');
                }
                if (typeof body.cod_rude === 'object') {
                    rude = await Rude.create(cod_rude, { transaction: t });
                }
                if (typeof body.id_curso === 'string') {
                    curso = await Curso.findOne({ where: { id: id_curso }, transaction: t });
                    if (!curso) throw new Error('CURSO no encontrado');
                }
                if (typeof body.id_curso === 'object') {
                    curso = await Curso.create({ id: nanoid(), ...id_curso }, { transaction: t });
                }
                const estudianteCreado = await Estudiante.create({ ...value, id_curso: curso.dataValues.id, cod_rude: rude.dataValues.cod_rude }, { transaction: t });
                return estudianteCreado.dataValues;
            } catch (e) {
                throw e;
            }
        }).catch(e => {
            throw new Error(`${e.message}`);
        });
    },
    crearRude: async function ({ body }) {
        const value = { ...body };
        try {
            const rudeCreado = await Rude.create(value);
            const respuesta = {
                ...rudeCreado.dataValues,
                updatedAt: new Date().toISOString(),
                createdAt: new Date().toISOString()

            };
            return respuesta;
        } catch (e) {
            throw new Error(e);
        }
    },
    crearCurso: async function ({ body }) {
        const value = { ...body };
        const cursos = ['1', '2', '3', '4', '5', '6'];
        const niveles = ['INICIAL', 'PRIMARIA', 'SECUNDARIA'];
        const paralelos = ['A', 'B', 'C', 'D'];
        try {
            value.id = nanoid();

            if (!cursos.includes(value.curso) || !niveles.includes(value.nivel) || !paralelos.includes(value.paralelo)) throw new Error('Error de tipo de datos de (Curso, nivel , paralelo) son incorrectos');
            const response = await Curso.create(value);
            return response;
        } catch (e) {
            throw new Error(e);
        }
    },
    modificarEstudiante: async function ({ params: { id }, body }) {
        if (!id) throw new Error('Falta el ID en el parámetro.');
        return await sequelize.transaction(async (t) => {
            try {
                const estudiante = await Estudiante.findByPk(id, { transaction: t });
                if (!estudiante) throw new Error('Estudiante no encontrado.');
                if (body.id_curso) {
                    const curso = await Curso.findByPk(body.id_curso, { transaction: t });
                    if (!curso) throw new Error('Curso no encontrado.');
                }
                if (body.cod_rude) {
                    const rude = await Rude.findOne({ where: { cod_rude: body.cod_rude }, transaction: t });
                    if (!rude) throw new Error('RUDE no encontrado.');
                }
                await estudiante.update(body, { transaction: t });
                return estudiante;
            } catch (e) {
                throw new Error(`Error al modificar estudiante: ${e.message}`);
            }
        });
    },
    modificarRude: async function ({ params: { cod_rude }, body }) {
        if (!cod_rude) throw new Error('Falta el ID en el parametro.');
        return await sequelize.transaction(async (t) => {
            try {
                const rude = await Rude.findByPk(cod_rude);
                if (!rude) throw new Error('Rude no encontrado.');
                await rude.update(body, { transaction: t });
                return rude;
            } catch (e) {
                throw new Error(`Error al modificar estudiante: ${e.message}`);
            }
        })
    },
    modificarCurso: async function ({ params: { id }, body }) {
        if (!id) throw new Error('Falta de ID en el parametro');
        return await sequelize.transaction(async (t) => {
            try {
                const curso = await Curso.findByPk(id);
                if (!curso) throw new Error('Curso no encontrado');
                await curso.update(body, { transaction: t });
                return curso;
            } catch (e) {
                throw new Error(`Error al modificar curso ${e.nessage}`)
            };
        });
    },
    eliminarEstudiante: async function ({ params: { id } }) {
        if (!id) throw new Error('Falta el ID en el parámetro.');

        return await sequelize.transaction(async (t) => {
            try {
                const estudiante = await Estudiante.findByPk(id, { transaction: t });
                console.log('estudiante eliminado', estudiante);
                if (!estudiante) throw new Error('Estudiante no encontrado.');
                await estudiante.destroy({ transaction: t });
                return estudiante;
            } catch (e) {
                throw new Error(`Error al eliminar estudiante ${e.nessage}`)
            }
        });
    },
    eliminarRude: async function ({ params: { cod_rude } }) {
        if (!cod_rude) throw new Error('Falta de ID en el parametro');
        return await sequelize.transaction(async (t) => {
            try {
                const rude = await Rude.findByPk(cod_rude);
                if (!rude) throw new Error('Rude no encontrado');
                await rude.destroy({ transaction: t });
            } catch (e) {
                throw new Error(`Error al eliminar rude ${e.nessage}`)
            }
        })
    },
    eliminarCurso: async function ({ params: { id } }) {
        if (!id) throw new Error('Falta de ID en el parametro');
        return await sequelize.transaction(async (t) => {
            try {
                const curso = await Curso.findByPk(id);
                if (!curso) throw new Error('Curso no encontrado');
                await curso.destroy({ transaction: t });
                return curso;
            } catch (e) {
                throw new Error(`Error al eliminar curso ${e.message}`);
            }
        })
    }

}
export default Servicio;
