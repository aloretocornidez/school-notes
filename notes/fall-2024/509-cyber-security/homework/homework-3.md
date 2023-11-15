# Homework 3 | ECE 509

Name: Alan Manuel Loreto Cornídez Date Due: November 14th, 2023

Instructor: Clarisa Grijalva, Salim Hariri

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

Microsoft posted
[this article](https://msrc.microsoft.com/blog/2023/10/microsoft-response-to-distributed-denial-of-service-ddos-attacks-against-http/2/),
referencing a vulnerability in the HTTP2 protocol. It was patched out of windows
on October 10th, 2023.The vulnerability has been released in a
[public database](https://www.cve.org/CVERecord?id=CVE-2023-44487).

1. How was the attack launched? While the specific attack that happened is not
   mentioned in the Microsoft article, the attack vectors impact HTTP2 servers.
   The attack works by
   > packing a set number of HTTP requests using `HEADERS` followed by
   > `RST_FRAMES` in a single connection. This allows the attacker to cause
   > resource exhaustion on the server by increasing the CPU utilization to go
   > up, thus causing a denial of service.
2. How was it detected? Microsoft was only able to detect this security flaw
   because it was reported to them by industry partners. Nothing is mentioned in
   the disclosure statement regarding how the attack was detected.
3. How was it mitigated? According to the article, the mitigation strategies
   employed by Microsoft were by implementing mitigation for IIS (HTTP.sys),
   .NET (Kestrel), and Windows. These updates were released on October 10th, the
   same date of the release of the disclosure for this vulnerability.

## Question 3

1. Explain the workings of the DNSSEC and include a diagram in your description.
    DNSSEC is a set of security opitions that can be included in the implementation of the DNS protocol. It has, however, had problems recieving full adoption. Because of the following reasons: 
    - There is a large need to design a DNS resolution protocol that is backwards compatible.
    - Disagreements over who should own the top-level keys that are a part of the protocol. 
    - Many groups have not overcome the percieved complexity of implementation of the DNSSEC protocol.

    These points were retrieved from [here](https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions#Overview).
    

Diagrams shall be retrieved from the Cloudflare [site](https://www.cloudflare.com/dns/dnssec/how-dnssec-works/) that explains the DNSSEC protocol. 


DNSSEC is a special implementation of DNS which implements a trustless domain resolution system contrary to the trustless DNS systems that create a race condition for attackers and legitimate servers to reach the client faster.

DNSSEC does this by implementing the use of Zone-Signing keys, the returned IP address from a requested alphanumeric address (RR) is signed with a zone-signing pair. This allows the returned RR to be verified if it is signed with the correct private key by the server. As shown in the following 3 figures.

![[Pasted image 20231114134027.png]]
(The RR is signed by the server, thus returning en encrypted IP address)



![[Pasted image 20231114134051.png]]
(Now, the DNS server returning our requested RR must sign the IP to make sure it is legitimate)

![[Pasted image 20231114134355.png]]
Verifying the signature from the DNS resolver using the ZSK

However, the problem of verifying the ZSK is then introduced. How can the client verify that the ZSK signature by the DNS resolver has not been compromised? DNSSEC implements the use of Key-Signing-Keys. KSKs are used to verify the private keys held by each zone verifying server. 

How are these keys implemented? Each zone is a chile of another zone, so the KSK are provided to the child zones via the parent. This ultimately leads to a necessary 'chain of trust' that must be implemented at the highest level (hence the point made above, regarding the disagreements over who should own TopLevelZone keys).
![[Pasted image 20231114134636.png]]
A diagram showcasing the KSK hierarchy as you move up the chain of trust.


From the [reading]() we have the following figure:
![[Pasted image 20231114134839.png]]
This showcases the packet structure for a DNS packet. As we can see, the TXID is stored in plain text when utilizing the normal DNS protocol, however, it is instead signed when using the DNSSEC protocol to encrypted the information and thus be verified before accepting the returned packets.


## Question 4

1. Do an in-depth investigation of two DoS mitigations seen in class. Include
   diagrams showing how they work.

### Mitigation 1 | Client Puzzles
This mitigation involves the implementation of a puzzle that the client must solve. In class, the puzzle that was shown is the following:
![[Pasted image 20231114141144.png]]

This is a mathematical problem that the client must complete in and then return the answer to the server before more requests will be answered. As such, this slows down an attacker by making sure that a clients must posses a. sufficient computing power, and b. the time between new requests for a DoS attack will be slowed down when waiting for new packets.

The puzzle is usually a hard problem for a computer to mathematically solve, taking a longer amount of time to complete than other operations. (The example in class completes in approximately 0.3 seconds on a 1GHz machine). 

By implementing a puzzle that the client must solve, the amount of requests per seconds can be significantly slowed down, especially if the attacker is not using Distributed DoS methods to conduct attacks. 

Another way that this mitigation can be effective is by requiring a fair amount of computing power to complete, so low end VM attacks will not be as effective. Thus, increasing the barrier of entry to execute a DoS attack.


### Mitigation 2 | CAPTCHAs

![[Pasted image 20231114135129.png]]

A captcha is a DoS mitigation strategy that involves the implementation of tasks that must be completed by a client before the server can respond to the client. 

The tasks that must be completed have traditionally been designed to be easy for humans to completed, whilst being difficult for computers to complete in an automated fashion. 

By implementing the CAPTCHA, similar techniques to the client puzzles are employed, however, CAPTCHAs are usually visual puzzles, which, up until recently with the development of machine learning algorithms, was extremely difficult for computers to complete. 

With the recent developments in image object recognition, CAPTCHAs have are now being used to correct machine learning algorithms in addition to their original purpose of providing a defense to DoS attacks. (Though, they may not be as effective in the modern age).



## Question 5

1. Provide an example of a problem that can be solved using:

Justify your answer, besides describing the problem explain why it can be solved with that type of learning.


- Supervised learning
	- When looking at the advantages of supervised machine learning algorithms, we know that these MLAs are advantageous when wanting to classify the input and attach a label to it. With this in mind, we can see that the usage of supervised MLAs would be advantageous when wanting to detect speech patters in spam or phishing emails. The MLA could look at how the email is written and the language contained within the email in order to categorize the email as a possible threat. For example, to stop emails from attackers from reaching people within an organization.

- Unsupervised learning 
	- Unsupervised machine learning algorithms are algorithms that do not assign a label from a certain input, but instead, allow anomalies to be detected in data that a normal human being might not be able to tell is present in the data by looking at the data. With that being said, one of the situations where the use of an unsupervised MLA would be advantageous is in anomaly detection, specifically, I think it would be very advantageous to use the MLA to detect DDoS attacks. It is easy to spoof the source IP address (of course, there's multiple aspects to this) and make even a network of say, 1000 bots, appear as though the traffic is divided amogst millions of users. Using an unsupevised MLA would allow the detection of such anomalies if/when they occur.
- 
 


## Question 6

1. Describe man-in-the-middle attacks, including a diagram.

A man in the middle attack is an attack where the victim is intercepted by the attacker, ideally, without the victim's knowledge of the interception. This allows the attacker to route traffic through their computer and commit multiple actions, such as packet logging or even packet modification. 

Using the image below (retrieved from [wikipedia](https://en.wikipedia.org/wiki/Man-in-the-middle_attack#/media/File:Man_in_the_middle_attack.svg))
![[Pasted image 20231114210926.png]]

Alice may try to communicate with Bob, however, Mallory is the 'Man-in-The-Middle' attacker. Thus, if Alice tries to communicate with Bob, Mallory has the ability to both look at the messages as well as change the messages, possibly with malicious modifications.


3. Explain how a NIDS can be used to detect these attacks, including:

	- A network intrusion detection system (NIDS) can be used to prevent a man in the middle attack by, as the name states, detecting when a network has an intrusion. If the network host can detect when anomalous behavior is present, then the network host can make sure that unauthorized communication is either mitigated or is stopped entirely.
	- Some of the features that are possible with the IDS are the ability to stop the detected man in the middle from connecting to the access point, another feature could be the ability to keep track of the intruder and see what actions are being performed by the intruder to gather analytics for future use.
