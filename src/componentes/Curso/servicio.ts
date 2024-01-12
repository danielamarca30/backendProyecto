import { Curso, MateriaArea } from '../../db';
import { t } from 'elysia';
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
    ano: t.Number({
        default: 2024,
        description: "Unicamente: Ano de Curso",
        title: "Año",
    }),
});

export const schemaMateriaArea = t.Object({

});
const Servicio = {
    listarMateria: async function () {
        try {
            const response = await MateriaArea.findAll();
            return response;
        } catch (e) {
            throw new Error(e);
        }
    }
};
export default Servicio;