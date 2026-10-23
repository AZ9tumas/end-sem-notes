# Study Material: GCD — Euclidean Algorithm (Method 1 & Method 2)

> Gemini notes, condensed: slide text, all worked tables, homework and flags kept. Section 5 = Claude's verification.

## 1. Outline
- **Method 1 (table):** [00:48] Divisors, GCD = HCF · [01:30] gcd(12,33) by listing · [03:32] gcd(25,150) · [05:02] gcd(13,31) · [06:17] Q A B R table setup · [06:45] gcd(12,33) · [11:02] gcd(750,900) · [12:38] gcd(252,105) · [14:03] Homework gcd(1005,105)
- **Method 2 (recursive):** [01:24] prerequisite a > b · [02:33] Euclid_GCD(a,b) · [04:22] gcd(50,12) · [06:46] gcd(83,19) · [09:00] relatively prime · [09:25] Homework gcd(529,123)

## 2. Slides
```text
Euclidean Algorithm
❖ Euclidean Algorithm or Euclid's Algorithm.
❖ For computing the Greatest Common Divisor (GCD).
❖ aka Highest Common Factor (HCF).
```
- Listing: 12 → {1,2,3,4,6,12}, 33 → {1,3,11,33}, common {1,3}, GCD 3. 25 → {1,5,25}, 150 → {1,2,3,5,6,10,15,25,30,50,75,150}, GCD 25. 13, 31 → GCD 1.
- Table: columns Q, A, B, R. A = larger, B = smaller; Q = A div B, R = A mod B; next row A ← B, B ← R; stop when B = 0 (write X); GCD = A.

| gcd(12,33) | Q A B R |
|---|---|
| | 2 33 12 9 / 1 12 9 3 / 3 9 3 0 / X **3** 0 X |

| gcd(750,900) | 1 900 750 150 / 5 750 150 0 / X **150** 0 X |
|---|---|
| gcd(252,105) | 2 252 105 42 / 2 105 42 21 / 2 42 21 0 / X **21** 0 X |

```text
Euclid's Algorithm for finding GCD
Prerequisite: a > b
Euclid_GCD (a, b):
    if b = 0 then
        return a;
    else
        return Euclid_GCD (b, a mod b);

Example 1: GCD(50,12) = GCD(12, 50 mod 12) = GCD(12,2) = GCD(2, 12 mod 2) = GCD(2,0) = 2
Example 2: GCD(83,19) = GCD(19,7) = GCD(7,5) = GCD(5,2) = GCD(2,1) = GCD(1,0) = 1
```
- gcd(a,b) = 1 → relatively prime (83 and 19).
- Homework: GCD(1005, 105) [Method 1 video]; GCD(529, 123) [Method 2 video].

## 3. Gemini flags
- Verbal slip "divisors of 13" = 33 (video 1, 02:26/02:41).
- Verbal slip "A = 9" = 19 (video 2, 07:47).
- "A mod B" vs "A divided by B" wording mixed (mod gives remainder, division gives quotient).

## 4. Glossary
Divisor/factor · GCD = HCF · prime · composite · Euclidean algorithm gcd(a,b) = gcd(b, a mod b) · mod · quotient · remainder · relatively prime (coprime).

## 5. Verification (Claude)
- All results recomputed by script: 3, 25, 1, 3, 150, 21, 2, 1 — **all correct**.
- Homework: **gcd(1005, 105) = 15** (9·105+60, 1·60+45, 1·45+15, 3·15+0); **gcd(529, 123) = 1** (coprime, but 529 = 23², 123 = 3·41, neither prime).
- Added: why the algorithm works, last-non-zero-remainder shortcut, links to Hill/inverses/RSA/extended Euclid, practice Q43–Q47.
