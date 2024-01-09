import { Elysia, t } from 'elysia';
import Servicio, { schemaEstudiante, schemaEstudianteDiscapacidad, schemaCurso, schemaRude } from './servicio';
const Controlador = new Elysia().onError(({ code, error, set }) => {
    if (code) {
        set.status = 400;
        return error;
    }
});
Controlador.get('/', Servicio.listar);
Controlador.post('/', Servicio.crearEstudiante, {
    body: schemaEstudiante
})
Controlador.post('/rude', Servicio.crearRude, {
    body: schemaRude,
    response: t.Object({
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
        updatedAt: t.String(),
        createdAt: t.String()
    }, { description: 'sample description' })
});
export default Controlador;