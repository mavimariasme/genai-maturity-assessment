#!/usr/bin/env bash
#
# mermaid-to-png.sh — converte diagramas Mermaid em PNG.
#
# Faz parte da skill genai-maturity-crossanalysis. Rode apenas quando o
# usuário pedir a exportação dos diagramas.
#
# Uso:
#   mermaid-to-png.sh <entrada> [saida] [opções]
#
#   <entrada>  Arquivo .md (extrai todos os blocos ```mermaid) ou .mmd (único).
#   [saida]    Diretório de saída dos PNGs. Padrão: ./mermaid-png
#
# Opções:
#   -s, --scale <n>        Fator de escala (padrão: 3, alta resolução).
#   -t, --theme <tema>     Tema mermaid: default|dark|forest|neutral (padrão: default).
#   -b, --background <cor> Cor de fundo: ex. white, transparent (padrão: white).
#   -h, --help             Mostra esta ajuda.
#
# Requisitos: Node.js + npx. Usa @mermaid-js/mermaid-cli sob demanda (npx),
# sem instalação global.

set -euo pipefail

SCALE=3
THEME="default"
BACKGROUND="white"
INPUT=""
OUTDIR="./mermaid-png"
POSITIONAL=()

print_help() {
  # imprime o cabeçalho de comentário (linhas iniciadas por #), parando na 1ª linha de código
  awk 'NR==1{next} /^#/{sub(/^# ?/,""); print; next} {exit}' "$0"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) print_help; exit 0 ;;
    -s|--scale) SCALE="$2"; shift 2 ;;
    -t|--theme) THEME="$2"; shift 2 ;;
    -b|--background) BACKGROUND="$2"; shift 2 ;;
    -*) echo "Opção desconhecida: $1" >&2; exit 1 ;;
    *) POSITIONAL+=("$1"); shift ;;
  esac
done

if [[ ${#POSITIONAL[@]} -lt 1 ]]; then
  echo "Erro: informe o arquivo de entrada (.md ou .mmd)." >&2
  echo "Use --help para detalhes." >&2
  exit 1
fi

INPUT="${POSITIONAL[0]}"
if [[ ${#POSITIONAL[@]} -ge 2 ]]; then
  OUTDIR="${POSITIONAL[1]}"
fi

if [[ ! -f "$INPUT" ]]; then
  echo "Erro: arquivo não encontrado: $INPUT" >&2
  exit 1
fi

# Verifica dependências.
if ! command -v node >/dev/null 2>&1; then
  echo "Erro: Node.js não encontrado. Instale Node.js para usar o mermaid-cli." >&2
  echo "  macOS:  brew install node" >&2
  echo "  ou:     https://nodejs.org/" >&2
  exit 1
fi
if ! command -v npx >/dev/null 2>&1; then
  echo "Erro: npx não encontrado (vem com o Node.js >= 8)." >&2
  exit 1
fi

mkdir -p "$OUTDIR"

# Config do puppeteer para ambientes sem sandbox (CI/containers).
PUPPETEER_CFG="$(mktemp -t puppeteer-XXXX.json)"
cat > "$PUPPETEER_CFG" <<'JSON'
{ "args": ["--no-sandbox", "--disable-setuid-sandbox"] }
JSON

render() {
  # $1 = arquivo .mmd de entrada ; $2 = arquivo .png de saída
  echo "  → $(basename "$2")"
  npx -y -p @mermaid-js/mermaid-cli mmdc \
    -i "$1" \
    -o "$2" \
    -s "$SCALE" \
    -t "$THEME" \
    -b "$BACKGROUND" \
    -p "$PUPPETEER_CFG" \
    >/dev/null
}

base="$(basename "${INPUT%.*}")"
ext="${INPUT##*.}"

if [[ "$ext" == "mmd" ]]; then
  echo "Renderizando diagrama único: $INPUT"
  render "$INPUT" "$OUTDIR/$base.png"
  echo "Concluído. PNG em: $OUTDIR/$base.png"
  rm -f "$PUPPETEER_CFG"
  exit 0
fi

# Caso .md (ou outro): extrai blocos ```mermaid em arquivos temporários.
echo "Extraindo blocos mermaid de: $INPUT"
TMPDIR_BLOCKS="$(mktemp -d -t mermaid-blocks-XXXX)"
trap 'rm -rf "$TMPDIR_BLOCKS" "$PUPPETEER_CFG"' EXIT

awk -v dir="$TMPDIR_BLOCKS" '
  /^[[:space:]]*```[[:space:]]*mermaid[[:space:]]*$/ { inblock=1; n++; fname=sprintf("%s/block-%02d.mmd", dir, n); next }
  /^[[:space:]]*```[[:space:]]*$/ { if (inblock) { inblock=0; close(fname) }; next }
  { if (inblock) print > fname }
' "$INPUT"

count=$(find "$TMPDIR_BLOCKS" -name 'block-*.mmd' | wc -l | tr -d ' ')
if [[ "$count" -eq 0 ]]; then
  echo "Nenhum bloco \`\`\`mermaid encontrado em $INPUT." >&2
  exit 1
fi

echo "Encontrados $count diagrama(s). Renderizando..."
i=0
for f in "$TMPDIR_BLOCKS"/block-*.mmd; do
  i=$((i+1))
  render "$f" "$OUTDIR/${base}-${i}.png"
done

echo "Concluído. $count PNG(s) em: $OUTDIR/"
