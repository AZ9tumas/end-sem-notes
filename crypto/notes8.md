# Study Material: Modular Exponentiation (Part 1 & 2)

> Gemini notes, condensed: slide text, all examples, homework and flags kept. Section 5 = Claude's verification.

## 1. Outline
- **Part 1:** [00:00] Intro · [00:23] Definition a^b mod m (examples 2^33 mod 30, 3^100 mod 29) · [01:36] 23^3 mod 30 · [05:11] 31^500 mod 30 · [06:28] 242^329 mod 243 · [08:18] 11^7 mod 13
- **Part 2:** [00:00] Importance (RSA, Diffie–Hellman, ECC, Rabin) · [01:11] Repeated squaring logic · [01:54] 88^7 mod 187 · [07:02] last two digits of 29^5 · [12:35] 3^100 mod 29 · [16:25] 23^16 mod 30 · [18:50] Homework

## 2. Part 1 slides
```text
Modular Exponentiation
❖ It is a type of exponentiation performed over a modulus.
❖ a^b mod m or a^b (mod m).
Examples: 2^33 mod 30   3^100 mod 29

Example 1: 23^3 mod 30 = -7^3 mod 30 (23 mod 30 can be 23 or -7) = -7^2 x -7 = 49 x -7 = -133 mod 30 = -13 mod 30 = 17
Example 2: 31^500 mod 30 = 1^500 mod 30 = 1
Example 3: 242^329 mod 243 = -1^329 mod 243 (-1^328 x -1^1) = -1 mod 243 = 242
Example 4: 11^7 mod 13 = (11 mod 13)^7 = -2 x ... x -2 = -128 mod 13 = -11 mod 13 = 2   (or (-2)^7 mod 13)
```
- Mod applies to the whole power. Reduce big bases to small (possibly negative) residues first.

## 3. Part 2 slides
- Repeated squaring: a^1, a^2 = a·a, a^4 = a^2·a^2, … up to largest power of 2 ≤ b; multiply the needed ones.
```text
Example 1: 88^7 mod 187
88^1 = 88;  88^2 = 7744 mod 187 = 77;  88^4 = 77 x 77 = 5929 mod 187 = 132
88^7 = 88^4 x 88^2 x 88^1 = (132 x 77 x 88) mod 187 = 894,432 mod 187 = 11
(Instructor: bookmark this — it appears in RSA.)

Example 2: last two digits of 29^5  (= 29^5 mod 100)
29^1 = 29 or -71;  29^2 = 841 → 41 or -59;  29^4 = 1681 → 81 or -19
29^5 = 29^4 x 29^1 = -19 x 29 = -551 mod 100 = -51 mod 100 = 49
(alternative: 29^2 x 29^2 x 29)

Example 3: 3^100 mod 29,  100 = 64 + 32 + 4
3^1 = 3/-26; 3^2 = 9/-20; 3^4 = 81 → 23/-6; 3^8 = 36 → 7/-22; 3^16 = 49 → 20/-9; 3^32 = 81 → 23/-6; 3^64 = 36 → 7/-22
3^100 = 3^64 x 3^32 x 3^4 = 7 x -6 x -6 = 252 mod 29   (spoken: = 20)

Example 4: 23^16 mod 30 = ((((23^2)^2)^2)^2 = ((((-7)^2)^2)^2)^2 → 49 → 19 → -11 → 121 → 1 → 1

Homework
1. Solve 11^23 mod 187.
2. What is "the last 3 digits" of 175^209 ?   (= 175^209 mod 1000)
```

## 4. Gemini flags
1. −133 mod 30 written as −13 (truncated division), then +30 → 17.
2. Slide artifacts "-.1^329".
3. Example 2 summary briefly shows "88^7 mod 187 = 49" (copy-paste glitch; should be 29^5 mod 100 = 49).
4. Example 3 slide stops at "252 mod 29"; answer 20 only spoken.
5. Unbalanced brackets in Example 4 slide.

## 5. Verification (Claude)
- All results recomputed by script: 17, 1, 242, 2, 11, 49, 20, 1 — **all correct**.
- Homework: **11^23 mod 187 = 88** (inverse of 88^7 ≡ 11: RSA pair n=187, e=7, d=23); **175^209 mod 1000 = 375** (625² ≡ 625 mod 1000).
- Added: practice Q37–Q42 (homework solutions, 2^33 mod 30 = 2, 7^222 → 49, exponent-reduction trap 5^117 mod 19 = 1, ±1 bases, multiplication counts).
