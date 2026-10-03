# Product Backlog priorizado

Sistema web de gestión de solicitudes ciudadanas · Práctica de laboratorio Unidad 2.

El backlog tiene **un orden único de ejecución, sin empates**: la categoría MoSCoW clasifica,
pero el número de orden decide qué se toma primero. Dos historias pueden ser *Must* y ocupar
posiciones distintas.

## Criterios de decisión aplicados

1. **Valor:** aporte al ciudadano, al servicio o al cumplimiento institucional (campo *Business value*).
2. **Urgencia:** plazos legales y habilitación de otras funciones.
3. **Riesgo:** incertidumbre técnica, normativa o de seguridad que conviene atacar temprano.
4. **Dependencia:** precedencia lógica o necesidad de información producida por otra historia.
5. **Esfuerzo:** tamaño relativo en puntos de historia (1, 2, 3, 5, 8), sin convertirlo a horas.

## Backlog ordenado

| # | ID | Historia | Epic | Prioridad | SP | BV | Iteración | Estado |
|---|---|---|---|---|---|---|---|---|
| 1 | HU-01 | Definir el catálogo de tipos de trámite con sus plazos legales | Registro | Must | 3 | 4 | Sprint 1 | Preparada |
| 2 | HU-02 | Registrar una solicitud y obtener un número de seguimiento | Registro | Must | 5 | 5 | Sprint 1 | Preparada |
| 3 | HU-08 | Iniciar sesión con un rol y ver solo lo que corresponde al rol | Gestión | Must | 5 | 4 | Sprint 1 | Preparada |
| 4 | HU-03 | Adjuntar documentos a la solicitud y recibir aviso de archivos inválidos | Registro | Must | 3 | 4 | Sprint 1 | Preparada |
| 5 | HU-05 | Consultar el estado de una solicitud con el número de seguimiento | Seguimiento | Must | 3 | 5 | Sprint 1 | Preparada |
| 6 | HU-10 | Derivar la solicitud a la dependencia competente | Gestión | Must | 5 | 5 | — | Backlog |
| 7 | HU-11 | Registrar observaciones en una bitácora auditable | Gestión | Must | 3 | 4 | — | Backlog |
| 8 | HU-09 | Trabajar con una bandeja de solicitudes ordenada por vencimiento | Gestión | Should | 3 | 4 | — | Backlog |
| 9 | HU-04 | Registrar una solicitud presencial en nombre del ciudadano | Registro | Should | 3 | 3 | — | Backlog |
| 10 | HU-06 | Ver la línea de tiempo pública de la solicitud | Seguimiento | Should | 2 | 3 | — | Backlog |
| 11 | HU-07 | Conocer el plazo estimado y el responsable actual de la solicitud | Seguimiento | Should | 2 | 4 | — | Backlog |
| 12 | HU-12 | Resolver la solicitud y comunicar la respuesta final | Gestión | Should | 3 | 5 | — | Backlog |
| 13 | HU-13 | Notificar al ciudadano los cambios relevantes de su solicitud | Notificaciones | Should | 3 | 4 | — | Backlog |
| 14 | HU-14 | Alertar vencimientos próximos y escalar casos demorados | Notificaciones | Could | 5 | 3 | — | Backlog |
| 15 | HU-15 | Obtener reportes por tipo, estado, dependencia y cumplimiento de plazos | Reportes | Could | 5 | 3 | — | Backlog |
| 16 | HU-16 | Exportar la bitácora completa para una auditoría externa | Reportes | Won't | 3 | 2 | — | Backlog |

**Totales:** 16 historias · 56 puntos de historia · 19 puntos seleccionados para el Sprint 1.

## Distribución por prioridad MoSCoW

| Prioridad | Historias | Puntos |
|---|---|---|
| Must | 7 | 27 |
| Should | 6 | 16 |
| Could | 2 | 10 |
| Won't | 1 | 3 |

## Tres decisiones controvertidas y su justificación

1. **HU-01 (catálogo de tipos de trámite) va primera, aunque el ciudadano no la ve.**
   No aporta valor visible, pero sin tipo de trámite no hay plazo legal ni dependencia responsable:
   registrar una solicitud (HU-02) sin catálogo obligaría a corregir datos después. Es una dependencia
   dura, no una preferencia técnica.
2. **HU-13 (notificaciones por correo) queda detrás de HU-05 (consulta por código).**
   Ambas resuelven la misma necesidad —que el ciudadano conozca el avance—, pero la consulta no depende
   de un proveedor externo y cubre el caso mínimo con menos riesgo. Las notificaciones agregan comodidad,
   no capacidad nueva.
3. **HU-16 (exportar la bitácora para auditoría) se clasifica como *Won't* en esta versión.**
   La auditoría puede consultar la bitácora en pantalla (HU-11). Exportarla exige antes una política de
   resguardo de datos que la institución todavía no definió; comprometerla ahora sería planificar sobre
   una decisión que no nos corresponde.

## Historias divididas

La necesidad inicial «adjuntar documentos y recibir avisos sobre archivos inválidos» se mantuvo como una
sola historia (HU-03) porque el aviso de rechazo es un criterio de aceptación, no una historia aparte.
En cambio, «registrar una solicitud» se separó de «adjuntar documentos» (HU-02 y HU-03): cada una entrega
valor por sí sola y juntas superaban los 8 puntos que admite la Definition of Ready.
