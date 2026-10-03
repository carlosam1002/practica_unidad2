#!/usr/bin/env bash
# Crea el Project, sus campos personalizados, agrega los Issues del repositorio y
# completa Priority, Story points, Epic y Business value de cada historia.
#
#   Uso:  ./scripts/02-configurar-project.sh <owner> "<título del Project>" <owner>/<repositorio>
#   Ej.:  ./scripts/02-configurar-project.sh mi-usuario "IS3 U2 — Equipo 07" mi-usuario/Ingenieria-de-Software-III-LCIK-equipo-07
#
# Requisitos:
#   - gh (CLI de GitHub) autenticada con permisos de Projects:
#       gh auth refresh -s project,read:project
#   - jq
#
# Lo que NO puede hacer la CLI y queda para la interfaz web (ver docs/guia-entrega.md):
#   - renombrar las opciones del campo Status (Backlog, Preparada, En curso, En revisión, Hecha)
#   - crear el campo de tipo Iteration (Sprint 1, dos semanas)
#   - crear las vistas Table/Board y mostrar los límites WIP
set -euo pipefail

OWNER="${1:-}"; TITULO="${2:-}"; REPO="${3:-}"
if [[ -z "$OWNER" || -z "$TITULO" || -z "$REPO" ]]; then
  echo "Uso: $0 <owner> \"<título del Project>\" <owner>/<repositorio>" >&2
  exit 1
fi
command -v gh >/dev/null || { echo "Falta 'gh': https://cli.github.com" >&2; exit 1; }
command -v jq >/dev/null || { echo "Falta 'jq': https://jqlang.github.io/jq/" >&2; exit 1; }

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TSV="$BASE/scripts/historias.tsv"

echo "==> Creando el Project «$TITULO»"
NUM=$(gh project create --owner "$OWNER" --title "$TITULO" --format json | jq -r '.number')
PID=$(gh project view "$NUM" --owner "$OWNER" --format json | jq -r '.id')
echo "    número: $NUM   id: $PID"

echo "==> Creando campos personalizados"
crear_campo() { # nombre  tipo  [opciones]
  if [[ "$2" == "SINGLE_SELECT" ]]; then
    gh project field-create "$NUM" --owner "$OWNER" --name "$1" --data-type SINGLE_SELECT \
       --single-select-options "$3" >/dev/null
  else
    gh project field-create "$NUM" --owner "$OWNER" --name "$1" --data-type "$2" >/dev/null
  fi
  echo "    + $1"
}
crear_campo "Priority" SINGLE_SELECT "Must,Should,Could,Won't"
crear_campo "Epic" SINGLE_SELECT "Registro,Seguimiento,Gestión,Notificaciones,Reportes"
crear_campo "Story points" NUMBER
crear_campo "Business value" NUMBER

echo "==> Agregando los Issues del repositorio al Project"
gh issue list --repo "$REPO" --state all --limit 100 --json url --jq '.[].url' | while read -r url; do
  gh project item-add "$NUM" --owner "$OWNER" --url "$url" >/dev/null
  echo "    + $url"
done

echo "==> Leyendo identificadores de campos e ítems"
CAMPOS=$(gh project field-list "$NUM" --owner "$OWNER" --limit 50 --format json)
ITEMS=$(gh project item-list "$NUM" --owner "$OWNER" --limit 100 --format json)
id_campo()  { jq -r --arg n "$1" '.fields[] | select(.name==$n) | .id' <<<"$CAMPOS"; }
id_opcion() { jq -r --arg n "$1" --arg o "$2" '.fields[] | select(.name==$n) | .options[] | select(.name==$o) | .id' <<<"$CAMPOS"; }
id_item()   { jq -r --arg t "$1" '.items[] | select(.content.title // "" | startswith($t)) | .id' <<<"$ITEMS"; }

F_PRIO=$(id_campo "Priority"); F_EPIC=$(id_campo "Epic")
F_SP=$(id_campo "Story points"); F_BV=$(id_campo "Business value")

echo "==> Completando los campos de cada historia"
tail -n +2 "$TSV" | while IFS=$'\t' read -r id titulo epic prioridad puntos valor orden sprint; do
  item=$(id_item "$id:")
  if [[ -z "$item" ]]; then echo "    !! no se encontró el ítem de $id" >&2; continue; fi
  gh project item-edit --id "$item" --project-id "$PID" --field-id "$F_PRIO" \
     --single-select-option-id "$(id_opcion "Priority" "$prioridad")" >/dev/null
  gh project item-edit --id "$item" --project-id "$PID" --field-id "$F_EPIC" \
     --single-select-option-id "$(id_opcion "Epic" "$epic")" >/dev/null
  gh project item-edit --id "$item" --project-id "$PID" --field-id "$F_SP" --number "$puntos" >/dev/null
  gh project item-edit --id "$item" --project-id "$PID" --field-id "$F_BV" --number "$valor" >/dev/null
  echo "    $id  Priority=$prioridad  Epic=$epic  SP=$puntos  BV=$valor"
done

echo
echo "Project listo: $(gh project view "$NUM" --owner "$OWNER" --format json | jq -r '.url')"
cat <<'FIN'

Falta hacer a mano en la interfaz web (cinco minutos, ver docs/guia-entrega.md):
  1. Campo Status: renombrar y ordenar las opciones como
     Backlog · Preparada · En curso · En revisión · Hecha
  2. Crear el campo Iteration (tipo Iteration, iteraciones de dos semanas) y
     asignar Sprint 1 a HU-01, HU-02, HU-08, HU-03 y HU-05.
  3. Crear las tres vistas: Product Backlog (Table, agrupada por Epic),
     Kanban (Board por Status, con límites En curso 3 y En revisión 2) y
     Sprint actual (filtro iteration:@current, con la suma de Story points).
  4. Ordenar manualmente el backlog según la columna "orden" de scripts/historias.tsv.
FIN
