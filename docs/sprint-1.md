# Planificación del Sprint 1

Sistema web de gestión de solicitudes ciudadanas · Práctica de laboratorio Unidad 2.

## Ficha del sprint

| Campo | Registro del equipo |
|---|---|
| Sprint | Sprint 1 |
| Duración | Dos semanas (sprint académico) |
| Objetivo (Sprint Goal) | Que un ciudadano pueda registrar una solicitud de un tipo del catálogo, adjuntar sus documentos y consultar el estado con su número de seguimiento, quedando cada acción registrada en la bitácora. |
| Capacidad acordada | 20 puntos |
| Historias seleccionadas | HU-01, HU-02, HU-08, HU-03, HU-05 |
| Total comprometido | 19 puntos (95 % de la capacidad) |
| Riesgo principal | El cálculo de días hábiles y la validación real de los archivos adjuntos; si uno de los dos se complica, se prioriza terminar HU-02 y HU-05 y se negocia HU-03 con el Product Owner. |
| Criterio de éxito | En la demostración se registran cinco solicitudes de tres tipos distintos, todas consultables por su número de seguimiento, con la bitácora completa y sin defectos que impidan el flujo. |

## Cómo se calculó la capacidad

La capacidad no se copió de una velocidad histórica, porque el equipo no tiene sprints previos. Se estimó
a partir de la disponibilidad declarada por cada integrante y de un tamaño de referencia acordado: una
historia de 3 puntos equivale a lo que una persona termina con holgura en una semana de trabajo académico.

| Integrante | Disponibilidad en el sprint | Aporte estimado |
|---|---|---|
| Integrante 1 | Completa | 6 puntos |
| Integrante 2 | Completa | 6 puntos |
| Integrante 3 | Reducida en la semana 1 (parcial de otra materia) | 4 puntos |
| Integrante 4 | Reducida en la semana 2 (viaje) | 4 puntos |
| **Capacidad del equipo** | | **20 puntos** |

Se comprometen 19 de los 20 puntos: el margen restante absorbe el trabajo de revisión cruzada, que en este
equipo siempre la hace una persona distinta del autor.

## Historias seleccionadas

Se tomaron desde la parte superior del backlog, verificando la Definition of Ready una por una y sin
superar la capacidad. La sexta historia del backlog (HU-10, Derivar, 5 puntos) no entra: 19 + 5 = 24
supera los 20 puntos disponibles, y dividirla no tendría sentido porque la derivación sin motivo
registrado no aporta valor verificable.

| Orden | ID | Historia | SP | ¿Por qué entra? |
|---|---|---|---|---|
| 1 | HU-01 | Catálogo de tipos de trámite con plazos | 3 | Dependencia dura de HU-02: sin tipo no hay plazo ni dependencia responsable. |
| 2 | HU-02 | Registrar solicitud y obtener número de seguimiento | 5 | Es el corazón del Sprint Goal. |
| 3 | HU-08 | Iniciar sesión con rol | 5 | Habilita la gestión posterior y deja trazabilidad de quién actúa; ataca temprano el riesgo de seguridad. |
| 4 | HU-03 | Adjuntar documentos con validación | 3 | Completa el registro con el expediente; sin ella el trámite queda incompleto en el piloto. |
| 5 | HU-05 | Consultar estado con el número de seguimiento | 3 | Cierra el Sprint Goal: el ciudadano ve el resultado de haber registrado. |
| | | **Total** | **19** | |

## Definition of Ready (para entrar al sprint)

1. La historia expresa rol, capacidad y beneficio; no es una tarea técnica disfrazada.
2. Tiene criterios de aceptación suficientes y verificables (formato Dado / cuando / entonces).
3. Sus dependencias y restricciones están identificadas.
4. La estimación fue acordada por el equipo, no asignada por una sola persona.
5. Su tamaño no supera los 8 puntos; si los supera, se divide antes de entrar.

## Definition of Done (para la simulación)

1. Los criterios de aceptación fueron revisados por una persona distinta del responsable.
2. La evidencia o el prototipo está enlazado en el Issue cuando corresponde.
3. No quedan tareas abiertas ni bloqueos sin registrar.
4. Los campos Status, Priority, Story points, Epic e Iteration están actualizados en el Project.
5. Si la historia cambió una decisión del equipo, el README o la documentación lo refleja.

## Descomposición en tareas técnicas

Las tareas viven como lista de verificación dentro de cada Issue. Son trabajo interno del equipo: ninguna
de ellas se mueve sola por el tablero ni se entrega por separado, porque el valor se entrega con la
historia completa.

**HU-02 — Registrar una solicitud y obtener un número de seguimiento**

1. Modelar las entidades Solicitud, TipoTramite y EventoBitacora.
2. Implementar el generador de número de seguimiento no secuencial.
3. Construir el formulario de registro con validaciones del lado del servidor.
4. Calcular la fecha de vencimiento a partir del plazo en días hábiles.
5. Registrar el evento de creación en la bitácora.
6. Escribir pruebas del caso válido, del caso incompleto y del cálculo de vencimiento.

**HU-05 — Consultar el estado con el número de seguimiento**

1. Definir el endpoint público de consulta por código.
2. Implementar la respuesta con estado, fecha de actualización y dependencia.
3. Agregar el mensaje genérico para códigos inexistentes.
4. Implementar el límite de intentos por origen.
5. Construir la pantalla de consulta y su versión para móvil.
6. Escribir pruebas de código válido, inexistente y límite de intentos.

## Riesgos y dependencias del sprint

| ID | Riesgo o dependencia | Respuesta acordada |
|---|---|---|
| R-01 | El cálculo de días hábiles con feriados nacionales puede llevar más tiempo del estimado. | Tabla de feriados configurable y pruebas desde el primer día; si se complica, se entrega con feriados fijos y se registra la deuda. |
| R-02 | La validación real del tipo de archivo (no solo la extensión) puede requerir una biblioteca nueva. | Se resuelve en los dos primeros días; si no hay acuerdo, HU-03 se negocia con el Product Owner antes del día 5. |
| D-01 | HU-02 depende de HU-01. | HU-01 se toma en el primer día del sprint. |
| D-02 | HU-05 depende de HU-02. | La consulta se implementa contra datos de prueba mientras HU-02 se termina. |
| R-03 | La disponibilidad reducida de dos integrantes se concentra en semanas distintas. | La capacidad ya la descuenta; se revisa en la coordinación del día 5 y, si baja más, se aplica la regla de reducción de alcance. |

## Qué pasa si la capacidad real baja

Si durante el sprint la capacidad disponible cae (por ejemplo, un 30 %), el equipo **no extiende el sprint
ni entrega historias a medias**: reduce el alcance comprometido empezando por la historia de menor
prioridad de ejecución que todavía no esté en curso (en este sprint, HU-03), lo informa al Product Owner
el mismo día en que lo detecta y lo registra en el Issue y en el README. El Sprint Goal se mantiene
mientras HU-01, HU-02 y HU-05 sigan en pie; si se pusiera en riesgo, se convoca a una replanificación.
