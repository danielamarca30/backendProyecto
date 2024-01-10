import Servicio from './servicio';
import { Elysia } from 'elysia';
const Controlador = new Elysia().onError(({ code, error, set }) => {
    console.log('Error imprimir: code', code);
    if (code) {
        set.status = 400;
        return error;
    }
});
Controlador.get('/materia', Servicio.listarMateria);
export default Controlador;