# End-sem notes

## Cryptography & Network Security (CSN15403, MNNIT)

| File | What it is |
|---|---|
| [`crypto/cns_endsem_notes.pdf`](crypto/cns_endsem_notes.pdf) | **End-sem notes** (≈250 pages): Lectures 1–18 explained in full, plus the syllabus topics the slides skip (modes of operation, PGP/S-MIME, IPSec, SSL/TLS, SET, firewalls) and the teacher's assignment topics. Starts with a study roadmap, ends with a formula sheet. |
| [`crypto/cns_endsem_questions.pdf`](crypto/cns_endsem_questions.pdf) | **Question bank** (≈70 pages): chapter-wise theory questions and practice numericals with answers, both previous end-sem papers and both mid-sem papers fully solved, the drill bank, the practice set with answer key, and two mock end-sem papers with model answers (Paper B in the exact real format). |
| `crypto/papers/` | The two previous end-sem papers (2023-24, 2025-26); both are solved in the question bank. |
| `crypto/cns_notes.pdf`, `crypto/mock_midsem.pdf` | The earlier mid-sem notes and mock (Lectures 1–14). |
| `crypto/CLASS NOTES/` | The class slides. |

Rebuild (XeLaTeX, Fira fonts): `cd crypto && ./build_endsem.sh`. One chapter alone: `./build_one.sh 20_mac_signatures`, one question file: `./build_q.sh q_20_mac_signatures`.
