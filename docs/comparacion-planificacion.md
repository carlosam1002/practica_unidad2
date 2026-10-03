# Comparación entre planificación predictiva y ágil

Sistema web de gestión de solicitudes ciudadanas · Práctica de laboratorio Unidad 2.

El mismo caso se planificó desde las dos perspectivas. El objetivo no es declarar un enfoque mejor en
abstracto, sino relacionar cada decisión con la estabilidad de los requisitos, el riesgo, la
retroalimentación disponible y las restricciones del caso.

## 1. Mini-plan predictivo

**Alcance inicial, entregables y criterios de aceptación de alto nivel.** El alcance se cierra en cuatro
entregables: (E1) registro de solicitudes con adjuntos y número de seguimiento; (E2) consulta pública de
estado, plazo y responsable; (E3) gestión interna con derivación, bitácora y resolución; (E4) reportes de
tipo, estado, dependencia y cumplimiento de plazos. Cada entregable se acepta con una prueba documentada:
por ejemplo, E1 se acepta cuando 20 solicitudes de prueba de tres tipos distintos se registran con plazo
correcto y bitácora completa.

**Fases, hitos y aprobación de cambios para seis semanas.**

| Semana | Fase | Hito | Aprobación |
|---|---|---|---|
| 1 | Relevamiento y cierre de requisitos | Catálogo de tipos y plazos legales firmado por la institución | Supervisor del área |
| 2 | Diseño y línea base | Modelo de datos, flujo de estados y diseño de pantallas aprobados | Comité del proyecto |
| 3–4 | Construcción de registro, consulta y gestión | E1 y E2 aprobados | Product Owner institucional |
| 5 | Construcción de notificaciones y reportes | E3 aprobado | Product Owner institucional |
| 6 | Pruebas de aceptación y puesta en piloto | E4 aprobado y acta de aceptación firmada | Comité del proyecto |

Todo cambio posterior a la semana 2 entra por un control formal: se registra la solicitud, se evalúa su
impacto en alcance, plazo y costo, y el Comité la aprueba o la rechaza antes de tocar la línea base.

**Requisitos que deberían cerrarse antes de construir.** Los plazos legales por tipo de trámite; la lista
de estados obligatorios del trámite y sus transiciones válidas; las dependencias que pueden recibir
derivaciones; los roles y sus permisos; y qué información de la bitácora es pública y cuál es interna.
Son requisitos normativos: si cambian después, obligan a rehacer datos ya registrados.

**Cómo se controlaría una solicitud de cambio del piloto.** Un funcionario pide durante la semana 4 que
la derivación permita elegir varias dependencias a la vez. El flujo sería: se registra la solicitud de
cambio con su justificación; el analista estima impacto (cinco días de trabajo, afecta el modelo de datos
y los reportes); el Comité decide; si se aprueba, se actualizan la línea base, el cronograma y el
presupuesto, y se comunica la nueva fecha. Si se rechaza, queda documentada para una fase posterior.

## 2. Mini-plan ágil

**Visión, Product Backlog, Sprint Goal e incremento esperado.** Visión: que el ciudadano pueda hacer su
trámite en línea y saber en todo momento en qué estado está, y que la institución cumpla los plazos
legales con evidencia auditable. El Product Backlog tiene 16 historias ordenadas sin empates
(`docs/product-backlog.md`). El Sprint Goal del Sprint 1 es que un ciudadano registre una solicitud,
adjunte documentos y consulte su estado con el número de seguimiento. El incremento esperado es ese flujo
funcionando de punta a punta, no una maqueta.

**Cómo se incorpora la retroalimentación después del sprint.** En la revisión del sprint participan un
funcionario receptor y dos ciudadanos del piloto, que usan el sistema delante del equipo. Cada
observación se registra como Issue nuevo y el Product Owner la ordena en el backlog antes del siguiente
sprint; ninguna se corrige «al pasar» sin quedar registrada. En la retrospectiva el equipo elige una sola
mejora de proceso y la convierte en una acción verificable.

**Métricas de flujo y avance que se observan.** Puntos completados frente a comprometidos por sprint;
tiempo de ciclo de una historia desde *En curso* hasta *Hecha*; cantidad de tarjetas en cada columna
frente a los límites WIP; retrabajo, es decir, historias que vuelven de *En revisión*; y una métrica de
producto: porcentaje de solicitudes de prueba resueltas dentro del plazo.

**Cómo se reordena el backlog ante un nuevo requisito.** Si durante el piloto aparece la necesidad de
derivar a varias dependencias, se escribe como historia con sus criterios, se estima y el Product Owner
la compara con lo que ya está ordenado: si vale más que lo que sigue, sube; si entra al sprint en curso,
algo de tamaño equivalente sale, y el cambio queda registrado. El sprint en marcha no se altera salvo que
el Sprint Goal pierda sentido.

## 3. Matriz comparativa

| Criterio | Planificación predictiva | Planificación ágil |
|---|---|---|
| **Alcance** | Se define y se aprueba al inicio; los cuatro entregables son la línea base y el cambio es una excepción controlada. | Se define una visión y un backlog vivo; el alcance se refina en cada sprint y se prioriza por valor. |
| **Tiempo y cadencia** | Seis semanas divididas en fases secuenciales con hitos de aprobación. | Sprints de dos semanas, cada uno con un incremento utilizable y una cadencia fija de revisión. |
| **Tratamiento del cambio** | Control formal de cambios: solicitud, evaluación de impacto y aprobación del Comité. | El cambio es esperado: entra al backlog, se prioriza y se toma en el siguiente sprint. |
| **Estimación** | Estimación detallada por fase, en horas, hecha una vez al inicio. | Estimación relativa en puntos por historia, revisada por el equipo en cada refinamiento. |
| **Seguimiento y control** | Avance frente al cronograma y a la línea base; informes por hito. | Métricas de flujo y de entrega: puntos completados, tiempo de ciclo, WIP y retrabajo. |
| **Participación de usuarios** | Concentrada en el relevamiento inicial y en la aceptación final. | Continua: los usuarios del piloto participan en cada revisión de sprint. |
| **Documentación y trazabilidad** | Documentos formales aprobados: especificación, línea base y actas de aceptación. | Trazabilidad viva en Issues, Project y commits; la documentación se mantiene al ritmo del producto. |
| **Riesgo principal** | Cerrar requisitos que todavía no están maduros y descubrirlo en la semana 6, cuando el cambio ya es caro. | Perder de vista los plazos legales y las obligaciones formales por priorizar solo lo que el usuario pide. |

## 4. Conclusión: un enfoque híbrido para este caso

Para este sistema se recomienda un **enfoque híbrido**, porque el caso tiene dos naturalezas distintas
conviviendo.

Lo que es **estable y obligatorio** se planifica de forma predictiva: los plazos legales, los estados
obligatorios del trámite, los roles y permisos, la bitácora auditable y los hitos de aprobación
institucional. Son requisitos normativos, no preferencias; cambiarlos a mitad de camino tiene costo real
y la institución necesita comprometer fechas y responsables por adelantado.

Lo que **va a evolucionar con el piloto** se gestiona de forma ágil, iterativa e incremental: la
usabilidad del registro, el contenido y la frecuencia de las notificaciones, la forma de los reportes y
el orden en que se incorporan las dependencias. Son decisiones que mejoran con retroalimentación real y
que no conviene congelar antes de tener usuarios usando el sistema.

En la práctica, eso significa: una línea base formal de alcance normativo y de hitos de aprobación, y
dentro de ella, sprints de dos semanas con backlog priorizado, tablero Kanban con límites WIP y revisión
con usuarios al final de cada sprint. El control de cambios formal se reserva para lo que toca la línea
base normativa; todo lo demás se reordena en el backlog sin burocracia.
