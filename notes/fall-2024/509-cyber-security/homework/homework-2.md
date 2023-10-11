# ECE 509 | Homework 2

Name: Alan Manuel Loreto Cornídez Due Date: October 8th, 2023

---

## Question 1

a. Briefly discuss the main vulnerabilities in the UDP protocol. The UDP
protocol is a protcol that does not verify connection within the communication
channel (The lack of a SYN ACK connectio establishment). This makes issues in
the UDP protocol have low level attacks. Attacks for the UDP protocol include:

- IP Spoofing
- Amplification Attacks
- IP Fragmentation
- ARP Spoofing

b. Provide an example of a UDP attack that is not discussed in class. An example
of a vulnerability of the UDP protocol that was not discussed in class is known
as a **UDP flood**. A UDP flood attack takes advantage of the fact that there is
no verification of the source of packets (because of the lack of a SYN ACK
within the communication channel). The attacker can send multiple packets that
appear to be coming from different sources, and because of the lack of
verification, the server may try to respond to all requests made by the
malicious packets. This results in a Denial of Service of legitimate packets
that must be serviced. While this attack uses IP spoofing to achieve its goal,
the focus of this attack is to cause a denial of service instead of
impersonating another user.

Another attack that is possible is **port scanning**. This attack takes
advantage of no communication channel verification. The attacker sends packets
to multiple ports of a server, ports that are closed will respond with a 'port
not accessible' response. Packets that do not have this response can be inferred
to not be closed, thus revealing open ports.

---

## Question 2

a. Briefly discuss the main vulnerabilities in the TCP protocol. The main
vulnerabilities in the TCP protcocol are the following:

- The SYN ACK communication during establishing of connections allows for
  attacks that involve flooding servers with SYN acknowledgements. Similar to
  the UDP attacks.
- The second vulnerability is also due to the nature of established connections.
  Servers and clients must maintain states in order to maintain an established
  connection, this makes resource exhaustion attacks a viable option (similar to
  a UDP flood in the fact that is is a DoS attack, however, it is executed in a
  different manner.)

b. Provide an example of a TCP attack that is not discussed in class.

After doing some research, I found the AMNESIA:33 report which contains
information regarding multiple TCP/IP stack vulnerabilities. The report can be
found [here](https://www.forescout.com/resources/amnesia33-how-tcp-ip-stacks-breed-critical-vulnerabilities-in-iot-ot-and-it-devices/).

As for some attacks, one of the attacks that was interesting for me to read
about is an attack concep that uses integer overflow when deciding the length
and offset fields within a TCP packet. Since integers are a fixed size, any
numbers that would cause overflow are wrapped around and used in the beginning
of the loop. As stated in the report, it "wraps around the bound and ‘comes out
the other side.". This allows interesting behaviour throwing out-of-bounds
exceptions whenever the server must process the packets. Another vulnerability
is the usage of packets to cause null pointer dereferences (more memory access
exceptions.) in the server that is processing the TCP packets.

---

## Question 3

a. Explain the working of the SYN Flood attack with a diagram.

![[Pasted image 20231010103604.png]]

Given the diagram above, we can describe what happens in a SYN flood attack
below:

1. A client attempts to initialize a connection with a server and sends a SYN
   packet.
2. The server responds to the SYN request and sends a SYN and ACK packet in
   return.
3. Ideally, the client would acknowledge the connection by sending an ACK packet
   back and then continue transmission as normal. However, when attacking a
   server, the client will not send an ACK packet. Instead, the client continues
   sending more SYN packets to attempt to initialize more connections.

The end goal of this attack is to cause a DoS to the server because of all of
the connections that are 'half open' and not fully acknowledged take up server
resources.

A way to mitigate this attack is by using a firewall that limits the amount of
possible 'half-open' connections.

---

## Question 4

a. Describe in detail what a is VPN.

A virtual private network (VPN) is a tool that allows  connections to be made to networks in a secure fashion when communicating on insecure mediums (such as the public internet).

b. Explain how VPN achieves secure communications in the LAN.
Establishing a secure connection via the use of a VPN can be done in multiple ways. In this case, the VPN allows a user to connect to a LAN that is restricted from the public by connecting to a server that acts as a "doorman" for the private network. The 'doorman' then routes traffic to the private network if necessary or routes the packets to wherever else they need to go.

Let's take the University (or a corporate office) for example. That network contains sensitive information that should not be available to the public. The institution does not allow public access to this network. How can workers access data on this network whenever they are away from the site? The users can use a VPN to allow their computers to connect to the network as if they were connected to the internet on site.


c. Which of the CIA does the VPN address? Justify your answer.

A VPN addresses the C and A aspects of the CIA triad.

Confidentiality is indrectly addressed by a VPN because using a VPN allows the network with sensitive data to be hidden so that data is not available for attack from unauthorized entities.

Availablility is directly addressed via the use of a VPN because a VPN allows authorized users to connect to the network that is hidden from the public. Thus, allowing all users who need access to have the network (and the data on the network) available to them. This is, of course, assuming that access to the VPN is properly gated and is secure as well.


---

## Question 5

a. Briefly describe the main functions of a firewall. 

A firewall is a security measure that is used to control incoming and outgoing network traffic. Communication is monitored to make sure that network security rules are being followed. The firewall is usually the first line of defense when using a trusted network that makes communication with a non-trusted network.

b. Identify two firewall architectures and discuss the benefits and disadvantages of each design.

**Dual-Homed Host**
When using the Dual Themed host architecture, the firewall is the critical path to all communication between the private network and the public internet. This means that all communication is routed through that firewall.

An advantage of this architecture is that it is great for ensuring secure access to both the public network from the private network and vice-versa. 

A disadvantage to this architecture is that the firewall can act as a bottleneck because all of the traffic within a private network is routed through the firewall, thus being prone to performance bottlenecks.


**Screened Host**


The screened host 


This is achieved by using a router that redirects all incoming traffic to a 'bastion host' that does all of the required security checks. After those checks are completed, the incoming traffic is redirected to the initially intended host. 

Advantages of the screened-host network firewall is the capability of higher throughput, and thus, less of a bottleneck. 


---

## Question 6

Based on the following architecture of an Industrial Control System, design an
IDS for Levels 0, 1 & 2.

![[Pasted image 20231008133828.png]]
