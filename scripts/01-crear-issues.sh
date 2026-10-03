#!/usr/bin/env bash
# Crea las 16 historias de usuario como Issues del repositorio, con etiquetas de
# epic, prioridad y puntos.
#
#   Uso:  ./scripts/01-crear-issues.sh <owner>/<repositorio>
#   Ej.:  ./scripts/01-crear-issues.sh mi-usuario/Ingenieria-de-Software-III-LCIK-equipo-07
#
# Requiere la CLI de GitHub autenticada:  gh auth login
set -euo pipefail

REPO="${1:-}"
if [[ -z "$REPO" ]]; then
  echo "Falta el repositorio. Uso: $0 <owner>/<repositorio>" >&2
  exit 1
fi
command -v gh >/dev/null || { echo "No se encontró 'gh'. Instalá la CLI de GitHub: https://cli.github.com" >&2; exit 1; }
gh auth status >/dev/null || { echo "Ejecutá 'gh auth login' primero." >&2; exit 1; }

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TSV="$BASE/scripts/historias.tsv"
[[ -f "$TSV" ]] || { echo "No se encontró $TSV" >&2; exit 1; }

echo "==> Creando etiquetas en $REPO"
crear_etiqueta() { gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force >/dev/null; }
crear_etiqueta "historia de usuario" "0E8A16" "Issue que representa una historia de usuario"
for e in Registro Seguimiento Gestión Notificaciones Reportes; do
  crear_etiqueta "epic:$e" "1D76DB" "Epic $e"
done
for p in Must Should Could "Won't"; do
  crear_etiqueta "prioridad:$p" "FBCA04" "Prioridad MoSCoW $p"
done
for sp in 1 2 3 5 8; do
  crear_etiqueta "puntos:$sp" "C5DEF5" "Story points: $sp"
done

echo "==> Creando Issues"
# El TSV tiene cabecera: id, titulo, epic, prioridad, puntos, valor, orden, sprint
tail -n +2 "$TSV" | while IFS=$'\t' read -r id titulo epic prioridad puntos valor orden sprint; do
  cuerpo="$BASE/historias/$id.md"
  [[ -f "$cuerpo" ]] || { echo "  !! falta $cuerpo, se omite $id" >&2; continue; }
  if gh issue list --repo "$REPO" --state all --search "\"$id\" in:title" --json title \
       --jq '.[].title' | grep -q "^$id:"; then
    echo "  == $id ya existe, se omite"
    continue
  fi
  url=$(gh issue create --repo "$REPO" \
        --title "$titulo" \
        --body-file "$cuerpo" \
        --label "historia de usuario" \
        --label "epic:$epic" \
        --label "prioridad:$prioridad" \
        --label "puntos:$puntos")
  echo "  ++ $id  $url"
done

echo
echo "Listo. Ahora ejecutá:  ./scripts/02-configurar-project.sh <owner> \"<título del Project>\" $REPO"
