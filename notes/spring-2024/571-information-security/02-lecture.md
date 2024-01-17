# ECE 571 | Lecture 2

## Security Objectives, Modular Arithmetic

### Information and Network Security

- Information Security

  - Commodity distributed via a network.
  - Security of data on a network or device.

- Network Security

  - Protection of the network availability to enable infrastructure for
    distributing information.
  - For example: preventing DoS attacks.

### Security Attacks

Passive Attacks

- Eavesdropping
- Traffic Analysis
- Packet Sniffing

Active Attacks

- Masquerade/Impersonation

  When Alice is being impersonated by the malicious actor.

  I.e. Mallory is trying to connect to alice, but Bob says that they are Alice,
  so Mallory connects to Bob.

- Insertion/Injection

When Alice wants to send \$1.00 to Bob, but Mallory injects a message and makes
it appear (to Bob) that Alice sent \$100.00 as well.

- Modification

A combination of Masquerading and Insertion/Injection attacks, aka
'Man-In-The-Middle' attacks.

- Delay

A message may be time sensitive. The message must be sent at 10:00 AM, but the
attacker delays the message until 11:00 AM

- Replay

The attacker repeats a previous message that was already sent. So the receiver
will have to messages sent at different times.

- Deletion

### Security Objectives (Services)

- Confidentiality

Restricting access to information only to authorized entities.

- Id Authentication

Association of an identity to an entity.

- Message Authentication

Association of a message to an entity, i.e. verifying the source of a message.

- Data Integrity

Ensuring that the information has not been altered by an unauthorized entity.

- Non-repudiation

Preventing the denial of previous commitment or actions (think of a contract).

- Access Control

Preventing unauthorized use of a resources (e.g. systems and applications)

- Availability

Ensuring the accessibility of a system or resource by an authorized entity.

- Certification

Endorsement of information by a trusted entity

- Privacy and Anonymity

Keeping data, whereabouts, associations, identity, etc. private.

- Freshness

Ensure that the information sent is fresh.

- Revocation

Retraction of certification or authorization.

## Model of Secure Communication

Senders and recipients sent messages through an information channel. The channel
is assumed to be insecure.

Sender --> Message --> Security Related Transformation --> Secure Message -->
Sent through the information channel --> Sent message gets transformed back to
the original message --> received by the recipient.

Network Access Security Model:

There is a computing resource that has data, processes, or software present on
the resource. You need to protect the resource from actors that are trying to
access the resource.

The opponent could be a human, or a software. Techniques to assist in this
`Gatekeeper` function, can be things like gateways and firewalls.
