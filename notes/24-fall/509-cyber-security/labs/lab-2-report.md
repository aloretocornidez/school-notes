# ECE 509 Lab 2 | Denial Of Service

Name: Alan Manuel Loreto Cornidez

Purpose: The purpose of this lab is to understand Denial of Service (DoS) and Distributed DoS (DDoS) attacks. The student will exploit vulnerabilities in the network and application layers.

IP Addresses:
Server: 10.85.24.218
Client: 10.85.24.106
Attacker 1: 10.85.24.145
Attacker 2: 10.85.24.152
Attacker 3: 10.85.24.167



## Normal traffic  
There were 6 total packets that were sent when communicating over the TCP protocol.

![[Pasted image 20231112132432.png]]

As we can see in the diagram. There was an initial SYN packet with a response from the server containing an ACK (in addition to the payload requested by the client). After the client received the payload, the client then sent an ACK to the server to signify that the client received the payload. After this, the client sent a FIN/ACK packet to terminate the connection. The server then responded with the ACK to terminate the connection. 

Packet Dissection:
![[Pasted image 20231112132556.png]]

![[Pasted image 20231112132634.png]]

![[Pasted image 20231112132643.png]]

![[Pasted image 20231112132651.png]]

![[Pasted image 20231112132701.png]]

![[Pasted image 20231112132710.png]]

Each of the packets has a certain set of flags raised. As we can see, the first packet has the SYN flag raised, signifying an attempt to initialize a connection to the server from the client. The second packet contains an ACK flag to signify the receipt of the connection initialization  SYN packet. THe third packet that ws set was the payload. Wireshark flags this as an HTTP protocol packet. However, when looking at the contents of the TCP headers contained in this packet, we can see the **PSH** flag and the ACK flags being raised. This makes sense since this is the originally requested payload to the client. After this, the 4th packet contains an ACK flag, to signify receipt of the payload. The final two packets are used to conduct a connection close operation, with the ACK and FIN flags being raised in the 5th packet and a final ACK flag being raised to signify to closing of the connection.

All packets had the same source port (36058) and destination port (80).
The only packet that had the TCP Segment Length parameter filled was the HTTP packet containing the requested payload. By using this information we can see which communication is actual information and which is just formalities within the connection.



## HTTP Load  

After launching the following command on the Attacker 1 VM:
```bash
sudo httperf --hog --server=172.31.29.206 --wsess=100000,5,2 --rate 1000 --timeout 5
```

The wireshark gui immediately filled up with packets being sent to the IP address of the attacker VM.

![[Pasted image 20231112134346.png]]

Effects of the attack:
- The attack did not cause my client to be unable to recieve the website.  
- The attack did affect my ability to use the VNC (desktop) viewer. The desktop environment became unusable for at least 4 minutes even though the attack only lasted approximately 50 seconds.

![[Pasted image 20231112135310.png]]

After resetting the VMs and running a short test (this time only 1.056 seconds) using httperf, we can see that multiple requests for the same page were sent. The attacker was making too many requests for the server to respond. 

In order to prevent this attack, it would be very simple to implement a check for the same IP address to have a bandwidth limit on the requests that can be served. For example, the server would only share X amount of requests per time unit in order to not over burden the server with needless responses. In addition, if we know what the intended way to serve a page should be, we could implement web page caching for the web browser so that the user does not have to make a new request every time they refresh the web page.


## HTTP Load with multiple attackers  

This attack did many similar things to the last experiment. The VNC view lost control over the desktop environment after a while. When I tried to install a package on the virtual machine (neofetch, to check if the server was still operating) the server was able to download the package, but mid-way through, the view stopped working. 

When using the client to access the website, the client was able to get a response, but it was much slower than normal, even after the attack had been stopped. 

Using the same method to stop the attack may be possible because we only have three ip addresses. However, as we expand the attack to more attackers (let's assume, thousands of dummy machines), the same method of checking for repeated machine accesses may not work as well. 

However, to assist in reducing the efficacy of the attacks, the same mitigation strategy mentioned in the previous section could still be implemented. (Web Page cacching) .

Another way to assist in avoiding attacks is by introducing rate limiting for the server so that botnets (a situation like the lab) in general.

While the approaches to reduce the severity of attacks is similar for both DoS and DDoS attacks, the solutions may not be as effective depending on how they are implemented.



## TCP SYN attack


This attack immediately  caused the server VNC to shut down. The web page was also unable to load on the client. 

The difference between this attack at the other attacks was the way that the packets were solely SYN packets. This made the server open ports and exhausted all of the resources available to the server rather quickly. Since the SYN packets were not ACKed, the connections stayed open longer than the HTTP requests. 

Unfortunately, I was unable to get screenshots for this exercise because the vnc stopped the working as soon as I started the attack and I was unable to properly access the VMs unless I stopped and restarted the experiment. 

The command that we used to launch the attack on the server was:

```bash
sudo hping3 -i eth1 --flood -S -p 80 <SERVER_IP>
```

sudo: root access
hping3: the program
-i eth1 --flood: the network interface sends as many packets as possible.
-S: set the SYN flag for each packet.
-p 80: sends them to port 80 on the server.

With that being said. One of the interesting options that I found on the `hping3` help page was the spoof address option that would allow spoofing of IP addresses.

I was unable to access the website at all, even after stopping the attack from the attacker VMs. this is because the connections that have been opened by the attack have a longer time to live on the system, and as such, exhaust resources more extensively than the HTTP load attack. Below is a diagram showing the attack from each of the different attackers and another diagram showing the client trying to access the system. As we can see, even though the server responds with an ack to the attacker, the attacker just produces another SYN requests, leaving the connection open on the server and not letting useful traffic initialize connections.

![[Pasted image 20231112172004.png]]


One way to detect this attack would be by not allowing more than a certain number of simultaneous connections to remain open from a single IP address. This would really only work for non-distributed DoS attacks, resolving this issue for DDoS SYN attacks is a much more complex issue.



