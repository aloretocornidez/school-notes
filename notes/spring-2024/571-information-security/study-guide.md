# Study Guide Midterm 1 | ECE 571

## Topics

### Introduction to Information and Network Security:

#### Understand the basic goals of information and network security, such as

- Confidentiality: Protection of sensitive information from unauthorized access
  or disclosure.
- integrity: Assurance that data has not been altered or tampered with in an
  unauthorized or unintended manner.
- Authentication: Verifying the identity of a user, system, or entity to ensure
  that they are who they claim to be.
- Non-repudiation: Once a sender has sent a message or initiated a transaction,
  they cannot later claim that they did not send it or were not involved in the
  transaction.
- Availability: Ensuring timely and uninterrupted access to information and
  services.

#### What are the common threat/adversary models:

- Passive: Security thread where the attacker simply eavesdrops on the
  communication without altering the data
- Active: Security threat where an attacker actively manipulates or alters data
  in the communication channel between the sender and the receiver
- Identify the security attacks in terms of the violations of the security
  services:

#### Common terminology

- Concept of secure communication over an insecure channel: ability to exchange
  sensitive information between two parties in such a way that even if the
  communication channel itself is susceptible to interception or manipulation by
  adversaries, the information remains confidential and unaltered.

#### Basic Operations

- Modular arithmetic

  - _Addition_: In modular addition, you add two numbers together and take the
    remainder when divided by the modulus. For example, (a + b) mod n.
  - _Subtraction_: Similar to addition, modular subtraction involves subtracting
    one number from another and taking the remainder when divided by the
    modulus. For example, $(a - b) mod n$.
  - _Multiplication_: Modular multiplication involves multiplying two numbers
    and taking the remainder when divided by the modulus. For example, (a \* b)
    mod n.
  - _Exponentiation_: Modular exponentiation involves raising a number to a
    power and taking the remainder when divided by the modulus. For example,
    (a^b) mod n.
  - _Euclid’s algorithm_: An algorithm used to find the greatest common
    denominator of two numbers.
  - _Fermat's little theorem_: If $p$ is prime and does not divide $a$, then $a
    p - 1 \equiv 1 (\mod p)$.
  - _Euler's theorem_: If $a$ and $m$ are coprime, then $a\phi (m) \equiv 1
    (\mod m)$, where $\phi$ is Euler's totient function.
  - _Euler's Totient Function_: Counts the number of coprime integers with the
    input $n$ in $\phi(n)$
    - If $n$ is prime number, $p$, then $\phi(p) = p - 1$

### Classical Encryption Techniques

#### Early ciphers:

- Shift: $E_n(x) = (x+b) \mod n$ (a = b, b = c, etc...)
- Substitution: Letters are mapped to another letter.
- Affine: $E(x) = (ax+b) \mod n$ (a must be co prime with n to substitute.)
- Vigenere:
  - Plaintext: attackatdawn
  - Key: LEMONLEMONLE
  - Ciphertext: LXFOPVEFRNHR
- Hill: each block of n letters (considered as an n-component vector) is
  multiplied by an invertible n × n matrix, against modulus 26. To decrypt the
  message, each block is multiplied by the inverse of the matrix used for
  encryption.
- Permutation ciphers: This cipher focuses on moving letters of the plaintext
  into another position. The letters themselves are not changed.

#### Understand block and stream ciphers.

- Block:
- Stream:

#### Cryptanalysis: understand the principles of the four cryptanalysis approaches

- Ciphertext-only
- Known-plaintext
- Chosen-plaintext
- Chosen-ciphertext
- Be able to apply them to break simple ciphers.

#### Three types of Cryptography:

- Secret key
- Public key
- Hash functions.
- What security goals and they are able to achieve, respectively?

#### Measures of Security and Ideal Cryptosystems

- Perfect secrecy: definitions, and how to test whether a cryptosystem is
  perfectly secure.
- One-time-pad: construction, XOR operation, and why it is perfectly secure,
  pros and cons.

### Symmetric Key Cryptography:

#### Product cryptosystems: what is idempotent cryptosystem and its impact on security of a cipher.

#### Notions of symmetric key cryptography, and computational security

#### Substitution-permutation networks: general structure and why do we need it.

- DES
  - The Feistel structure, and general idea of Mangler function:
    - S-Boxes and permutation
    - The key length of DES and its relationship with the security level;
  - How to make more secure DES?
    - Triple D
    - meet-in-the-middle attack
    - And how is Triple DES designed, why?
- AES
  - Understand the high-level structure and why it is secure, and comparison
    with DES

#### Understand why a block cipher is secure:

- What are the desired properties must the DES/AES algorithm satisfy?
  - the non-linear property
  - strict avalanche
  - bit independence
  - Why?

#### Five modes of encryption (how to encrypt large messages), their pros and cons

- ECB, etc.

#### Pseudorandom number/sequence generation and stream ciphers

- What are the criteria to evaluate the security of PRNG or PRSG?
- Common ways of generating pseudorandom numbers and their security

### Hashes and Message Digest

#### The desired properties of cryptographic hash functions:

- One-way property (preimage resistance)
- Second preimage resistance
- Collision resistance
- Randomness
- Why are they needed?
  - The complexity of breaking each property, the Birthday paradox and related
    probability calculations
  - The length requirement for a message digest (how many bits are considered
    sufficient?)
- General iterated construction of message digests

#### Message authentication codes: understand the security requirements of MACs, how to construct secure keyed hash function (e.g., HMAC, CBC-MAC, etc).

#### Applications of hash functions: e.g., integrity check, authentication, commitment protocols, encryption, etc.

- How to securely combine hash with encryption to achieve both confidentiality
  and authentication/integrity protection.

### Public Key Cryptography

#### The basic concepts of public key cryptography, including public key encryption and signatures, what security properties they can achieve.

#### The RSA cryptosystem: know how public/private keys are generated; how to use public/private keys to encrypt/decrypt messages; the vulnerabilities of textbook RSA and remedies

#### Digital signature schemes: different levels of security requirements, and three attack models; RSA signatures: construction, possible attacks, hash and then sign.

#### Applications of public key encryption and digital signatures – basic applications, and how to securely combine signature with encryption to achieve both confidentiality and authentication/integrity protection.
