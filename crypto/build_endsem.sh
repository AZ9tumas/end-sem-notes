#!/usr/bin/env bash
# usage: ./build_endsem.sh  -> builds cns_endsem_notes.pdf (3 passes) and then cns_endsem_questions.pdf (2 passes;
# it reads cns_endsem_notes.aux through xr so that "Section 17" in the question bank matches the notes)
cd "$(dirname "$0")"
for doc in cns_endsem_notes cns_endsem_questions; do
  passes=3; [ $doc = cns_endsem_questions ] && passes=2
  for i in $(seq $passes); do xelatex -interaction=nonstopmode $doc.tex > /dev/null 2>&1; done
  echo "== $doc"
  grep -n -A3 "^! " $doc.log | head -30
  grep -c "Overfull \\\\hbox" $doc.log | sed 's/^/overfull hboxes: /'
  grep "Overfull \\\\hbox" $doc.log | sed -E 's/.*\(([0-9.]+)pt too wide\).*lines ([0-9-]+).*/\1pt lines \2/' | awk '$1+0 > 10' | head -10
  grep -E "Reference .* undefined|multiply defined" $doc.log | sort | uniq | head -20
  pdfinfo $doc.pdf 2>/dev/null | grep Pages || echo "NO PDF"
done
