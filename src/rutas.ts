import { Elysia } from 'elysia';
import * as Estudiante from './componentes/Estudiante';
import * as Curso from './componentes/Curso';
const estudiante = new Elysia({ prefix: '/estudiante' }).use(Estudiante.Controlador);
const curso = new Elysia({ prefix: '/curso' }).use(Curso.Controlador);
const rutas = new Elysia()
    .use(estudiante)
    .use(curso);
export default rutas;