#!/usr/bin/env bash
# usage: ./build_q.sh q_20_mac_signatures   -> compiles ONLY questions/<name>.tex into build/<name>/test.pdf; prints errors/overfull boxes
cd "$(dirname "$0")"
n=$1; d=build/$n; mkdir -p $d
cat > $d/test.tex <<TEX
\documentclass[10pt,a4paper]{article}
\input{../../preamble}
\begin{document}
\input{../../questions/$n}
\end{document}
TEX
cd $d
for i in 1 2; do xelatex -interaction=nonstopmode -halt-on-error test.tex > /dev/null 2>&1; done
grep -n -A3 "^! " test.log | head -40
grep -c "Overfull \\\\hbox" test.log | sed 's/^/overfull hboxes: /'
grep "Overfull \\\\hbox" test.log | awk '{print $3,$4,$5,$6,$7,$8}' | sort | uniq -c | sort -rn | head -8
grep -E "undefined" test.log | head -5
pdfinfo test.pdf 2>/dev/null | grep Pages || echo "NO PDF"
