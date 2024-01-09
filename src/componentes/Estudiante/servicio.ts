import { t } from 'elysia';
import { Rude, Estudiante } from '../../db';
import { nanoid } from 'nanoid';
export const schemaEstudiante = t.Object({
    id: t.String(),
    cod_rude: t.Union([
        t.String(),
        t.Object({
            cod_rude: t.String(),
            nombres: t.Optional(t.String()),
            apellidoPaterno: t.Optional(t.String()),
            apellidoMaterno: t.Optional(t.String()),
            nacimientoPais: t.Optional(t.String()),
            nacimientoProvincia: t.Optional(t.String()),
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
            sexo: t.Optional(t.String()),
        })
    ]),
    id_curso: t.Union([
        t.String(),
        t.Object({
            id: t.Optional(t.String()),
            curso: t.Optional(t.String()),
            nivel: t.Optional(t.String()),
            paralelo: t.Optional(t.String()),
            ano: t.Optional(t.String()),
        })
    ])
});
export const schemaRude = t.Object({
    cod_rude: t.String(),
    nombres: t.Optional(t.String()),
    apellidoPaterno: t.Optional(t.String()),
    apellidoMaterno: t.Optional(t.String()),
    nacimientoPais: t.Optional(t.String()),
    nacimientoProvincia: t.Optional(t.String()),
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
    sexo: t.Optional(t.String()),
});
export const schemaEstudianteDiscapacidad = t.Object({
    id: t.String(),
    codigo: t.String(),
    discapacidadTipo: t.String(),
    discapacidadGrado: t.String(),
});
export const schemaCurso = t.Object({
    id: t.String(),
    curso: t.String(),
    nivel: t.String(),
    paralelo: t.String(),
    ano: t.String(),
});

const Servicio = {
    listar: async function (ctx: any) {
        try {
            const response = await Estudiante.findAll();
            ctx.status = 400;
            return response;
        } catch (err) {
            return err;
        }
    },
    crearEstudiante: async function ({ body }) {
        const value = { ...body };
        try {
            value.id = nanoid();
            const response = await Rude.create(value);
            return response;
        } catch (e) {
            throw new Error(e);
        }
    },
    crearRude: async function ({ body }) {
        const value = { ...body };
        try {
            const rudeCreado = await Rude.create(value);
            // Aquí construyes el objeto de respuesta
            const respuesta = {
                ...rudeCreado.dataValues, // Suponiendo que esto tiene los campos requeridos
                updatedAt: new Date().toISOString(), // Asegúrate de que estos valores sean correctos
                createdAt: new Date().toISOString()

            };
            return respuesta;
        } catch (e) {
            throw new Error(e);
        }
    }

}
export default Servicio;
