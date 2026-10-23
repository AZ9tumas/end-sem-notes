# Study Material: Fermat's Little Theorem, Euler's Theorem, Primitive Roots, Multiplicative Inverse (4 videos)

> Gemini notes, condensed: slide text, all examples, homework and flags kept. Section 5 = Claude's verification.

## 1. Outline
- **Fermat:** [00:15] statement · [01:54] p=5,a=2 · [03:28] p=13,a=11 (11 ≡ −2) · [05:38] p=6,a=2 fails · [06:41] HW p=11,a=5
- **Euler:** [00:27] statement · [01:15] φ review · [01:29] a=3,n=10 · [03:55] a=2,n=10 fails · [05:41] a=10,n=11 (10 ≡ −1) · [07:25] HW a=11,n=33
- **Primitive roots:** [00:20] Diffie–Hellman motivation · [00:44] definitions · [02:00] 2 mod 5 · [04:02] 3 mod 7 (chain) · [06:00] 2 mod 7 (cycles) · [07:34] HW: 2 mod 11; primitive roots of 5
- **Multiplicative inverse:** [01:31] definition · [02:56] 3 mod 5 · [04:15] 2 mod 11 · [05:14] 4 mod 5 · [05:44] 5 mod 10 (none, gcd) · [07:42] 2 mod 5 vs 2 mod 7 · [08:48] need for extended Euclid

## 2. Slides
```text
Fermat's Little Theorem
If 'p' is a prime number and 'a' is a positive integer not divisible by 'p' then a^(p-1) ≡ 1 (mod p)
Ex1: p=5, a=2: 2^4 = 16 ≡ 1 (mod 5) → holds
Ex2: p=13, a=11: 11^12 ≡ (-2)^12 = ((-2)^4)^3 ≡ 3^3 = 27 ≡ 1 (mod 13) → holds
Ex3: p=6, a=2: 2^5 = 32 ≢ 1 (mod 6) → does not hold (6 not prime)
Homework: Does Fermat's theorem hold true for the prime number 11 with the integer 5?

Euler's Theorem
For every positive integer 'a' & 'n', which are said to be relatively prime, then a^(Φ(n)) ≡ 1 mod n.
Ex1: a=3, n=10: Φ(10)=4, 3^4 = 81 ≡ 1 → holds
Ex2: a=2, n=10: 2^4 = 16 ≢ 1 → does not hold (gcd 2)
Ex3: a=10, n=11: Φ(11)=10, (-1)^10 = 1 → holds
Homework: Prove Euler's theorem does not hold true for a=11 and n=33.

Primitive Root
A number 'α' is a primitive root modulo n if every number coprime to n is congruent to a power of 'α' modulo n.
Definition made easy: 'α' is said to be a primitive root of prime number 'p', if α^1 mod p, α^2 mod p, ..., α^(p-1) mod p are distinct.
2 mod 5: 2,4,3,1 → yes;  3 mod 7: 3,2,6,4,5,1 → yes;  2 mod 7: 2,4,1,2,4,1 → no
Homework: Q1 Is 2 a primitive root of 11?  Q2 What are the primitive roots of number 5? (hint table 1^k..4^k mod 5)

Multiplicative Inverse
A x A^(-1) = 1 ; Under mod n: A x A^(-1) ≡ 1 mod n
3 x 2 ≡ 1 mod 5;  2 x 6 ≡ 1 mod 11;  4 x 4 ≡ 1 mod 5;  5 x ? ≡ 1 mod 10 (none)
The M.I. for 2 (mod 5) is 3.  The M.I. for 2 (mod 7) is 4.
```

## 3. Gemini flags
- "-2^12" / "-1^10" on slides mean (−2)^12 / (−1)^10.
- General primitive-root definition given but composite case not explained.
- Self-inverse (4 mod 5) not named.

## 4. Glossary
Congruence · coprime · Diffie–Hellman · φ(n) · Euler's theorem · extended Euclid · Fermat's little theorem · gcd · modular inverse · negative residue · primitive root.

## 5. Verification (Claude)
- All examples recomputed by script — **correct**. Homework: 5^10 ≡ 1 (mod 11) ✔; 11^20 ≡ 22 (mod 33) (powers alternate 11, 22) ✔; 2 is a primitive root of 11 ✔; primitive roots of 5 are 2, 3 ✔.
- Added: exponent reduction mod p−1 / φ(n), inverses a^(p−2) / a^(φ(n)−1), Fermat test & 341 pseudoprime, order, φ(p−1) count, fast primitive-root test, Z8* has none; drill E29–E34 (Forouzan-style); challenge group N (Q65–Q70: 341, last digits of 2^2024, 41's primitive roots, 2 mod 101, toy Diffie–Hellman, Euler-inverse traps).
