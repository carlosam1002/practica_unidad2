# Ingeniería de Software III — LCIK · Equipo XX

**Práctica de laboratorio de la Unidad 2: del requerimiento al Sprint**
Caso: sistema web de gestión de solicitudes ciudadanas.

> Todos los datos de este repositorio son ficticios. No contiene datos personales reales, contraseñas,
> tokens ni información sensible.

## Enlaces de la entrega

| Recurso | Enlace |
|---|---|
| Repositorio | `https://github.com/<usuario-u-organizacion>/Ingenieria-de-Software-III-LCIK-equipo-XX` |
| Project (backlog, Kanban y sprint) | `[pegar aquí la URL del Project]` |
| Vista Product Backlog (Table) | `[pegar aquí la URL de la vista]` |
| Vista Kanban (Board) | `[pegar aquí la URL de la vista]` |
| Vista Sprint actual | `[pegar aquí la URL de la vista]` |

## Equipo y roles

| Rol | Integrante | Responsabilidad en la práctica |
|---|---|---|
| Product Owner | Carlos Francisco Arguello Monges | Aclara necesidades, ordena el backlog y formula el objetivo del sprint. |
| Facilitador Scrum/Kanban | Rodney Rodríguez | Cuida el tiempo, las políticas del tablero y los límites WIP. |
| Equipo de desarrollo | [Integrante 3] | Refina, estima, descompone y selecciona trabajo según la capacidad. |
| Observador/relator | [Integrante 4] | Registra decisiones, evidencia y la comparación predictivo–ágil. |

Los roles son académicos y se rotarán en prácticas posteriores.

## Visión del producto

Que el ciudadano pueda iniciar y seguir sus trámites en línea sin acudir a la institución, y que la
institución cumpla los plazos legales con evidencia auditable de cada actuación.

## Sprint 1

| Campo | Valor |
|---|---|
| Objetivo | Que un ciudadano pueda registrar una solicitud de un tipo del catálogo, adjuntar sus documentos y consultar el estado con su número de seguimiento, quedando cada acción registrada en la bitácora. |
| Duración | Dos semanas |
| Capacidad | 20 puntos |
| Comprometido | 19 puntos (HU-01, HU-02, HU-08, HU-03, HU-05) |
| Criterio de éxito | Cinco solicitudes de tres tipos distintos registradas y consultables, con bitácora completa. |

Detalle en [`docs/sprint-1.md`](docs/sprint-1.md).

## Product Backlog

16 historias de usuario con criterios de aceptación verificables, priorizadas con MoSCoW y ordenadas sin
empates. El detalle y la justificación están en [`docs/product-backlog.md`](docs/product-backlog.md);
cada historia vive como Issue en este repositorio y como ítem del Project.

| Epic | Historias | Puntos |
|---|---|---|
| Registro | HU-01, HU-02, HU-03, HU-04 | 14 |
| Seguimiento | HU-05, HU-06, HU-07 | 7 |
| Gestión | HU-08, HU-09, HU-10, HU-11, HU-12 | 19 |
| Notificaciones | HU-13, HU-14 | 8 |
| Reportes | HU-15, HU-16 | 8 |
| **Total** | **16 historias** | **56** |

## Tres decisiones controvertidas del equipo

1. **HU-01 (catálogo de tipos de trámite) encabeza el backlog aunque el ciudadano no la ve.** Sin tipo de
   trámite no hay plazo legal ni dependencia responsable: registrar solicitudes antes obligaría a
   corregir datos después. Es una dependencia dura, no una preferencia técnica.
2. **Las notificaciones por correo (HU-13) van después de la consulta por código (HU-05).** Las dos
   resuelven que el ciudadano conozca el avance, pero la consulta no depende de un proveedor externo y
   cubre el caso mínimo con menos riesgo.
3. **Exportar la bitácora para auditoría (HU-16) se clasificó como *Won't* en esta versión.** La auditoría
   puede consultarla en pantalla (HU-11), y exportarla exige una política de resguardo de datos que la
   institución todavía no definió.

## Tablero Kanban

Cinco estados (Backlog, Preparada, En curso, En revisión, Hecha), con políticas explícitas de entrada y
salida y límites de trabajo en curso: **En curso ≤ 3** y **En revisión ≤ 2**. Las políticas, la
simulación de flujo y el cuello de botella detectado están en [`docs/kanban.md`](docs/kanban.md).

## Comparación predictivo–ágil

La matriz de ocho criterios, los dos mini-planes y la conclusión sobre el enfoque híbrido recomendado
están en [`docs/comparacion-planificacion.md`](docs/comparacion-planificacion.md).

## Organización del repositorio

```
README.md                            este archivo
docs/product-backlog.md              backlog priorizado y decisiones
docs/sprint-1.md                     Sprint Goal, capacidad, DoR/DoD y tareas técnicas
docs/kanban.md                       políticas del tablero, WIP y simulación de flujo
docs/comparacion-planificacion.md    matriz predictivo–ágil y conclusión
docs/guia-entrega.md                 pasos en GitHub y lista de verificación
docs/capturas/                       capturas del backlog y del tablero del sprint
historias/HU-01.md … HU-16.md        cuerpo de cada historia, tal como se cargó en los Issues
scripts/                             scripts para crear los Issues y el Project con la CLI de GitHub
```
