# Study Material: Steganography, LSB Demo, Solved Questions, Algebra/Number Theory Intro, Prime Numbers

> Gemini notes for 5 videos. Condensed: slide text, examples, answers and flags kept. Section 6 = Claude's verification.

## 1. Outline
- **L1 Steganography:** [00:00] Outcomes · [00:33] Stego vs crypto · [01:45] "Simply encrypt correct reading exactly twice" → Secret · [02:55] Character marking, invisible ink, pin punctures, typewriter ribbon · [04:38] Modern digital stego · [05:01] Drawbacks & encrypt-then-hide · [06:00] "Tell henry alice not kane / Yesterday ourplan undone!" → Thank You
- **L2 LSB Steganography – Demo:** [00:43] MSB vs LSB (10101001) · [01:25] 24-bit RGB · [03:49] RGB(0,255,0) vs RGB(0,252,0) · [06:19] Blue orchids · [07:12] Watermarking vs stego · [08:04] OpenStego hide/extract
- **L3 Cryptography (Solved Questions):** Q1 same key → private/symmetric · Q2 19 mod 3 · Q3 UGC NET 2016 (retransmit) · Q4 ISRO 2020 columnar TOMATO · Q5 GATE 2015 keys N(N−1)/2
- **L4 Abstract Algebra & Number Theory:** why needed; topic roadmap; classical vs quantum computers
- **L5 Prime Numbers:** definitions; factorisation; facts; why primes in crypto; "are they prime?"

## 2. Steganography (L1)
```text
Outcomes: ★ basics of steganography ★ disadvantages ★ difference between cryptography and steganography
Steganography
★ Conceal the existence of the message.
★ Hiding the message.
★ Not an encryption scheme.
★ Cryptography renders the message unintelligible to outsiders by various transformations of the text.
★ Example: Simply encrypt correct reading exactly twice.  → Secret
Steganography
★ Character marking. ★ Invisible ink. ★ Pin punctures. ★ Typewriter color ribbon.
Drawbacks
★ Lot of overhead.
★ Once the system is discovered, it becomes virtually worthless.
Note: Alternatively, a message can be first encrypted and then hidden using steganography.
```
- Character marking: letters overwritten in pencil, visible only at an angle to bright light.
- Invisible ink: invisible until heat/chemical applied.
- Pin punctures: small holes on selected letters, visible when held to light.
- Typewriter correction ribbon: typed between lines, visible only under strong light.
- Closing: "Tell henry alice not kane / Yesterday ourplan undone !" → **Thank You**.

## 3. LSB Steganography (L2)
```text
Outcomes: ★ LSB steganography ★ watermarking vs image steganography ★ OpenStego demo
★ LSB - Least Significant Bit.   10101001 (last bits = LSBs)
★ RGB color model.
★ Red   : RGB(255,0,0) - RGB(11111111, 00000000, 00000000)
★ Green : RGB(0,255,0) - RGB(00000000, 11111111, 00000000)
★ Blue  : RGB(0,0,255) - RGB(00000000, 00000000, 11111111)
```
- Box 1 RGB(0,255,0) G=11111111 vs Box 2 RGB(0,252,0) G=11111100 — look identical; "These LSBs can be used for storing the information." 2 LSBs × 3 channels = 6 bits/pixel.
- Blue orchids: "Image without hidden information" vs "Image with hidden information" — identical.
- Watermarking slide: laptop image with visible `nesoacademy.org` watermark — proves ownership.
- OpenStego: Input/Blue Orchids.jpg (58.4 KB) + My Message.txt ("Kill Corona Virus", 17 bytes) → Output/BO.png (824 KB), no password → "Success: Message embedded into 1 cover file(s). Skipped 0 file(s)". Extract Data on BO.png → "Message file extracted successfully." → My Message.txt restored.

## 4. Solved Questions (L3)
1. Same key for encryption and decryption → **(b) Private Key** and **(c) Symmetric** (both).
2. 19 mod 3 → 19 = 6·3 + 1 → **(d) 1**.
3. [UGC NET CS 2016] attacker captures and retransmits later without altering; options DoS / Masquerade / Simple / Complex → official **(a) Denial of Service** (flooding with retransmissions). Standard term: replay attack.
4. [ISRO CS 2020] "the tomato is a plant in the night shade family", keyword TOMATO → 38 letters, 7×6 grid, 4 × x; order A(4)=1, M(3)=2, O(2,6)=3, T(1,5)=4 → TINESAX EOAHTFX HTLTHEY MAIIAIX TAPNGDL OSTNHMX → **(a)**.
5. [GATE CS 2015] N people, pairwise symmetric keys → **(c) N(N−1)/2** (N=2:1, 3:3, 4:6, 5:10).

## 5. Maths intro (L4) & Primes (L5)
```text
Abstract Algebra and Number Theory
★ Modern cryptography. ★ Plaintext and Ciphertext. ★ Most encryption is based heavily on number theory.
★ Abstract Algebra. ★ No major contribution of calculus and Trigonometry.
Concepts
★ The Division Algorithm. ★ The Euclidean Algorithm. ★ The Extended Euclidean Algorithm. ★ Modular Arithmetic.
★ Groups, Rings, Fields and Finite Fields. ★ Polynomial Arithmetic. ★ Prime Numbers. ★ Fermat's and Euler's Theorem.
★ Testing for Primality. ★ The Chinese Remainder Theorem. ★ Discrete Logarithms.
Cryptography - A long way to go
★ Cryptography for Classical computers. ★ Cryptography for Quantum computers.

Prime Numbers
★ Prime Numbers: Has exactly two divisors. ★ If 'N' is prime, then the divisors are 1 and N. ★ All numbers have prime factors.
A prime number is a number greater than 1 with only two factors - itself and one. It cannot be divided further by any other numbers without leaving a remainder.
Prime Numbers - Example: 2, 3, 5, 7 prime; 9 not prime / composite; 33 composite.
Facts about primes
★ Only even prime : 2 ★ Smallest prime number : 2 ★ Is 1 a prime number? No.
★ Except for 2 and 5, all prime numbers end in the digit 1, 3, 7 or 9.
Why prime numbers in cryptography?
★ Many encryption algorithms are based on prime numbers.
★ Very fast to multiply two large prime numbers.
★ Extremely computer-intensive to do the reverse.
★ Factoring very large prime numbers is very hard i.e. take computers a long time.
Are they prime numbers?
★ 5393 ★ 27644437 ★ 4398042316799 ★ 1125899839733759 ★ 18014398241046527 ★ 1298074214633706835075030044377087
Note: Cryptographic algorithms use large prime numbers.
```
- Factorisation table: 10 = 2·5; 11 = "1·11"; 100 = 2²·5²; 37 = "1·37"; 308 = 2²·7·11; 14688 = 2⁵·3³·17.
- Divisors: 9 → {1,3,9}; 33 → {1,3,11,33}; 100 → 9 divisors.

## 6. Verification (Claude)
- TOMATO → (a) ✔ (script; left-to-right tie-break gives same order). N(N−1)/2 ✔. Factorisations ✔. **All six "are they prime?" numbers are prime** (Miller–Rabin).
- Slide wording "factoring very large prime numbers" → should be factoring the *product* of two large primes.
- Table listing 1 as a prime factor of 11/37 → 1 is not prime.
- Watermarks can also be invisible; the distinction is purpose.
- Fermat/Euler need gcd(a,p)=1 / gcd(a,n)=1.
- UGC NET Q3: textbook term is replay attack; DoS is the keyed answer given those options.
