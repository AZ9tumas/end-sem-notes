# Study Material: Hill Cipher & Polyalphabetic Ciphers (Vigenère, Autokey, Vernam)

> Gemini notes for 4 videos: Hill Cipher (Encryption), Hill Cipher (Decryption), Polyalphabetic — Vigenère & Autokey, Polyalphabetic — Vernam. Condensed: slide text, formulas, every worked number and all flags kept. Section 5 = Claude's verification.

---

## 1. Outline

### Video 1: Hill Cipher (Encryption)
[00:01] Outcomes · [00:27] Classical taxonomy · [00:36] Overview (Lester Hill 1929, group encryption) · [02:18] Linear algebra background · [03:26] Algorithm C = PK, P = CK⁻¹ · [05:32] Row-vector formulation · [08:14] PK vs KP · [10:04] Letter numbering · [10:35] Example "pay more money" · [11:58] pay · [14:14] mor · [15:43] emo · [16:13] ney · [16:55] Summary

### Video 2: Hill Cipher (Decryption)
[00:01] Outcomes · [00:46] Background · [01:28] Review · [03:36] K⁻¹ = det⁻¹·adj · [04:50] det(K) mod 26 · [11:15] adj(K) via 5×5 grid · [16:03] mod 26 / negatives · [18:00] det⁻¹ · [21:18] search table for 23⁻¹ · [24:34] K⁻¹ · [25:16] verify K·K⁻¹ = I · [26:50] decrypt RRLMWBKASPDH · [27:43]–[28:33] four blocks · [28:57] KP form P = K⁻¹C

### Video 3: Polyalphabetic — Vigenère & Autokey
[00:01] Outcomes · [00:32] Weakness of monoalphabetic · [01:38] Polyalphabetic definition · [02:22] Vigenère formulas · [04:51] Key repetition · [05:58] Example setup · [06:33] Encoding · [08:00] Calculations · [10:09] Polyalphabetic property · [10:55] Cryptanalysis · [11:34] Autokey

### Video 4: Polyalphabetic — Vernam
[00:01] Outcomes · [00:34] Equal key length · [02:05] Gilbert Vernam 1918, bits · [02:40] XOR formulas · [03:45] Architecture diagram · [05:00] Cryptanalysis (loop tape) · [07:05] Motivation for one-time pad

---

## 2. Content

### Hill Cipher — Encryption
- Outcomes: basic working of Hill cipher; encryption process; generate ciphertext.
- Multi-letter substitution cipher by **Lester Hill, 1929**. Same plaintext letter can map to different ciphertext letters. Better security than Playfair.
- Encrypts blocks: digraph (2), trigraph (3), polygraph (m). Key K is m×m.
- Background: matrix arithmetic mod 26; square matrices; determinants; multiplicative inverse mod 26 (last two needed for decryption).
- **C = (P·K) mod 26**, **P = (C·K⁻¹) mod 26**; C·K⁻¹ = P·(K·K⁻¹) = P·I = P.
- Row vector: [C1 C2 C3] = [P1 P2 P3]·K mod 26; C1 = P1K11+P2K21+P3K31, C2 = P1K12+P2K22+P3K32, C3 = P1K13+P2K23+P3K33 (all mod 26). (1×3)(3×3) → (1×3).
- **PK convention** (this lecture): plaintext row vector. **KP convention** (other books): column vector, C = K·P mod 26.
- Letters A=0 … Z=25.
- Example: K = [[17,17,5],[21,18,21],[2,2,19]], plaintext "pay more money" → blocks pay | mor | emo | ney (pad with x if needed).
  - pay (15,0,24) → (303,303,531) → (17,17,11) → **RRL**
  - mor (12,14,17) → (532,490,677) → (12,22,1) → **MWB**
  - emo (4,12,14) → (348,312,538) → (10,0,18) → **KAS**
  - ney (13,4,24) → (353,341,605) → (15,3,7) → **PDH**
  - Ciphertext: **RRLMWBKASPDH**

### Hill Cipher — Decryption
- Outcomes: basic working; decryption process; decrypt ciphertext.
- **K⁻¹ = (det K)⁻¹ · adj(K) mod 26**.
- det K (row-1 cofactor expansion, signs + − +): 17·300 − 17·357 + 5·6 = 5100 − 6069 + 30 = **−939**; −939 = −36·26 − 3 → −3 → **23** (mod 26).
- adj(K) via 5×5 grid: copy first two columns to the right and first two rows to the bottom; strike first row & column → 4×4 grid
  ```
  18 21 21 18
   2 19  2  2
  17  5 17 17
  18 21 21 18
  ```
  2×2 determinants down column pairs give ROWS of adj(K):
  - Row 1 (cols 1–2): 18·19−2·21 = 300; 2·5−19·17 = −313; 17·21−18·5 = 267
  - Row 2 (cols 2–3): 21·2−19·21 = −357; 19·17−5·2 = 313; 5·21−21·17 = −252
  - Row 3 (cols 3–4): 21·2−2·18 = 6; 2·17−17·2 = 0; 17·18−21·17 = −51
  - adj = [[300,−313,267],[−357,313,−252],[6,0,−51]] ≡ [[14,−1,7],[−19,1,−18],[6,0,−25]] ≡ **[[14,25,7],[7,1,8],[6,0,1]]**
- 23⁻¹ mod 26 by trial: x·23 mod 26 for x = 1..17 → 23,20,17,14,11,8,5,2,25,22,19,16,13,10,7,4,**1** → **23⁻¹ = 17** (391 = 15·26 + 1).
- K⁻¹ = 17·adj = [[238,425,119],[119,17,136],[102,0,17]] ≡ **[[4,9,15],[15,17,6],[24,0,17]]**.
- Check: K·K⁻¹ = [[443,442,442],[858,495,780],[494,52,365]] ≡ I.
- Decrypt RRLMWBKASPDH:
  - RRL (17,17,11) → (587,442,544) → (15,0,24) → pay
  - MWB (12,22,1) → (402,482,329) → (12,14,17) → mor
  - KAS (10,0,18) → (472,90,456) → (4,12,14) → emo
  - PDH (15,3,7) → (273,186,362) → (13,4,24) → ney
  - → **pay more money**
- If encryption used C = KP, decrypt with **P = K⁻¹·C mod 26**.

### Polyalphabetic — Vigenère & Autokey
- Outcomes: polyalphabetic substitution; Vigenère; its cryptanalysis; autokey system.
- Monoalphabetic weakness: one fixed substitute per letter → frequency analysis.
- Polyalphabetic: (1) a set of related monoalphabetic substitution rules; (2) a key determines which rule is used for each letter.
- Vigenère = the 26 Caesar ciphers (shifts 0–25). **Cᵢ = (Pᵢ + K_{i mod m}) mod 26**, **Pᵢ = (Cᵢ − K_{i mod m}) mod 26**. Key repeated to message length.
- Example: plaintext wearediscoveredsaveyourself (27), key deceptive (9) → key stream deceptivedeceptivedeceptive → ciphertext **ZICVTWQNGRZGVTWAVZHCQYGLMGJ** (full per-letter table in the PDF).
- Same letter → different ciphertext: e (pos 2, key e=4) → I; e (pos 5, key p=15) → T.
- Cryptanalysis: find key length m → split into m Caesar ciphers. (Gemini also lists here: key and plaintext share natural-language frequencies; Kasiski / index of coincidence find the period.)
- **Autokey** (proposed by Vigenère): keyword followed by the plaintext = running key, no period.
  - Key: deceptive + wearediscoveredsav
  - Ciphertext: **ZICVTWQNGKZEIIGASXSTSLVVWLA**

### Polyalphabetic — Vernam
- Outcomes: polyalphabetic substitution; Vernam; cryptanalytic difficulty.
- **Gilbert Vernam (AT&T), 1918.** Works on binary bits. Key as long as the message, non-repeating.
- **Cᵢ = Pᵢ ⊕ Kᵢ**, **Pᵢ = Cᵢ ⊕ Kᵢ**; (Pᵢ⊕Kᵢ)⊕Kᵢ = Pᵢ.
- Diagram: cryptographic stream generator → Kᵢ into XOR with Pᵢ → Cᵢ → channel → identical stream generator → XOR with Cᵢ → Pᵢ.
- Weakness: original used a running loop of paper tape that repeated → with enough ciphertext and known/probable plaintext it can be broken. Truly random, non-repeating key of message length = **one-time pad** (perfect secrecy).

---

## 3. Flags from Gemini
1. [Video 1, 08:20] Sentence about KP trails off; doesn't state that plaintext becomes an m×1 column vector.
2. [Video 1, 16:30] Slide for "ney" shows intermediate vector (348 312 538) copied from "emo"; correct is (353 341 605). Reduced values (15 3 7) → PDH are correct.
3. [Video 2, 27:55] Slide shows (C1 C2 C3) = (17 17 14)·K⁻¹; should be (P1 P2 P3) = (17 17 11)·K⁻¹. Next line uses 11 correctly.

## 4. Glossary (key terms)
Adjoint (transpose of cofactor matrix) · Autokey cipher · Cofactor expansion · Digraph / trigraph / polygraph · Hill cipher · Identity matrix · Multiplicative inverse mod 26 (exists iff gcd(a,26)=1) · One-time pad · Polyalphabetic cipher · Running key · Vernam cipher · Vigenère cipher · XOR (its own inverse).

---

## 5. Verification (Claude)
- All numbers above were recomputed by script: Hill encryption, det = −939 ≡ 23, adj, 23⁻¹ = 17, K⁻¹, K·K⁻¹ = I, decryption, Vigenère and autokey ciphertexts. **All correct.**
- "Key and plaintext share letter frequencies" is really the weakness of the **autokey** system (key = plaintext), not of repeating-key Vigenère; the PDF places it under autokey.
