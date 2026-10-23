# Study Material: One-Time Pad, Rail Fence, Row-Column Transposition

> Gemini notes for 3 videos. Condensed: all slide text, examples and flags kept. Section 5 = Claude's verification.

---

## 1. Outline

**Video 1 — One Time Pad:** [00:00] Outcomes · [00:34] Taxonomy (OTP highlighted) · [00:44] Concept (Vernam improvement) · [03:26] Statistical independence · [04:32] Two fundamental difficulties · [06:17] Perfect secrecy · [07:07] Review

**Video 2 — Rail Fence:** [00:00] Outcomes · [00:27] Taxonomy · [00:49] Transposition fundamentals · [01:38] Rail fence mechanics · [02:26] Example depth 2 · [05:22] Homework depth 3 · [05:46] "Thank you very much" depth 3

**Video 3 — Row Column Transposition:** [00:00] Outcomes · [00:39] Taxonomy · [00:53] Mechanism · [02:46] Example "Kill Corona Virus at twelve am tomorrow" · [06:07] Two-stage permutation · [07:44] Review

---

## 2. One Time Pad

```text
Outcomes
★ Understand One Time Pad encryption technique.
★ Know the two fundamental difficulties of One Time Pad encryption technique.
★ Know about Perfect secrecy.
```
Last substitution technique in the taxonomy.

```text
One Time Pad
★ Improvement to the Vernam cipher.
★ It yields the ultimate in security.
★ Random key that is as long as the message.
★ The key need not be repeated.
★ In addition, the key is to be used to encrypt and decrypt a single message, and then is discarded.
★ Each new message requires a new key of the same length as the new message.
★ Such a scheme, known as a one-time pad, is unbreakable.
```
- Vernam's repeating key loop → periodic patterns → breakable. OTP: truly random key, Length(K) = Length(M), never repeats, used once, discarded.

```text
One Time Pad
★ It produces random output.
★ No statistical relationship to the plaintext.
★ Because the ciphertext contains no information whatsoever about the plaintext, there is simply no way to break the code.
★ The code is unbreakable.
★ The security of the one-time pad is entirely due to the randomness of the key.
```
- (Gemini) Cᵢ = (Pᵢ + Kᵢ) mod 26 or Cᵢ = Pᵢ ⊕ Kᵢ; uniform key ⇒ P(M|C) = P(M); brute force yields every possible message equally.

```text
Two Fundamental Difficulties
★ The practical problem of making large quantities of random keys.
★ Even more daunting is the problem of key distribution and protection.
★ Because of these difficulties, the one-time pad is of limited utility and is useful primarily for low-bandwidth channels requiring very high security.
```

```text
Perfect Secrecy
★ The one-time pad is the only cryptosystem that exhibits what is referred to as perfect secrecy.
Perfect secrecy is the notion that, given an encrypted message (or ciphertext) from a perfectly secure encryption system (or cipher), absolutely nothing will be revealed about the unencrypted message (or plaintext) by the ciphertext.
```
- (Gemini) Shannon, 1949.

---

## 3. Rail Fence

```text
Outcomes
★ Understand the working of transposition technique.

Transposition Cipher
★ Some sort of permutation applied on the plaintext letters.
★ This technique is referred to as a transposition cipher.
★ The simplest such cipher is the rail fence.

Rail Fence Technique
★ The plaintext is written down as a sequence of diagonals and then read off as a sequence of rows.
```
- Substitution replaces letters; transposition keeps letters, permutes positions.
- Example: "neso academy is the best." depth 2 → nesoacademyisthebest (20). Row 1: NSAAEYSHBS, Row 2: EOCDMITEET → **NSAAEYSHBSEOCDMITEET**.
- Homework: same plaintext, depth 3.
- Closing slide: "Thank you very much", depth 3 → rows TKVM | HNYUEYUH | AORC. (Gemini wrote final string as TKVMHNYUEYUHAORE — see Section 5.) Zig-zag period 2(D−1) = 4.

---

## 4. Row Column Transposition

```text
Outcomes
★ Understand the working of row column transposition.
★ Generate ciphertext using row column transposition technique.
★ Understand how to do more complex permutation that is not easily reconstructed.

Row Column Transposition
★ A more complex scheme.
★ Rectangle.
★ Write : Row by row.
★ Read  : Column by column.
★ Key   : Order of the column
```
- Example: "Kill Corona Virus at twelve am tomorrow" (33 letters), 5 rows × 7 columns, padded with y z.
  ```
  key:  4 3 1 2 5 6 7
        K i l l c o r
        o n a v i r u
        s a t t w e l
        v e a m t o m
        o r r o w y z
  ```
  Read columns in key order 3,4,2,1,5,6,7 → **LATARLVTMOINAERKOSVOCIWTWOREOYRULMZ** (speaker says "RULMC" at 05:30 — slip; slide shows RULMZ).
- Two stages ("More Complex"): write C₁ row by row into the same grid, read with the same key:
  ```
  L A T A R L V
  T M O I N A E
  R K O S V O C
  I W T W O R E
  O Y R U L M Z
  ```
  → **TOOTRAISWUAMKWYLTRIORNVOLLAORMVECEZ**
- Effective key: rectangle size, column order, number of stages.
- Flag (Gemini): padding "random letters or XYZ or YZ as per the need"; real systems need agreed padding so the receiver can strip it.

---

## 5. Verification (Claude)
- Rail fence depth 2, row-column stage 1 and stage 2: **correct** (checked by script).
- "Thank you very much" depth 3 = **TKVMHNYUEYUHAORC** (ends in C; Gemini's final string ending "AORE" is wrong, its own rows give AORC).
- Homework (neso academy is the best, depth 3): rows NAESB | EOCDMITEET | SAYHS → **NAESBEOCDMITEETSAYHS**.
