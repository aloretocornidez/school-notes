# ECE 509 | Homework 2

Name: Alan Manuel Loreto Cornídez

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
When using the Dual Themed host architecture, the firewall is the critical path to all communication between the private network and the public internet. This means that all communication is routed through the host via the use of two network cards. One that interfaces with the ingress traffic and another that interfaces with the egress traffic.

An advantage of this architecture is that it is great for ensuring secure access to both the public network from the private network and vice-versa. 

A disadvantage to this architecture is that the firewall can act as a bottleneck because all of the traffic within a private network is routed through the firewall, thus being prone to performance bottlenecks.


**Screened Host**

**How can these threats be addressed?**
**Giving the the threats a DREAD Score**

The screened host architecture is similar to the dual-homed host architecture, except ingress traffic is processed by a router that sends the data to the bastion host. The traffic is then sent to the original requester. In the same way, the egress traffic must first be sent to the bastion host before it is sent to the router to continue normal communication.

The screened host firewall has the positive side effect of reducing the load on the bastion host, that is because the router will screen the ingress and egress traffic before it is sent through further communication channels. This allows for higher throughput of network traffic.

A disadvantage of this is the added complexity of running a system using this architecture. Because of the use of multiple routers, it is possible to misconfigure something more easily.


---

## Question 6

"Based on the following architecture of an Industrial Control System, design an IDS for Levels 0, 1 & 2.""

In order to design the IDS, we shall first find threats. We can categorize the possible threads using the STRIDE methodology.

After the threats are identified, we must address the threats by either mitigating them, eliminating them, transferring them, or just accepting the risk.

After the IDS is designed, we can give the threats that are present in our system a dread score to categorize them


![[Pasted image 20231008133828.png]]



Designing an IDS for each level
### Level 0
**Present Threats at the Current Level**
- Electrical signals are executed on the system that are not supposed to occur (This includes self destructive and non-normal behavior, for example commands that exceed current or voltage limits, etc.)
- Parts are rendered uncommunicative/unresponsive because of a DoS attack.

**How can these threats be addressed?**

Both of these attacks affect the hardware level of the industrial system. Our current level of the ICS does not work at the bit level, it works at the analog level. That means that the best way to monitor this system is by using a behavioral monitoring IDS that detects any anomalies in the component behavior of the different systems (manufacturing, smart grid, smart water, smart home). This can be done by monitoring which signals are actually being sent to the components at the physical level, such as checking voltage when turning on the lights, making sure that the lights are not being switched on and off in quick succession, verifying that water pressures are being assigned to correct values and changing when it is normal for them to change, such as when the water system and the manufacturing system work together to cut a piece of marble. Many other normal behavioral checks.

Since each of these components of this level are not conducting their operation at the operating system level, or assuming their computing power is not sufficient because they are IoT components, I believe the best approach to implementing this anomaly based IDS would be by using a Network IDS that examines the voltages that are being sent across a network. Sensors can be attached to the components that data to a processing system that monitors for anomalous data points.

When non-fatal anomalies are detected (non-fatal actions such as light flickering inside a building), the IDS can alert the proper people via automated email. If the anomalies that are detected can cause hardware damage to the components, the IDS can also sent remote signals to turn off the systems as soon as possible before catastrophic failure occurs. 

This means that threats at level zero are either mitigated (when non fatal) and eliminated (when fatal). However, we do assume minor risk when we allow non-fatal threats to occur. This can be remedied with different rules that take action whenever there is a need to do so.


**Giving the the threats a DREAD Score**
- Damage potential  | 2/5 
	- Damage can occur to components if there is latency between the shutoff signal and/or the currrent levels sent through to the components is too high. Over current protection and pre-emptive shut off reduces this from a fatal threat to a nominal threat.
- Reproducibility  | 1/5
	- As soon as a certain behavior is established to be anomalous, the ICS can send shutoff signals to the components to be shut off. This makes reproducibility of an attack quite low. However, if the user ignores warnings from non-fatal attacks, the reproducibility may be higher. Resulting in a nominal threat for reproducibility.
- Exploitability  | 3/5 
	- After the threats have been detected, the system automatically shuts off. As long as someone is present to ensure that systems can return to normal operation, the exploitability of this is low. If an attacker finds out how to trip the system in multiple ways/repeatedly, then the IDS may be vulnerable to exploits.
- Affected users 1/5
	- Depending on how the attack is conducted, the user may or may not be affected. If an attack is not fatal, then the users may still be affected. Assuming that fatal attacks are detected (and subsequently mitigated) then the affected users will not be affected heavily. 
- Discoverability 2/5
	- The IDS for level 0 does not have to worry about discoverability because if there are attacks that have reached this level, then there is an issue upstream regarding the signals that are being sent. The issue is upstream because the signals that are being send to control the system have already been sent. The only issue regarding discoverability is the fact that the sensors used could be hijacked as well. This could mean the attacker spoofs regular readings.


### Level 1
Using a similar approach to level 0, we can design the IDS system for level 1.

**Present Threats at the Current Level**
At the control level, there a different threats that must be addressed.
- TCP and other communication protocols are being used to send signals, so we must ensure that communication is not being manipulated.

**How can these threats be addressed?**
This threat is also a good candidate for an anomaly detection system. In this case however, the best implementation of the anomaly system would be using a host based application system. As we can see in the top snippet of level 1, we already have a single compute unit that is sending the commands to the rest of the units. This means that we can use our IDS on the PLC to monitor the traffic that is occurring on the device.

Regarding the use of an anomaly detection system. This would be effective for runtime, however, there is one key point. If the user is using external software on the PLC, then the signature must first be verified. So that means that during system initialization we can use a signature based IDS to verify a proper program is running. Other than that, the behaviour monitoring and anomaly detection would be the best course of action to take for level 1.


**Giving the the threats a DREAD Score**
- Damage potential  | 2/5 
	- If the attacker can send attacks that are not considered to be anomalous, then there is a higher possibility that our IDS cannot detect malicious behavior. The IDS should be able to stop the attack from proceeding forward as long as the user pays regard to fatal and non fatal attacks and warnings.
- Reproducibility  | 2/5
	- Reproducibility is much higher in this layer of the ICS, so it is important to make sure that a VPN or some sort of communication verification takes place before commands are executed if the behavior appears anomalous..
- Exploitability  | 3/5 
	- As long as the system can detect anomalous packets, the threat should not be exploitable.
- Affected users 3/5
	- Since this is the main point of communication between the network and the components, the number of affected users can be much larger than in layer 1, however, as long as the IDS can detect anomalous behavior, the affected users should remain normal.
- Discoverability 2/5
	- If the attacker has access or knowledge on what is considered anomalous behavior, then discoverability may be notable. However, if training for nominal behavior is done intelligently and frequently modified to match system parameters, then discoverability is relatively low.

### Level 2
For the final level we can take full utilization of out SCADA system to implement the IDS.


We can see that the scada system is connected to the network via ethernet and model/wireless protocols. This enables the use of the network based IDS in level 0. The host based IDS that conducts the anomaly detection can be implemented on our SCADA system for the PLC as well becuase all of the packets that are being sent to the PLC are send from the SCADA. 

The need to verify that everything is running correctly on lower levels can be done here. 

Hardware from level 0, such as monitoring sensors, will send information to this level to be analyzed. Since the SCADA has access to both the output and the input, we can better analyze what is going on in the system by generating input/putput transfer functions and making sure that the outputs and inputs correspond to normal behavior. 

When working with the PLC and making sure that the PLC is running the correct program, we can verify application signatures on the SCADA (using hashing for ex.) to make sure that a malicious program is not being run. 

Finally, the network communication that sends the signals to the devices can be monitored on the SCADA. Following the same principles for monitoring the output in level 0, we can monitor the ouput/input to make sure that proper behavior is occurring. 


The last step to make sure that our IDS works as designed is to verify that the IDS is running correctly by giving it test cases and seeing how the system behaves. Can we ever truly know that our IDS is not already compromised?