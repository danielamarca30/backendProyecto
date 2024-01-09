import { t } from 'elysia';
import { Rude, Estudiante, Curso, sequelize } from '../../db';
import { nanoid } from 'nanoid';
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
    nacimientoDepto: t.Optional(t.String()),
    nacimientoLocalidad: t.Optional(t.String()),
    nacimientoDia: t.Optional(t.Number()),
    nacimientoMes: t.Optional(t.Number()),
    nacimientoAno: t.Optional(t.Number()),
    identificacionNumero: t.Optional(t.Number()),
    identificacionComplemento: t.Optional(t.String()),
    identificacionExpedido: t.Optional(t.String()),
    certificadoNacimientoOficialia: t.Optional(t.String()),
    certificadoNacimientoLibro: t.Optional(t.String()),
    certificadoNacimientoFolio: t.Optional(t.String()),
    sexo: t.Optional(t.String({
        default: "M",
        description: "Unicamente: ['F' | 'M']",
        title: "Sexo",
    })),
});
export const schemaCurso = t.Object({
    id: t.Optional(t.String()),
    curso: t.String({
        default: "1",
        description: "Unicamente: ['1', '2', '3', '4', '5', '6']",
        title: "Curso",
    }),
    nivel: t.String({
        default: "INICIAL",
        description: "Unicamente: ['INICIAL', 'PRIMARIA', 'SECUNDARIA']",
        title: "Nivel",
    }),
    paralelo: t.String({
        default: "A",
        description: "Unicamente: ['A', 'B', 'B', 'C', 'D']",
        title: "Nivel",
    }),
    ano: t.Number(),
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
                console.log('estudiante', estudianteCreado.dataValues);
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
    }

}
export default Servicio;
