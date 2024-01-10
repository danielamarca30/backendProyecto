import { Elysia, t } from 'elysia';
import { schemaCurso } from '../Curso/servicio';
import Servicio, { schemaEstudiante, schemaEstudianteDiscapacidad, schemaEstudianteUpdate, schemaRude } from './servicio';
const Controlador = new Elysia().onError(({ code, error, set }) => {
    if (code) {
        set.status = 400;
        return error;
    }
});
Controlador.get('/:id', Servicio.listarEstudianteID);
Controlador.get('/', Servicio.listarEstudiante);
Controlador.post('/', Servicio.crearEstudiante, {
    body: schemaEstudiante
})
Controlador.put('/:id', Servicio.modificarEstudiante, {
    body: schemaEstudianteUpdate
});

Controlador.get('/rude/:cod_rude', Servicio.listarRudeId);
Controlador.get('/rude', Servicio.listarRude);
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
Controlador.put('/rude/:cod_rude', Servicio.modificarRude, { body: schemaRude });

Controlador.get('/curso/:id', Servicio.listarCursoId);
Controlador.get('/curso', Servicio.listarCurso);
Controlador.post('/curso', Servicio.crearCurso,
    {
        body: schemaCurso
    }
);
Controlador.put('/curso/:id', Servicio.modificarCurso,
    {
        body: schemaCurso
    }
);

export default Controlador;

