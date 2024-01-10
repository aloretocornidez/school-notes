# Lab 3 | DNS Attacks

Name: Alan Manuel Loreto Cornidez

IP Addresses:
Server: 10.85.24.111
Attacker: 10.85.24.151
Client: 10.85.24.156

# Questions
## Describe the mechanism this attack uses to exploit a DNS vulnerability and create a diagram of the traffic between the VMs.

There's a few steps that must be taken to conduct the DNS poisoning attack on the client. 

First, there were two steps that were done to configure the attack.
	1. The attacker must configure their `bind` settings in order to respond to any dns requests with the pre-configured IP address (in this case, the attacekr vm just returns its own IP address.) After the config file is editted, the bind service is restarted using the `systemctl` system in order to apply the new settings that were made with the use of bind.
	2. The client vm has to have been compromised at this point. In order to configure the client to be susceptible to the attack, the resolve.conf file must be manipulated to send DNS requests to the attacker's machine. That is why we modified the `resolve.conf` file. 

After both the attacker and the client have been configured, the attack is ready to be done.

The client VM requests a website. That request is then received by the attacker. The attacker then tries to respond with the malicious IP address for the response. This is called cache poisoning. After the client receives the malicious packet, the client will then navigate to the malicious website.



This attack, while functional, is not guaranteed to work. This is because there is a race condition present between the attacker VM and the server VM. Whichever system is able to respond first is the site that will get navigated to by the client. 

This is shown in the diagram below: 
![[Pasted image 20231121160357.png]]

As we can see, both the attacker and the server may see the request, and although the attacker may be able to send its response faster, factors outside the attacker's control may affect the time it takes for the response to arrive to the client. This means that even if the client is compromised, it is still possible for the client to not see the consequences of the compromised computer.

We can see from the wireshark packet display, that different responses are used by the client when different requests are made. This shows how, while this attack is not consistent, it can still cause damage.

![[Pasted image 20231121161527.png]]





## Suggest one approach to detect this attack.

One of the ways that you can detect a DNS poisoning attack is by monitoring DNS behaviour in a network. There are two main factors that can signal that cache poisoning has taken place:
1. An increase in DNS activity from a source that queries your DNS server for multiple domain names without returns.
2. An abnormal increase in DNS activity from a single source to a sole domain.
[Source](https://www.mimecast.com/content/dns-spoofing/).



## Investigate how the cache poisoning on DNS servers works.

In our lab experiment, we only focused on the communication between one client and one server, however, in in the real world, each relay in the network acts as a relative client. This means that the implications of one compromised client can affect multiple other relays and their responses. This makes the act of poisoning one DNS relay have more effects than initially suspected because the deeper that a relay is within the network, the more that other relays will recieve the malicuous IP address, and the more clients (and additional relays) will use the malicious IP address. (Which allows the use of XSS to cause other attacks.)


# Conclusion
- The DNS protocol used to resolve domain names to IP addresses has many security flaws that can be exploited.
- Some of the attacks that we exploited, including the cache poisoning attack, can be prevented using DNSSEC and similar protections to ensure the authenticity of the transferred zones
