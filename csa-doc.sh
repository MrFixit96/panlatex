  
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pandoc -s --pdf-engine xelatex \
  --template $SCRIPT_DIR/../LaTeX/eisvogel \
  --listings -M date="`date "+%d %B %Y"`" \
  --filter=pandoc-url2cite \
  --filter=pandoc-citeproc \
  --filter=pandoc-latex-environment \
  -o ${1%.md}.pdf $1 && open ${1%.md}.pdf

#  --top-level-division=chapter \
