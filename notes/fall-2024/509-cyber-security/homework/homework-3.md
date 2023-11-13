# Homework 3 | ECE 509

Name: Alan Manuel Loreto Cornídez Date Due: November 14th, 2023 Instructor:
Clarisa Grijalva, Salim Hariri

## Question 1

1. Describe the difference between a DoS and a DDoS.
   1. In a DoS attack, the attacker attempts to make a server echaust its
      resources by creating multiple service requests from their system to the
      server. This makes the server unable to serve requests from legitimate
      traffic since the server is busy serving the illigitimate requests from
      the attacker.
   2. In a DDos Attack, the concept is the same, however, instead of using one
      system to exhaust the victim's resources, the attacker uses multiple
      systems to attack the same server. This makes the intensity of the attacks
      greater as well as harder to detect.
2. Provide two solutions against DoS attacks and explain if these solutions
   would work against DDoS (Justify your answer). Two solutions to protect
   against DoS attacks:

   - First: By restricting the amount of requests that are served when the
     source IP address has repeated service requests, this is especially
     effective the if the server should not be creating many connections for its
     nominal usage patters. You can also block certain IP addresses
     indefinitely.
   - Second: Rate limiting the amount of requests that are served to not allow
     the server to crash due to abrupt service requests.

     These solutions would not work for DDoS attacks, the first solution, IP
     blocking, only works if the attacker does not spoof their IP address when
     attacking form a single system. If the attacker spoofs their source IP
     address, or if the user uses multiple systems to achieve the same effect,
     then it is much more difficult ot detect and prevent this attack. As for
     Ratelimiting, this falls to the same problem, without the ability to
     determine anomalous activity, it will be difficult to prevent DoS (much
     less, DDoS) attacks. However, one of the proposed solutions if by creating
     content delivery networks (CDNs) which implements load sharing techniques
     in order to allow services to function even if one set of servers goes
     down.

## Question 2

Investigate two recent DoS attacks (no earlier than 2020), and describe:

1. How was the attack launched?
2. How was it detected?
3. How was it mitigated?

### Attack 1

Clouadflare is the one of the largest web hosting platforms, and thus, they are
one of the largest targets for DoS and DDoS attacks. You can read about many of
the attacks given in their quarterly report.
[Cloudflare Attacks Report Q3 - 2023](https://blog.cloudflare.com/ddos-threat-report-2023-q3/).

I will pick two attacks to write on from the quarterly report.

First: Due to the recent conflicts in the middle east, there have been multiple
efforts made to both attack and defend all parties.

![[Pasted image 20231113104926.png]]

In the attached image, we can see attacks begin soon after the conflict begins.
You can read more about attacks on both Israeli and Palestinean websites
[here](https://developers.cloudflare.com/radar/reference/quarterly-ddos-reports/#quarterly-ddos-threat-reports).
To answer the questions:

1. From the website, we can see

> Cloudflare systems automatically detected and mitigated DDoS attacks that
> targeted websites that provide critical information and alerts to civilians on
> rocket attacks. The initial attack peaked at 100k requests per second (rps)
> and lasted ten minutes. Forty-five minutes later, a second much larger attack
> struck and peaked at 1M rps. It lasted six minutes. Additional smaller DDoS
> attacks continued hitting the websites in the next hours.
>
> - Cloudflare

2. By looking at Cloudflare's
   [mitigation and detection strategies](https://developers.cloudflare.com/radar/reference/quarterly-ddos-reports/#quarterly-ddos-threat-reports),
   we can see that they use the following methods to detect DDoS attacks and
   gather data about the nature of these attacks.

   - They look at the spikes in activity of requests to certain sites.
     Cloudflare has a record of nominal operating conditions and uses those
     statistics to aid in anomalous behavior detection.

3. The attacks are mitigated using dynamic rule sets. According to
   [their site](https://developers.cloudflare.com/ddos-protection/), in other
   words, they use systems similar to the IDSes introduced at the beginning of
   the course.

### Attack 2

Darkreading, a blog site, posted
[this](https://www.darkreading.com/attacks-breaches/netscout-identified-nearly-7-9m-ddos-attacks-in-the-first-half-of-2023)
article highlighing some of the DDoS attacks that are starting to gain
populatory. Among the categories are the following:

- Carpet-Bombing Attacks
- DNS Water-Torture attacks

Out of the attacks mentioned, mostly government and education are being
targetted.

## Question 3

1. Explain the workings of the DNSSEC and include a diagram in your description.

## Question 4

1. Do an in-depth investigation of two DoS mitigations seen in class. Include
   diagrams showing how they work.

## Question 5

1. Provide an example of a problem that can be solved using:

- Supervised learning
- Unsupervised learning Justify your answer, besides describing the problem
  explain why it can be solved with that type of learning.

## Question 6

1. Describe man-in-the-middle attacks, including a diagram.
2. Explain how a NIDS can be used to detect these attacks, including:

- Placement of the NIDS
- Possible features
