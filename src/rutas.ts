import { Elysia } from 'elysia';
import * as Estudiante from './componentes/Estudiante';
const estudiante = new Elysia({ prefix: '/estudiante' }).use(Estudiante.Controlador);
const rutas = new Elysia()
    .use(estudiante);
export default rutas;