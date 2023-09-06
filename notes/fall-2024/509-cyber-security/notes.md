# ECE 509 | Cyber Security


## Introduction to CLaaS

### What is CLaaS?
A cloud based environment that enables cybersecurity training through virtual labs.

### How to access CLaaS
- Link: [CLaaS Website](https://claas-askcypert.org/)






## Lecture 1 | Introduction

### Topics Covered In Class

**Computer Networks and Protocols Security**
- Computer Networks
	- Wireless
	- Wired
- Communication Protocols
	- IP Based
	- Non-IP Based

**Operating Systems Security**
- Basic Control Hijacking
- Rootkits, Isolation

**Application Security and Resilience**
- User and Web Applications
- Mobile Platforms
- Web Protocols
- Encryption
- Forensic Analysis
- Insider Threats




*What is Cybersecurity?*
- ***Cybersecurity:* Availability, integrity, and secrecy of information systems and networks in the face of attacks, accidents and failures with the goal of protecting operations and assets.**
- *Corporate Cybersecurity:* Availability, integrity, and secrecy of information systems and networks in the face of attacks, accidents and failures with the goal of protecting a corporation's operations and assets.
- *National Cybersecurity*: Availability, integrity and secrecy of the information systems and networks in the face of attacks, accidents and failures with the goal of protecting a nation's operations and assets.



# Lecture 2 | Threat Modelling

**Project Proposal**
#assignment 
4 Pages
Must include 4-5 papers
Describe the issues, tools, software and experiments you plan to conduct.

Proposal Deadline: September 13th

### Treat Modeling
Threat modeling aims at finding security problems.
Using a model means use abstraction to obtain a bigger picture, rather than the code itself.
Threat modeling involves the following four key questions:
- #todo 


**What can go wrong?**
- Denial of Service

**Types of Threats**
Threats against the network: Information gathering, eavesdropping Denial of Service
Spoofing

Threats against the host: Arbitrary code execution, unauthorized access to resources, file disclosure, DoS

Threats against the application: SQL injection, cross-site scripting, hidden field tampering, session hijacking, identity spoofing, information disclosure.


### Threat Model Framework
5 Steps

1. Model the system i.e. identify the assets and analyze them
2. Find threats using that model
3. Address threats using the approaches.
4. Validate your work for completeness and effectiveness.
5. Rate/Prioritize threats based on their impacts.


#### Modeling of the System/Asset
There are three ways the term asset is commonly used in threat modeling:
- Things attackers want
	- User passwords or keys
	- numbers and other data
- Things you want to protect
	- Unlike the tangible things attackers want, many of these assets are intangibles.
- Stepping stones to either of these
	- ex. Ever computer has CPU and storage that a hacker can use.


#### Find Threats
Now you identified which threats can be exploited to target the different assets and systems you initially identified.

Multiple formal methods to do this:
- Threat List
	- Create a list of possible threats
- STRIDE
	- Categorized list of threat types
- Threat Trees
- Root nodes represent attacker's goals.




**STRIDE**
Stride stands for things that can go wrong in security.

- Spoofing: Pretending to be someone or something you're not
- Tampering: Modifying somthing you're not supposed to modify
- Repudiation: Claiming you didn't do something regardless of whether you did it or not.
- Denial of Service: 
- Information Disclosure: Exposing information, i.e. data breaches
- Elevation of Privilege: When a program or user is able to do things they are not supposed to do.



#### How to Address Each Threat?
- Mitigating Threats
	- make it harder to exploit a threat, i.e. adding passwords.
- Eliminating Threats
	- Is almost always achieved by eliminating features.
- Transferring threats
	- By letting someone else handle the risk
- Accepting the Risk
	- Do nothing about the risk.



#### Addressing Threats

**Repudiation Threats**
Focus on ensuring your system keeps logs about completed actions, ensure that these logs are protected.

**Information Disclosure Threats**
Use encrypted information

**DoS Threats**
Elastic Resources

**Elevation of Service Threats**
Use tools and architectures that separate data and code.
Use a type-safe language
Leverage the OS for protection.
Use the sandbox
Be careful with command injection attacks.


#### Validate

#### Rate
**Simple model**
$$\text{Risk} = \text{Probability} * \text{Damage Potential}$$

**DREAD**
- Damage Potential
- Reproducibility
- Exploitability
- Affected Users
- Discoverability



### MITRE Adversarial Tactics, Techniques and Common Knowledge (ATT&CK)

Initial Access
Execution
Persistence
Privilege Escalation
Defense Evasion


**TrickBot**
Trojan the fishes emails.

Applying ATT&CK to TrickBot



---

**Break**

---

#assignment Homework 1 
Identify 4 potential threats among 2 different systems. Try to come up with different mitigation strategies for each threat.


## Lecture B
### Threat Modelling: IoT and ICS Use Cases
Recall the Previous threat modelling framework with 5 steps.

Model the System
Ask yourself what can go wrong?
Address Threats: Mitigate, Eliminate, Transfer, Accept the risk
Validate
Rate: Using DREAD


### Threat Model | Internet of Things
IoT refers to the network of physical objects, devices, with sensors, software and connectivity capabilities.

IoT devices gather and share data with each other, often without human intervention

Allows remote monitoring and control of devices and systems enabling real time tracking, management, and automation from a distance.

IoT devices use sensors to collect information fro their environment and actuators are use to perform actions based on that data.

Used in various industries
Healthcare: remote patient monitoring
Transportation: Smart cars
Agriculture: Precision Farming
Manufacturing: Smart Factories


#### IoT Architecture
**Perception Layer** | Physical devices that collect data from the environment

**Network Layer** | Responsible fro transporting data from the perception layer to other devices.

**Processing Layer** | Processing of data collected from the Perception later.

**Application Layer** | Provide services to users

IoT vs Security

| Internet of Things | Information Technology
|---|---|
|Security of devices, sensors and systems|Security of information systems, networks, computers, and data within traditional computing environments.|
|Challenged by their interconnected nature, limited processing power, memory, energy, and security features.| Allow the implementation of more complex security control and measures.|
|May face attacks that exploit their specific vulnerabilities, such as weak default passwords, lack of security updates, and the potential for unauthorized physical access| Susceptible to a broad range of attacks, including malware, phishing, social engineering, and other methods that target software vulnerabilities.|
|Communicate through various network protocols | Typically operate within more controlled and established network environments|
|Ensuring the privacy of this data while in transit and at rest is a significant concern| Data privacy concerns, especially in industries like finance, healthcare, and e-commerce|
|Lacks consistent security standards and regulations across all devices and industries.| Has established security frameworks, best practices, and regulatory requirements that help guide organizations in protecting their systems and data.|



#### Threat Modeling | IoT
We have a smart house with a couple of sensors and smart devices.

First, Model the System:

**Model The System**
#todo 


**Find Threats**
- Open Ports

- Denial of Service on network gateway
	- DoS
- Manipulation of light sensors data
	- Tampering
- Main in the middle attack
	- Spoofing
	- Tampering
- Spoofing of authentication credentials of mobile application
	- Spoofing
	- Elevation of privileges 



**Address Threats**

|Threat Description | Mitigation Strategies |
|---|---|
| Denial of service on network gateway | Introduction of challenges |
| Manipulation of light sensor data | Intrusion detection system that monitors the data between devices |
| Main-in-the-middle attack modifying sensor data | Encryption of data between sensor and network gateway |
| Spoofing of authentication credentials of mobile application | Dual authentication | 



**Rate Threats**

Threat Description
- Denial of service on network gateway
	- Damage: 5
	- Reproducibility: 4
	- Exploitability: 4
	- Affected Users: 5
	- Discoverability: 5
	- Dread Score: 25
- Manipulation of Light Sensors Data
	- Damage: 3
	- Reproducibility: 2
	- Exploitability: 3
	- Affected Users: 3
	- Discoverability: 4
	- Dread Score: 15
- Main-in-the-middle attack modifying sensor data
	- Damage: 4
	- Reproducibility: 2
	- Exploitability: 3
	- Affected Users: 4
	- Discoverability: 3
	- Dread Score: 16

- Spoofing of authentication credentials
	- Damage: 4
	- Reproducibility: 3
	- Exploitability: 4
	- Affected Users: 
	- Discoverability: 
	- Dread Score: 
#todo 





### Industrial Control Systems
ICS are computer-based systems designed to control, monitor, and automate various industrial processes and critical infrastructure.

Used in sectors such as:
- Energy
- Manufacturing
- Water Treatment
- Transportation

They try to automate tasks that were traditionally performed manually. To improve consistency and reduce costs.

They control pysical processes such as adjusting temps, pressures, flows, and levels

They communicate through specialized networks like ethernet #todo 


#### ICS Architectures

Level 0 | Field
- Physical process devices
- Sensors and actuators that interact directly with the industrial process

Level 1 | Control
- Control funcitons to manage the process.

Level 2 | Supervisory
- Coordination of level 1 controllers
- Human Machine Interfaces (HMI) and SCADA software


Level 3 & 4 | Manufacturing, Enterprise, and Business Planning
- Production scheduling
- Supply chain management
more 'IT'-like devices.


#### ICS vs IT Security

**ICS**
- Focus on operational technolody
- Deal with processes that have physical consequences
	- Industrial processes
	- Critical infrastructure
	- Energy sector
	- Manufacturing
	- Transportation
- Ensure the availability, integrity, and safety of industrial processes.
- Comprise physical devices
	- Programmable logic controllers
	- Sensors
	- Actuators
	- Supervisory control and data acquisition systems (SCADA)
- ICS networks often have unique architectures including isolated networks and industrial protocols
- Prioritize stability and safety
- Successful attacks on ICS environments can lead to disruptions in critical infrastructure, physical harm, and environmental damage
- Malfunctions in industrial prcesses could have sever societal and economic impacts
- ICS security is subject to industry-specific regulations and standards

**Information Technology**
- Primarily handle data and business processes
- Focuses on preserving the confidentiality, and availability of digital information and computer systems.
- Usually do not pose direct physical threats.
- Comprised of
	- Servers
	- Workstations
	- Databases
	- Network Devices
- IT networks are more interconnected and operate within standard network architectures
- More flexibility when addressing certain types of risks.
- Attacks on IT systems often result in data breaches, identity theft, financial loss, and damage to reputation
- The impact is primarily on digital assets and information.
- IT is guided by a broader range of frameworks, such as NIST cybersecuirty framworks.



#### Threat Modeling | ICS


**Model System**
- Motor
- Stamping system
- Object detector sensor
- Programmable logic controller (PLC)
- Engineering workstation (Windows machine)


**Find Threats**

- An attacker might tamper with sensor data transmitted to the PLC
	- Spoofing
	- Tampering
	- Elevation of privileges
- Manipulation of PLC's control settings
	- Elevation of privileges
- Spoof and modification of the data reported to the engineering workstation
	- Spoofing
	- Tampering
	- Information Disclosure
- Manipulation of PLC command and data.
- Spoofing
- Tampering


**Address Threats**
Threats and Mitigation Strategies

- An attacker might tamper with sensor data transmitted to the PLC
	- Introduce an intrusion detection system for the industrial protocol in use
- Manipulation of the PLC's control settings
	- Add authentication to the PLC's control settings
- Spoof and modification of the data reported to the engineering workstation
	- Encryption and authentication between PLC and engineering workstations
- Manipulation of PLC command and data
	- Filtering of unauthorized commands.



**Rate Threats**

Threats and DREAD score
- An attacker might tamper with sensor data transmitted to the PLC
	- Damage: 5 
	- Reproducibility: 2 
	- Exploitability: 2
	- Affected Users: 4
	- Discoverability: 2
	- Dread Score: 15
- Manipulation of the PLC's control settings
	- Damage: 3
	- Reproducibility: 2 
	- Exploitability: 2
	- Affected Users: 3 
	- Discoverability: 3
	- Dread Score: 13
 - Spoof and modification of the data reported to the engineering workstation
	 - Damage: 2
	- Reproducibility: 3 
	- Exploitability: 3
	- Affected Users: 2
	- Discoverability: 3
	- Dread Score: 13
- Manipulation of PLC command and data
	- Damage: 4
	- Reproducibility: 2
	- Exploitability: 3
	- Affected Users: 4
	- Discoverability: 
	- Dread Score: 














# Lecture 3 | Networks
## Lecture A
**Learning Goals** #learninggoals 
**Computer Networks and Protocols Security**
- Computer Networks
	- Wireless
	- Wired
- Communications Protocols
	- IP Based
	- Non IP Based

**Operating Systems Security**
- Basic Control Hijacking
- Rootkits and Isolation

Application Security and Resilience
- User and Web Applications
- Encryption
- Forensic Analysis
- Mobile Platforms
- Web Protocols
- Insider Threats




 
**Relevant Network Layers**
| Applications | FTP | 
| Transport | TCP |  
| Network | IP | 
| Data Link and Physical Layer | Ethernet Driver | 


**Common Terminology**

NIST | National institute of standard and technology
CAN | Common vulnerabilities 
CVE | Common vulnerabilities and exposures are used to report vulnerabilities.

CVSS | Common vulnerabilities scoring system
IETF | Internet engineering task force
RFC | Request for comments
STD | Internet standard
IANA | Internet assigned numbers authority

### Attacks

**Address Resolution Protocol (ARP)**
It's a vulnerability used to discover mapping of neighboring Ethernet MAC to IP addresses.

This is a [man in the middle ](https://en.wikipedia.org/wiki/Man-in-the-middle_attack) attack.

**ARP cache poisoning**
Anyone can send an ARP reply.

It is a classic man in the middle attack
It's better than simple sniffing because packets will get to you regardless of sniffing.

**Solutions?**
- Encrypt all traffic
- Monitoring programs like `arpwatch` to detect mapping changes.
	- Might be valid due to DHCP.



### Transport Layer

UPD
- Best effort delivery
- IP Layer

| Source Port | Destination Port |
| ----------- | ---------------- |
| UDP Length  | UDP Checksum     |


TCP Header
- MAC


| Source Port            | Destination Port |     |     |     |     |     |             |     |
| ---------------------- | ---------------- | --- | --- | --- | --- | --- | ----------- | --- |
| Srquence Number        |                  |     |     |     |     |     |             |     |
| Acknowledgement number |                  |     |     |     |     |     |             |     |
| HDR Len                | URG              | ACK | PSH | RST | SYN | FIN | Window size |     |
| Checksum               | Urgent Pointer   |     |     |     |     |     |             |     |
| Options (0 or more workds)                       |                  |     |     |     |     |     |             |     |





Denial of Service attacks (DoS)



### UDP - Datagram Transport - Iser Datagram Protocol (UDP)


#### Ports

- Ports dynamically "bind" IP packets to a process
- Port range 0 - 65535

#### Transport Flow
Transport flow is a sequence of packets sent between a source/destination pair and following the same route through the network.
\<src_ip, dst_ip, src_port, dst_port\>

Total combinations $2^{32} \times 2^{32} \times 2^{16} \times 2^{16} = 2^{96}$

What's the problem with this big number?

With a computer operating at $2^{12}$ instructions per second, and assime the year has $2^{25}$ seconds, it will take $2^{62}$ number of years to finish. Assuming each combination can be done in one instruction (unrealistic assumption).


#### UDP Issues

- All lower layer issues, with similar attacks
	- IP Spoffing
	- IP and link layer broadcast (amplification)
	- IP fragmentation
	- ARP spoofing
	- Link layer
- New possibilities
	- Network services and applications can be contacted and attacked with UDP packets that exploit the lower level issues
	- Traffic amplifying applications


#### UDP Amplifier Attack
- Fraggle
	- Broadcast UDP packet sent to the `echo` (port 7) service.
	- All computers reply (amplification)
	- Source IP was spoofed, victim is overwhelmed


#### UDP Ping-Pong
- Chargen service (Port 19) replces with a UDP packet to any incoming packet
	- It sends arbitrary characters to the sender until the host closes the connection
- Spoof a packet from host A's chargen service to host B's chargen service.

one starts pinging the other for a response that then requests the sender for a response that then requests the sender for a response that then.....



Any service or application that issues a UDP reply, no matter what the input is, is vulnerable.
- Do you know of another UDP service that answers no matter what?
	Amplification
	1. Spoof IP
	2. Invoke SDP

Anomaly Behavior Analysis (ABA)




**Application Layers**
A server that provides a game

appplications replies with large packets to small requests.


#### Exploits Through UDP

- Resource Exhaustion
- Sniffing and Spoofing
- Exploitation of other flaws.


#Summary
UDP does not in itself introduce new volnerabilities, but it makes the exploitation of UP layer vulnerabilities easy.

- Makes applications more difficult to design to prevent amplification and ping-pong effects.



### TCP | Reliable Streams


#### Initial Vulnerabilities of TCP





A client A wants to set up a TCP connection to a server B

- A sends a SYN with its sequence number x
- B replies with its own SYN and sequence number Y and an ACK of A's sequence number X+1
- A sends data with its sequence number X+1 and ACK's B's sequence number Y+1


**TCP SYN Scans**
- If someone sends you a SYN packet for a port that is closed:
	- You are supposed to respond with a packet with RST and ACK flags ("i got your packet but I don't want to talk to you")
- Sending SYN packets to find out which ports are open on which machines is known as port scanning
- Bypass firewalls that only allow "established" connections
	- They block incoming packets with the "SYN" flag


**TCP FIN Scans**
- RFC says: do not respond... #todo 



**Defending Scans**
- Issue: Spoofed IP addresses
	- Option 1: Don't reply (hard to do because you need to deliver a service, and you don't want to suffer a Denial of Service)
	- Option 2: "Active" defense
		- In a SYN scan, if you send a SYN/ACK for every packet. You can force the attacker to complete the connection to gain infromation. This makes it more difficult to spoof the source IP and slows down scanner.




**SYN Flood**
- A resource DoS attack focused on the  TCP three-way handshake.
- Denial of service when an attacker sends many SYN packets to create multiple connections without ever sending an ACK to complete the connection, aka SYN flood.

**TCP Reliability**



**Hijacking A TCP Session**
- All that is required to mess up someone else's TCP session is guessing or knowing the sequence numbers for their connections.
	- Only need to fall within the needed rance, exact guess not needed
- Attackers needs
	- Ability to force TCP/IP packets.
	- Initial sequence number
	- Knowledge that a TCP connection has started (but not the ability to see it)
	- When the TCP connection started
	- Ability to redirect responses to you OR continue the conversation without responses to you while achieving your goal.
- Thought to be too hard, but exists in the wild.


## Lecture B | Intrusion Detection Systems for Industrial Control Systems


**Intrusion Detection Systems**
- And IDS is a system that monitors network or system activity for malicious activity
- Can be used to detect unauthorized access, misuse of privileges, or attampts to compromise ystem security.
- Its primary purpose

**Types of IDS**
- Host IDS
	- Monitors activities on specific devices
	- It will collect and analyze data from the system's OS, applications, and files
	- Can detect a variety of threats.
- Network IDS
	- Focus on monitoring network traffic for suspicious activity
	- Collects and analyzes data from network packets
	- Can detect threats that are not visible on individual hosts, such as unauthorized access and malware attackts


**Detection Methods**
- Signature Based
	- Uses known signatures of malicious activity to detect attacks
	- Relies on a database of known attack patterns or signatures
	- Compares incoming traffic against a database
	- Effective in detecting known attacks
	- Ineffective agains new or unknown attacks
	- Requires regular updates for the database
	- Usually does not cause a large burden on server processing power
- Anomaly-based
	- Monitors network or system activity for deviations from normal behavior
	- It creates a baseline of normal activity and then compares the subsequent activity against that baseline
	- Effecting in detecting new or unknown attacks
	- can generate a lot of false positives
	- Can be difficult to configure and tune.
	- In current research, these systems are the most widely used.

**How IDS works**
1. Data collection of system activity or network traffic
2. Data analysis
   - Compares collected data with a database of known attack patters or against a baseline of normal behaviour
3. Alert generation
	- Includes information about the nature of the incident, source, destination, IP addresses, time of detection, etc.
	- Can be prioritiezed based on severity
4. Notification and Response
	- Security personnel recieve and review the alerts
	- Implementation of manual or automated security measures
5. Logging and reporting
	- Maintain logs of detected evens and responses for later analysis and reporting
6. Continuous monitoring


| IDS                                                                          | IPS                                                                  |
| ---------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Passive system that monitors activity and alerts admins to suspisciou events | Active system that monitors activity and take action to stop attacks |
| Used for trheat deteciton, incident investigation, and compliance monitoring | Aims to prevent security before they can cause harm                  |
| Helps identify security incidents                                            |                                                                      |
| 




### IDS for Industrial Control Systems

**ICS Architecture** (From previous lecture)
[[509-cyber-security/notes#ICS Architectures| ICS Architectures]]


**Security Requirements of ICS**
- Real-Time
	- ICS are time-critical and operate in real-time
	- The operation time of each physical device is strictly limited
- Availability
	- Processes may be continuous and hence need to be highly available
- Risk management
	- Human safety and fault tolerance are the primary concerns.
- Physical Effects
	- Interactions with physical processes and consequences in the ics domain
- Communications
- Limited Computing Resources
- Fixed business logic
	- ICS should follow specific business logic, to achieve specific production goals
- Legacy Systems
	- There exists a significant portion of legacy sub-systems in ICS, making it difficult to upgrade the ICS
- Hard updating and restarting of industrial equipment
- Poor security of industrial protocols


**Why ICS-IDS are necessary**
- Emerging technologies bring new development opportunities for traditional ICS
- The shift from isolated environments to open environment exposes ICS to a broad scope of malicious cyberattacks
- Disruption of ICS could have a considerable negative impact on public safety or cause significant economic losses


**Type of ICS-IDS**
- HIDS in ICS (Host)
	- Can be used on computer workstations found within the industrial network
	- They do not run on PLCs or field devices
- NIDS in ICS (Network)
	- Most common type of IDS used in LCS
	- ICS networks use a variety of different networking devices and protocols, making difficult the deployment of a single NIDS
- Signature-based
	- `Quickdraw` was developed by Peterson et al. in 2014.
		- Snot-based IDS that uses a set of rules developed specifically for the ICS protocols Modbus/TCP and DNP3.
		- `Quickdraw` can detect a variety of attacks on ICSs, including configuration attacks, coil and register read/write attacks, and Modbus attacks.
	- Morris et al. developed a Snort-based IDS in 2016 to detect illegal data in teh Modbus protocol in a serial-based ICS. THey provided details on 50 intrusion detection rules that cna be sued to detect malicious activity in ICSs.
- Anomaly-Based
	- Statistical-based
		- Utulizes statustical algorithms such as parametric and nonparametric methods, time series analysis, and Markov chains.
		- Examins events or network traffic agains statistical models to confirm intrusion presence.
		- Anomaly detection assigns an anomaly score to events by comparing observed and trained statistical models.
	- Machine-learning based
		- Involves creating mathematical models for event creation
		- Machine learning techniques cna be supervised (with labeled training data) or unsupervied (data not labeled)
		- Examples of machine lerning algorithms include Artificial Neural Networks, Bayesian Networks, Support Vector Machines, Fuzzy Logic, Deep Learning, Clustering
	- Specification Based
		- Also known as knowledge-based IDS
		- Can be more complex to implement
		- Constructs models based on expert-defined specs that define legitimate system behaviours
		- Reduces false positives by using forma methods like state diagrams and finite automata
- Protocol Analysis-based
	- Utilizes protocol analysis technology to monotor industrial congtrol network traffic
	- Detects changes in protocol format or data packet status
	- Identifies abnormal behaviors within ICS
	- Common protocols are Modbus, ENIP, DNP3 are increasingly susceptivle to cyber attacks
	- Cheung et al. proposed an IDS mechanism in 2007. The model was derived form protocol specifications. This generated many false alarms.
	- Bro, a network-based IDS developed by the university of berkely, collects network packets and parses protocols
	- Lin et al. improved Bro by designing a packet parser supporting industrial protocols like DNP3
	- Hong et al. analyzed smart grid substation systems based on IEC 61850 standards. Detected anomalies or malicious behaviors in multicast messages specified by IEC 61850.
	- Protocol analysis-based IDS combined with traffic analysis for more effective intrusion detection
	- Communication patters defined in ICS protocols and specific business logic are used to extract detection rules.
	- 





































































































