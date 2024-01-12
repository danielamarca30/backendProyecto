import { Elysia } from 'elysia';
import rutas from './src/rutas';
import { swagger } from '@elysiajs/swagger';

const server = new Elysia()
    .use(swagger({
        documentation: {
            info: {
                title: 'Colegio',
                version: '1.0.0'
            }
        }
    }))
    .use(rutas);

server.listen({ port: 8000, hostname: '0.0.0.0' });