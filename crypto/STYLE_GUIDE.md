# CNS (Cryptography & Network Security) notes — writer's guide (read fully before writing)

## Context
- Student: B.Tech CSE 5th sem, MNNIT Allahabad. Course CSN15403, teacher Dr. J Sathish Kumar. MID-SEM soon:
  90 min, 25 marks, 5–7 questions, "Precise answer with proper justification will be considered to get complete marks."
- Mid-sem syllabus = Lectures 1–14 (up to "Message Integrity"). L15–18 (MAC, signatures, key mgmt, entity auth) are NOT in it.
- The class slides are NOT the only source: questions are lifted almost word for word from **Forouzan** (Cryptography &
  Network Security) and **Stallings**. Write the standard textbook content for each topic even where the slides are thin,
  and phrase worked examples the way Forouzan/Stallings exercises are phrased.
- Past papers, verbatim text: /private/tmp/claude-501/-Users-az9umas-Desktop-crypto/65b72176-74b2-4f1a-9b2f-3b6021ebb43f/scratchpad/papers.txt
  (solved in sections/98_exams.tex). Marks by topic over both papers (50 marks total):
  classical ciphers 20 (Playfair 3+4, OTP-Vigenère 8, cipher property 2, keyed transposition/attack type 3);
  extended Euclid inverse with "iteration k" sub-questions 5, Diophantine 3; GF(2^8) inverse 4+4;
  GF(7) division + Fermat exponent reduction + inverse-may-not-exist 3; DES (Feistel, round function, key generation,
  pseudocode for S-box and key generation) 5; AES (ShiftRows, AddRoundKey on a given state) 6.
  NOTHING from L10–L14 (primes, CRT, RSA, ElGamal, ECC, hashing) was asked — those lectures are new in this year's
  mid-sem syllabus, so expect at least one Forouzan-style numerical or theory question from them.

## Importance markers (the user explicitly asked for starred important topics)
Put the marker at the END of the \subsection title, e.g. `\subsection{Inverse in GF$(2^8)$ \hothot}`:
- `\hothot` = asked in BOTH past papers.   `\hot` = asked once, or essential for an asked topic.
- `\new` = new in this year's syllabus and likely (blue triangle).   No marker = read once, low priority.
Directly under a starred/new subsection heading add ONE line:
- `\asked{2024--25 Q4 (4 marks), 2025--26 Q2 (4 marks): inverse of $x^5$ / $x^7$.}`  (what was asked, marks)
- or `\likely{RSA key generation + encrypt/decrypt with small primes, Forouzan style.}` (what to expect)
Use `\begin{mustknow}...\end{mustknow}` (gold box) for the 1–2 facts/formulas per section that must be memorised,
`\imp{...}` (yellow highlight) sparingly for the exact sentence to write in an exam definition.

## Preamble tools (preamble.tex — do NOT edit it; extra macros via \providecommand with unique names in your file)
Boxes: keybox[title=..], mustknow[: suffix], intuition, worked[: title] (breakable), trap[: suffix], examtip, fixbox,
mnemonic. Macros: \hot \hothot \new \asked{} \likely{} \imp{} \ttx{} \hl{} (TABLE CELL highlight only),
\checkmark, $\bigstar$. TikZ styles: box, circ, arr, darr. Packages: amsmath, unicode-math (Fira Math), tikz, tcolorbox,
booktabs, tabularx, enumitem, xcolor, colortbl. Colours (Atom One Light): acc (blue), warn (red), ok/good (green),
gold, gray, orange, magenta. Engine: XeLaTeX (fonts Fira Sans / AnnotationM mono). The mono font is WIDE: keep \ttx
strings and math in table cells short, or you get overfull boxes.

## Output and build
- Project: /Users/az9umas/Desktop/crypto/. Edit ONLY your own files in sections/ (names in your task). Keep each file's
  existing \section{...}\label{...} labels (others \ref them) and add the label given in your task if missing.
- Build: cd /Users/az9umas/Desktop/crypto && ./build_one.sh <name-without-.tex> → build/<name>/test.pdf (0 errors,
  no overfull > 10pt). Render pages with diagrams/tables (pdftoppm -r 70 -png) into YOUR scratch dir and LOOK at them.
- Scratch: /private/tmp/claude-501/-Users-az9umas-Desktop-crypto/65b72176-74b2-4f1a-9b2f-3b6021ebb43f/scratchpad/<your-name>/
- NEVER run rm, pkill, or anything destructive. Never create folders named notes/sections/source outside your scratch dir.
- Edit with Write for your own section files (they are yours to rewrite) — but write in a few chunks if the file is
  long (e.g. write part 1, then append with Edit), so a network hiccup does not lose everything.

## Sources
- Current section files (sections/*.tex): their FACTS AND NUMBERS were already verified by script — reuse them, keep
  every worked example unless it is wrong, keep fixbox items (slide errors). Backup of the old version:
  build/v1_backup/sections/.
- Class slides OCR: /private/tmp/claude-501/-Users-az9umas-Desktop-crypto/65b72176-74b2-4f1a-9b2f-3b6021ebb43f/scratchpad/L<N>.txt
  (N = 4, 6..14; "=== L10-07.txt" marks slide 7). Slide images (150 dpi): scratchpad/img/L<N>-<page>.png — Read the
  PNG when OCR is garbled (tables, matrices, diagrams). Original PDFs: /Users/az9umas/Desktop/crypto/CLASS NOTES/.

## WRITING STYLE (most important — the user's explicit requirement)
The user approved this model answer (from another subject); copy its tone:

  Circuit Switching. In circuit switching, a fixed share of every link along the path is reserved for one
  conversation before any data is sent. This allows the data to flow through the reserved path at a constant rate,
  without waiting behind anyone else's traffic. The reservation is kept until the conversation is over, even during
  moments when nothing is being sent. Since this was used in old telephone networks, the main traffic was voice
  calls, which need a steady rate for their whole duration.
  Advantages. The main advantage is a continuous, guaranteed rate with constant delay. ...
  Disadvantages. Since the entire path is reserved for one conversation, the reserved capacity is wasted whenever
  that conversation is silent ...

Rules:
1. Each topic: the PROBLEM it solves → the IDEA → the MECHANISM, in connected paragraphs of complete sentences that
   link cause to effect ("Since…, …", "This allows…", "As a result…"). Then edge cases, then a worked example.
   Advantages./Disadvantages. (or Security.) paragraphs where there is a trade-off.
2. Define every term at first use inside the sentence. Derive results instead of stating them (why d = e^{-1} mod φ(n)
   makes decryption work, why collisions cost 2^{n/2}, why ShiftRows gives diffusion, why GF(2^8) not Z_256).
3. DENSE, adult, not verbose, not childish. The user already knows school maths and what mod/gcd are — no analogies
   or padding for those (they explicitly asked earlier to cut "intuition padding for things I know"). Short paragraphs
   (2–6 sentences). No filler like "Let's dive in".
4. Bullets only for genuinely list-like content (steps of an algorithm, list of attacks), each item a full sentence.
   Tables for computation traces (extended-Euclid tables, square-and-multiply, Miller–Rabin, point lists) and as
   summaries AFTER the prose.
5. Exam-format worked examples: every computational topic gets at least one `worked` box written as a Forouzan-style
   question + a full, justified answer laid out exactly as it should be written in the exam (tables with headed
   columns, every intermediate value, a final boxed/bold answer, a one-line check). Where a past paper asked it, use
   that question (cite it). Add 1 new exam-style example for each \new topic.
6. Boxes sparingly: worked examples, at most 1–2 mustknow per section, traps for real pitfalls. Boxes in full sentences.
7. End each section with `\subsection*{Check your understanding}` — 6–10 likely theory/numerical questions with crisp
   answers in full sentences ("Differentiate…", "Why…", "What happens if…", a small numerical).
8. Keep the `fixbox` (slide errors) at the end of the section, before Check your understanding or after it.
9. Correctness is non-negotiable: recompute EVERY number you write (new or old) with a Python script in your scratch
   dir (pow(a,b,n), extended Euclid, GF(2^8) arithmetic, CRT, EC point arithmetic, etc.). If a slide is wrong, write
   the correct value and note it in the fixbox.
