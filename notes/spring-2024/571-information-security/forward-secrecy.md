# Forward Secrecy

Forward Secrecy: Even if the adversary compromises the current session key, the
attacker should not be able to infer future session keys.

$A \rightarrow B: sig_{K_{A}} [E_{pkb}(K_1)]$

$B \rightarrow A: sig_{K_b} [E_{pk_{a}}(K_2)]$

$K_{1} \oplus K_{2} = K$

Contributory key agreement:

If A and B are compromised, then $S_{K_{A}}$ and $S_{K_{B}}$ are leaked as well.

The adversary can then decrypt past keys as well.

Let us address this issue.

$K_{1} \oplus K_{2} = K$ Does not have forward secrecy.

Again, we can use the Diffie-Hellman-Key-Exchange (DHKE)

$A \rightarrow B: sig_{K_{A}} [ID_A, g^{a}\mod{p}]$

$B \rightarrow A: sig_{K_b} [ID_B, g^{b}\mod{p}]$

Now, $K = g^{ab}\mod{p}$

When A and B are compromised, the adversary gets $S_{K_{A}}$ and $S_{K_{B}}$,
but not $A$ and $B$.

Due to the discrete logarithm problem, it is difficult to derive $A$ and $B$
from the secret keys that are generated.

Using a hash function, $H(K||R)$ does not provide forward secrecy either.



