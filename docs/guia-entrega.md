# Guía de entrega: qué hacer, en qué orden

Práctica de laboratorio Unidad 2 · Ingeniería de Software III (LCIK).
La entrega vive en GitHub: el docente evalúa el repositorio y el Project, no un documento.

## Resumen: ocho entregables

| # | Entregable | Dónde queda |
|---|---|---|
| 1 | URL del repositorio y URL del Project con acceso para el docente | Repositorio público o con el docente invitado |
| 2 | README con integrantes, roles, visión, Sprint Goal, capacidad y decisiones | `README.md` |
| 3 | Product Backlog con 15 historias o más y todos los campos completos | Issues + vista Table del Project |
| 4 | Tablero Kanban con cinco columnas, políticas y límites WIP | Vista Board del Project + `docs/kanban.md` |
| 5 | Vista del sprint actual con las historias seleccionadas y la suma de puntos | Vista filtrada por `iteration:@current` |
| 6 | Dos historias descompuestas en tareas técnicas | Lista de tareas dentro de los Issues HU-02 y HU-05 |
| 7 | Matriz predictivo–ágil y conclusión sobre el enfoque híbrido | `docs/comparacion-planificacion.md` |
| 8 | Dos capturas: backlog completo y tablero del sprint | `docs/capturas/` |

---

## Paso 1 · Crear el repositorio (5 minutos)

1. Crear el repositorio **`Ingenieria-de-Software-III-LCIK-equipo-XX`** (reemplazar `XX` por el número
   de equipo), público o privado con el docente invitado.
2. Verificar que **Issues** esté activado: *Settings → General → Features → Issues*.
3. Agregar a los cuatro integrantes como colaboradores: *Settings → Collaborators*.
4. Subir el contenido de esta carpeta al repositorio:

```bash
cd carpeta-de-la-entrega
git init -b main
git add .
git commit -m "docs: backlog, sprint 1, kanban y comparación predictivo-ágil"
git remote add origin https://github.com/<owner>/Ingenieria-de-Software-III-LCIK-equipo-XX.git
git push -u origin main
```

5. Completar en el `README.md` el número de equipo, los nombres de los integrantes 3 y 4 y las URLs.

## Paso 2 · Cargar las 16 historias como Issues (5 minutos con script, 40 a mano)

**Con la CLI de GitHub** (recomendado):

```bash
gh auth login                       # una sola vez
chmod +x scripts/*.sh
./scripts/01-crear-issues.sh <owner>/Ingenieria-de-Software-III-LCIK-equipo-XX
```

El script crea las etiquetas de epic, prioridad y puntos, y un Issue por cada archivo de `historias/`.
Si un Issue ya existe, lo omite: se puede volver a ejecutar sin duplicar nada.

**A mano:** crear un Issue por historia, con el título del archivo (por ejemplo,
*HU-02: Registrar una solicitud y obtener un número de seguimiento*) y pegando como cuerpo el contenido
de `historias/HU-02.md`.

## Paso 3 · Crear y configurar el Project (15 minutos)

**Con la CLI** (crea el Project, los campos y completa Priority, Epic, Story points y Business value):

```bash
gh auth refresh -s project,read:project     # permisos de Projects, una sola vez
./scripts/02-configurar-project.sh <owner> "IS3 U2 — Equipo XX" <owner>/Ingenieria-de-Software-III-LCIK-equipo-XX
```

**Después, en la interfaz web** (esto la CLI no lo hace):

1. **Campo Status.** Abrir el Project → menú `…` → *Settings* → campo **Status** → renombrar y ordenar
   las opciones: `Backlog`, `Preparada`, `En curso`, `En revisión`, `Hecha`.
2. **Campo Iteration.** *Settings* → *New field* → tipo **Iteration** → nombre `Iteration`, duración
   **2 semanas** → guardar. Asignar `Sprint 1` a HU-01, HU-02, HU-08, HU-03 y HU-05.
3. **Estados iniciales.** Poner en `Preparada` esas cinco historias; el resto queda en `Backlog`.
4. **Orden del backlog.** En la vista Table, arrastrar las filas para que queden en el orden 1 a 16 de
   `docs/product-backlog.md` (el orden manual es el que el docente va a mirar).

## Paso 4 · Crear las tres vistas obligatorias (10 minutos)

| Vista | Tipo | Configuración |
|---|---|---|
| **Product Backlog** | Table | Todos los ítems, agrupados por `Epic`, con las columnas Title, Status, Priority, Story points, Business value e Iteration. Orden manual por prioridad de ejecución. |
| **Kanban** | Board | Columnas por `Status`. En *Field sum* mostrar `Story points`; en cada columna, configurar el límite (`Set limit`): **En curso 3** y **En revisión 2**. Mostrar responsable, Priority y Story points en la tarjeta. |
| **Sprint actual** | Table o Board | Filtro `iteration:@current`. Mostrar la suma de `Story points` (debe dar **19**). |

Las políticas del tablero se copian en la descripción de la vista Board o quedan enlazadas a
`docs/kanban.md` desde el README.

## Paso 5 · Simular el flujo en el tablero (10 minutos)

Mover al menos tres historias por distintos estados, asignando responsable recién al entrar en
*Preparada* o *En curso*, y dejar el tablero al final del ejercicio como muestra `docs/kanban.md`:

1. HU-01, HU-02 y HU-08 → *Preparada*.
2. HU-01 y HU-02 → *En curso* (con responsable).
3. HU-08 → *En curso*: el límite de 3 queda alcanzado.
4. HU-01 → *En revisión* (revisor distinto del autor).
5. HU-01 → *Hecha* y recién entonces HU-03 → *En curso*.

El cuello de botella detectado y la acción acordada ya están escritos en `docs/kanban.md`; conviene que
el relator confirme que lo que dice el documento coincide con lo que se hizo en el tablero.

## Paso 6 · Capturas y cierre (10 minutos)

1. Captura 1: vista **Product Backlog** completa, con los campos visibles.
2. Captura 2: vista del **sprint** con las cinco historias y la suma de 19 puntos.
3. Guardarlas en `docs/capturas/` y enlazarlas desde el README. Las capturas **no reemplazan** los
   enlaces: el docente tiene que poder abrir el Project.
4. Verificar que el docente pueda abrir repositorio y Project (probar con una ventana de incógnito).
5. Nombre de la entrega: **`IS3_U2_EQUIPO-XX_APELLIDO1-APELLIDO2`**. El enlace debe seguir disponible
   hasta que termine la evaluación de la unidad.

---

## Lista de verificación antes de entregar (Anexo D de la práctica)

- [ ] El docente puede abrir el repositorio y el Project.
- [ ] Existen al menos 15 historias; ninguna es únicamente una tarea técnica.
- [ ] Todas las historias tienen prioridad, puntos, epic y valor.
- [ ] El backlog tiene un orden único y justificable (sin empates).
- [ ] El tablero contiene políticas y límites WIP visibles.
- [ ] La vista Sprint actual usa la iteración y no supera la capacidad (19 de 20 puntos).
- [ ] La matriz predictivo–ágil está completa y la conclusión menciona el enfoque híbrido.
- [ ] No hay datos personales, contraseñas ni información sensible.

---

## Preguntas de defensa: respuestas que sostiene esta entrega

Las respuestas tienen que salir de ustedes; acá va el razonamiento que respalda cada decisión tomada en
los artefactos. El docente puede elegir al azar quién responde.

**1. ¿Por qué la primera historia del backlog debe realizarse antes que la segunda?**
Porque HU-01 (catálogo de tipos de trámite con plazos y dependencia responsable) es una dependencia dura
de HU-02 (registrar la solicitud): sin un tipo de trámite no hay plazo legal que calcular ni dependencia
a la cual derivar. Si se invirtiera el orden, habría que corregir después los datos de las solicitudes ya
registradas. No es una preferencia técnica, es precedencia lógica.

**2. ¿Qué historia dividieron y qué criterio usaron para conservar el valor?**
La necesidad original «registrar una solicitud y adjuntar documentos» se dividió en HU-02 y HU-03. El
criterio fue que cada parte siguiera entregando valor por sí sola: registrar una solicitud y obtener un
número de seguimiento ya sirve al ciudadano aunque todavía no pueda adjuntar archivos. Además, juntas
superaban los 8 puntos que admite la Definition of Ready. En cambio, el aviso de archivo inválido **no**
se separó: es un criterio de aceptación de HU-03, no una historia, porque por sí solo no entrega valor.

**3. ¿Qué ocurriría si la capacidad real baja un 30 % durante el sprint?**
No se extiende el sprint ni se entregan historias a medias. Se reduce el alcance comprometido empezando
por la historia de menor prioridad de ejecución que aún no esté en curso —en este sprint, HU-03—, se
informa al Product Owner el mismo día en que se detecta y queda registrado en el Issue y en el README. El
Sprint Goal se mantiene mientras HU-01, HU-02 y HU-05 sigan en pie; si se pusiera en riesgo, se
replanifica el sprint con el Product Owner.

**4. ¿Qué evidencia permite afirmar que una historia está Hecha?**
Los criterios de aceptación verificados uno por uno por una persona distinta del responsable, la
evidencia o el prototipo enlazado en el Issue, ninguna tarea abierta ni bloqueo sin registrar, los campos
Status, Priority, Story points, Epic e Iteration actualizados en el Project, y la documentación
actualizada si la historia cambió una decisión del equipo. La traza queda en el historial del Issue: no
alcanza con moverla de columna.

**5. ¿Dónde usarían control predictivo y dónde inspección y adaptación ágil?**
Control predictivo en lo normativo y estable: plazos legales, estados obligatorios del trámite, roles y
permisos, bitácora auditable e hitos de aprobación institucional; ahí un cambio tiene costo real y se
gestiona con control formal. Inspección y adaptación ágil en lo que evoluciona con el piloto: usabilidad
del registro, contenido y frecuencia de las notificaciones, forma de los reportes y orden de
incorporación de las dependencias. Por eso la conclusión de la matriz recomienda un enfoque híbrido.
