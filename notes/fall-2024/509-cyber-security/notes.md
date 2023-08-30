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































