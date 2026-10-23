# Study Material: Modular Arithmetic (2 videos)

> Gemini notes, condensed: all slide text, examples and flags kept. Section 5 = Claude's verification.

## 1. Outline
- **Video 1:** [00:00] Outcomes · [00:41] Definition · [01:36] 12-hour clock · [03:10] Congruence vs equality · [05:10] Negative values · [06:56] Why congruence · [08:06] Valid/invalid (8 statements)
- **Video 2:** [00:00] Outcomes · [00:41] Circle & thread analogy · [04:01] Three simplification rules · [05:11] Examples a=15, b=11, n=8 · [07:36] Properties of Zn

## 2. Video 1
```text
Outcomes: ★ Understand modular arithmetic with examples. ★ Understand about congruence. ★ Identify valid and invalid congruence.
Modular Arithmetic
★ System of arithmetic for integers.
★ Wrap around after reaching a certain value called modulus.
★ Central mathematical concept in cryptography.
```
- Clock (mod 12): 15 → 3 PM, 20 → 8 PM, 23 → 11 PM, 13 → 1 PM.
```text
Congruence
★ In cryptography, congruence(≡) instead of equality(=).
Examples: 15 ≡ 3 (mod 12)   23 ≡ 11 (mod 12)   33 ≡ 3 (mod 10)   10 ≡ -2 (mod 12)
∴ a ≡ b (mod m)  i.e. a = km + b
```
- Long-division frames for each; 10 ÷ 12 → remainder 10 or (−2). Negative residue → add modulus.
- Why ≡: many numbers share a remainder ({…, −7, 3, 13, 23, 33, …} ≡ 3 mod 10; 27 ≡ 3 mod 12); 10 ≠ −2 but 10 ≡ −2 (mod 12).
```text
Valid or Invalid
★ 38 ≡ 2 (mod 12)   ✓
★ 38 ≡ 14 (mod 12)  ✓
★ 5 ≡ 0 (mod 5)     ✓
★ 10 ≡ 2 (mod 6)    ✗
★ 13 ≡ 3 (mod 13)   ✗
★ 2 ≡ -3 (mod 5)    ✓
★ -8 ≡ 7 (mod 5)     (exercise → valid: −8 = −3·5 + 7)
★ -3 ≡ -8 (mod 5)    (exercise → valid: −3 = 1·5 + (−8))
```

## 3. Video 2
```text
Outcomes: ★ Understand modulus with an analogy. ★ Understand various properties of modular arithmetic.
One more analogy — Circumference: 10, Length: 35
Wraps (Quotient) | Remaining thread (Remainder) | Congruence
1 | 25 | 35 ≡ 25 mod 10
2 | 15 | 35 ≡ 15 mod 10
3 | 5  | 35 ≡ 5 mod 10
Properties of Modular Arithmetic
1. [(a mod n) + (b mod n)] mod n = (a + b) mod n
2. [(a mod n) - (b mod n)] mod n = (a - b) mod n
3. [(a mod n) x (b mod n)] mod n = (a x b) mod n
Examples (a=15, b=11, n=8): 26 mod 8 = 2;  4 mod 8 = 4;  165 mod 8 = 5
```
```text
Property           | Expression
Commutative Laws   | (a + b) mod n = (b + a) mod n ; (a x b) mod n = (b x a) mod n
Associative Laws   | [(a + b) + c] mod n = [a + (b + c)] mod n ; [(a x b) x c] mod n = [a x (b x c)] mod n
Distributive Laws  | [a x (b + c)] mod n = [(a x b) + (a x c)] mod n
Identities         | (0 + a) mod n = a mod n ; (1 x a) mod n = a mod n
Additive Inverse   | For each a ∈ Zn, there exists a '-a' such that a + (-a) ≡ 0 mod n
```
- Spoken: subtraction not commutative (5−3 ≠ 3−5). Multiplicative inverse: a × a⁻¹ ≡ 1 (mod n).

## 4. Gemini flags
- 38 ≡ 14 (mod 12) and 35 ≡ 25/15 (mod 10) called "remainders" — valid congruences, but not canonical remainders (0 ≤ r < m).
- Multiplicative inverse condition gcd(a, n) = 1 not stated in the video.

## 5. Verification (Claude)
- All 8 valid/invalid cases, the four congruence examples, the thread table and the 15/11/8 examples recomputed by script: **all correct**.
- Also added to the PDF this batch: full rail fence **decryption** method with depth-2, depth-3 and depth-4 (unequal rows) worked examples (section 14), and practice Q31–Q36.
