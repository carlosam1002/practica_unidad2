# Tablero Kanban: políticas explícitas, límites WIP y simulación de flujo

Sistema web de gestión de solicitudes ciudadanas · Práctica de laboratorio Unidad 2.

El tablero es la vista **Board** del Project, con columnas basadas en el campo *Status*. Cada tarjeta
muestra responsable, *Priority* y *Story points*.

## Columnas y políticas explícitas

| Columna | Significa | Para entrar hace falta | Para salir hace falta |
|---|---|---|---|
| **Backlog** | Historia identificada, todavía no lista para trabajar. | Estar registrada como Issue con rol, valor y criterios. | Cumplir la Definition of Ready. |
| **Preparada** | Lista para tomarse en el sprint actual. | Definition of Ready completa, estimación acordada e iteración asignada. | Que alguien del equipo la tome como responsable. |
| **En curso** | Hay un responsable y una tarea verificable en marcha. | Responsable asignado y el límite WIP no está superado. | Todas las tareas técnicas cerradas y la evidencia enlazada. |
| **En revisión** | Terminada por su autor; espera validación de otra persona. | Que el revisor sea distinto del responsable. | Criterios de aceptación verificados uno por uno. |
| **Hecha** | Cumple criterios de aceptación y Definition of Done. | Revisión aprobada y campos del Project actualizados. | — |

## Límites de trabajo en curso (WIP)

- **En curso ≤ 3** (equipo de cuatro personas, para que nadie tenga dos historias abiertas a la vez).
- **En revisión ≤ 2**.
- Si se alcanza un límite, **la regla es terminar antes de empezar**: quien iba a tomar una historia nueva
  primero revisa o ayuda a cerrar lo que está en la columna bloqueada.

> GitHub Projects permite mostrar el límite por columna, pero no impide superarlo. El límite es una señal
> de gestión: lo hace cumplir el equipo, y el facilitador lo verifica en la coordinación diaria.

## Asignación de responsables

Las historias **no tienen responsable mientras están en Backlog**. Se asigna al pasar a *Preparada* o a
*En curso*, para que la asignación refleje quién está trabajando de verdad y no un reparto anticipado.

## Simulación de flujo realizada

| Momento | Movimiento | Observación |
|---|---|---|
| 1 | HU-01, HU-02 y HU-08 pasan de Backlog a Preparada | Cumplen la Definition of Ready y se les asigna Iteration = Sprint 1. |
| 2 | HU-01 y HU-02 pasan a En curso con responsable | WIP en curso = 2 de 3. |
| 3 | HU-08 pasa a En curso | WIP en curso = 3 de 3: el límite queda alcanzado. |
| 4 | HU-01 pasa a En revisión | La revisa un integrante distinto del que la desarrolló. |
| 5 | HU-05 queda en Preparada, sin tomar | No se toma nada nuevo hasta liberar cupo: es la política de límite WIP en acción. |
| 6 | HU-01 pasa a Hecha y HU-03 entra a En curso | El flujo se reanuda al liberarse el cupo. |

## Cuello de botella detectado y acción del equipo

**Qué pasó:** al llegar HU-01 y HU-02 casi juntas a *En revisión*, la columna alcanzó su límite de 2 y
*En curso* quedó con trabajo terminado que no podía avanzar. La causa no fue la velocidad de desarrollo:
una sola persona estaba haciendo todas las revisiones.

**Acción acordada:** (1) la revisión pasa a ser responsabilidad rotativa, con un segundo revisor
habilitado; (2) se aplica la regla «antes de tomar una historia nueva, reviso lo que está esperando»;
(3) el facilitador informa en la coordinación diaria cuántas tarjetas hay en *En revisión*, para que el
cuello se vea antes de bloquear el flujo.

**Cómo se comprueba que mejoró:** se observa el tiempo que una historia permanece en *En revisión* y la
cantidad de días en que la columna estuvo en su límite. Si ambos bajan en el siguiente sprint, la acción
funcionó.

## Métricas de flujo que el equipo observa

- **Trabajo en curso:** cantidad de tarjetas por columna, revisada a diario.
- **Tiempo de ciclo:** días desde que una historia entra a *En curso* hasta que llega a *Hecha*.
- **Historias terminadas por sprint** y puntos completados frente a los comprometidos.
- **Retrabajo:** historias que vuelven de *En revisión* a *En curso*, con su motivo.
