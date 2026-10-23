# Study Material: Relatively Prime Numbers & Euler's Totient Function (3 videos)

> Gemini notes, condensed: slide text, worked examples, homework and flags kept. Section 5 = Claude's verification.

## 1. Outline
- **V1 Relatively prime:** [00:35] GCD recap · [00:57] definition · [02:12] 4 & 13 · [04:07] 15 & 21 · [05:17] gcd(83,19) recap · [05:58] scenarios table · [09:02] homework gcd(790,121)
- **V2 Totient (concept):** [00:38] definition · [01:03] Φ(5) · [04:29] Φ(11) · [05:58] Φ(8) · [07:34] need for formulas
- **V3 Totient (formulas):** [01:04] three criteria · [04:02] Φ(5) · [04:54] Φ(31) · [05:33] Φ(35) · [06:35] check table · [07:37] Φ(25) pitfall · [08:28] Φ(1000) · [11:18] Φ(7000) · [12:08] homework Φ(369), Φ(372)

## 2. Slides
```text
GCD
❖ GCD - Greatest Common Divisor.
❖ HCF - Highest Common Factor.
Relatively Prime Numbers
Two numbers are said to be relatively prime, if they have no prime factors in common, and their only common factor is 1.
❖ If GCD(a, b) = 1 then 'a' and 'b' are relatively prime numbers.
❖ Co-prime.
Q1: Are 4 and 13 relatively prime?  4: 1,2,4 | 13: 1,13 | common 1 | GCD 1 → Yes
Q2: Are 15 and 21 relatively prime? 15: 1,3,5,15 | 21: 1,3,7,21 | common 1,3 | GCD 3 → No
Table: 11,17 → 1, Yes (both prime) | 11,21 → 1, Yes (prime, composite) | 12,77 → 1, Yes (both composite)
Homework: Find the GCD(790, 121) using Euclid's algorithm and determine whether they are relatively prime or not.

Euler's Totient Function
❖ Denoted as Φ(n).
❖ Φ(n) = Number of positive integers less than 'n' that are relatively prime to n.
Φ(5): gcd(1..4, 5) all 1 → 4
Φ(11): gcd(1..10, 11) all 1 → 10
Φ(8): gcd = 1,2,1,4,1,2,1 → 4

Criteria of 'n'                         | Formula
'n' is prime.                           | Φ(n) = (n - 1)
n = p × q. 'p' and 'q' are primes.      | Φ(n) = (p - 1) × (q - 1)
n = a × b. Either/both composite.       | Φ(n) = n × (1 - 1/p1) × (1 - 1/p2) ... (distinct primes)

Φ(5) = 4;  Φ(31) = 30;  Φ(35) = (5-1)(7-1) = 24 (verified by full 34-entry gcd table)
Φ(25): NOT (5-1)(5-1) = 16 — p, q must be distinct → 25(1 - 1/5) = 20
Φ(1000) = 1000 (1 - 1/2)(1 - 1/5) = 400   (1000 = 2³ × 5³)
Φ(7000) = 7000 (1/2)(4/5)(6/7) = 2400     (7000 = 2³ × 5³ × 7)
Homework: 1. Find Φ(369). 2. Find Φ(372).
```

## 3. Gemini flags
- Slide definition of relatively prime is redundant but correct.
- "Criteria 3" formula is actually universal.
- Euclid recap skips quotients; speaker mentions "other formulas" for criteria 3 without showing them.

## 4. Glossary
GCD/HCF · relatively prime (co-prime) · prime · composite · Euclidean algorithm · Euler's totient Φ(n) · distinct prime factors · Euler's product formula.

## 5. Verification (Claude)
- All values recomputed by script: Φ(5)=4, Φ(11)=10, Φ(8)=4, Φ(35)=24, Φ(25)=20, Φ(1000)=400, Φ(7000)=2400 — **correct**.
- Homework: **gcd(790,121) = 1** (relatively prime; 790 = 6·121+64, 121 = 64+57, 64 = 57+7, 57 = 8·7+1); **Φ(369) = 240**, **Φ(372) = 120** (Gemini's answers correct).
- Note: standard convention Φ(1) = 1.
- Added: prime-power and multiplicative formulas, RSA link (Φ(187) = 160, 7·23 ≡ 1), practice groups L (Q48–Q53) and M ★ challenge set (Q54–Q64).
