# Batch 12 — college slides (CLASS NOTES/, Dr. J Sathish Kumar, CSN15403), Lectures 1–14

Source: `CLASS NOTES/` (scanned PDFs; OCR'd with tesseract). Mid-sem syllabus = Lectures 1–14 ("till Message Integrity").

New sections: 01b_attacks (L3 + L5 attack types, ADFGVX), 05b_classical_extra (L5: multiplicative/affine + attack, Kasiski, Hill known-plaintext, rotor/Enigma, keyed/columnar transposition, key inversion, stream vs block), 09b_ext_euclid (L2/L4: table, inverses, Diophantine), 12_primes_crt (L10/L11), 13_algebra (L6), 14_modern_block (L7), 15_des (L8), 16_aes (L9), 17_rsa (L12), 18_elgamal_ecc (L13), 19_integrity (L14). Practice groups O–V (Q71–Q119). Trimmed verbose parts of 06/07/09 (clock, thread analogy, divisor listing, maths roadmap) at user's request.

Corrections found in the slides (all in fixboxes):
- L1 ADFGVX decryption example: square for "monkeys" doesn't give "the way is clear" (transposition step with "zebras" does match the intermediate text).
- L7 Feistel example: "first and third" vs "first and second" key bits inconsistent; only first+third gives 1001. "In asynchronous stream cipher the key is independent" → synchronous.
- L9 AES Example 1: X written as 23 (decimal) instead of 17 hex; SubBytes then 26 instead of F0.
- L10: 561 = 3·11·17; φ(1)=0 convention; Euler 2nd version only for squarefree n.
- L14: 0.69·2^34 s ≈ 376 years (not >500); Conditional/Majority binary swapped on slides 54–55; exercise x is 128-bit.
All numbers verified by scripts (ext Euclid, GF(2^n), AES S-box/MixColumns/key expansion vs FIPS-197, DES S1/IP, Miller–Rabin, CRT, RSA, ElGamal, ECC points, birthday bounds, SHA-512 helper functions).
