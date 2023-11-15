# ECE 509 Lab 1 | Packet Sniffing

Name: Alan Manuel Loreto Cornidez

Objective: Determine how packet sniffing via the use of wireshark can be used to retrieve packet data and how different security measures can be used to mitigate adversarial action.

## Preface 


In this experiment, packet sniffing was conducted via the use of wireshark on a client and server virtual machine (VM).

In order to execute the attack, the attacker must have access to wireshark on the server that is completing requests. 

Depending on the protocol that is used, the attacker can retrieve different pieces of information from the communication/packets captured via the use of wireshark.


## Part 1 | Telnet Packet Analyzation

Telnet sends packets in plain text format. Below is a copy of a single packet captured via the wireshark program:

![[Pasted image 20231106102140.png]]

As you can see, the data that is recorded contains a lot of information that is noise if all we want is the data.

Extracting data from these packets is relatively simple because all of the data is stored in plain text.

By using the command `grep -i'data' wiresharkoutput.txt`, the data contained within the packets can be extracted to the following:

![[Pasted image 20231106105849.png]]

When taking a quick look at the data contained here, we can see that every piece of information is visible. This includes the letters that are typed, the backspaces, and all of the new lines. 

As an attacker, we can see that `claas` was entered first and then the enter key was pressed, after that, we can see that `Claas2022` was entered. We can also see an attempt that looks like a type before that, which reinforces the fact that a username and password combination was attempted.

By looking into the data that was sent, we can see an `echo` command being called with the string argument "you are being watched" which, personally, I wouldn't want to see as an attacker.

![[Pasted image 20231106110923.png]]

If we wanted to find more data, we can change our grep command to also extract the time each packet is sent amongst other pieces of information.

The telnet protocol is very easy to exploit if you require data from the packets that are being sent.


## Part 2 | SSH

### Analysis of SSH Packets
When looking at the packets that are being captured, we can see that much of the information contained within the packets is  encrypted, specifically, the information that tells us what was typed. The SSH protocol uses a different encryption algorithms to encrypt the packets. Some packets use an aes128 algorithm and other packets use a chacha20-poly1305 algorithm as shown on the lower two screenshots of wireshark.

![[Pasted image 20231107134950.png]]
![[Pasted image 20231107134921.png]]

However, not all information is encrypted. We can still see the the destination and source IP addresses. This means that I am still able to tell who is communicating with the server, even if I cannot see what is being communicated.

Another interesting thing of note is that we can tell when keys are being generated and transferred. Wireshark lets us know which packet types are being transferred, for example, as shown in the following screen shot, we can see many kind of packets being used to transfer data. Although all of them are in the SSH protocol, each of them are different types of SSH packets.

![[Pasted image 20231107133656.png]]



### Describe the steps and their results in the report

As stated in the previous answer, we can see many kinds of SSH packets are being transferred, even if we cannot see the contents, we can still find out important information about the connection that was made. 

When using a filter to extract all communication made by our source IP, we can examine our connection. 

![[Pasted image 20231107134007.png]]



First, we can see a few packets that initialize the connection, in this case, we get information about the system client, such as the fact that the OpenSSH protocol is being executed on an Ubuntu client. 

Next, we can see that a Key Init has taken place, this shows that the connection from the client is being made for the first time and/or the system is sending the keys that are being used to establish communication.

If I had to pick which packets I should attack, the ones with the keys are the main targets, because if I can find the key and then also find the user name of an account that is present on the serve,r I could start to execute commands on the machine that would give me more permissions or information. 

From that point on, we can see normal communication being executed, this is just the text that is being sent to the client's terminal as well as communication that is being sent from the client to the server. All I ran was a simple echo command with sample text inside. 


### Can you obtain a username and password, or any useful information sent via SSH? 
While we may not be able to see all of the information that we would like (as an attacker) We can still extract multiple pieces of information such as the client being used by the connections that are bring made, such as the Distribution that is being used by the client VM in this case.

We can also extract IP addresses, times of communication, new connections being made to the server. While this may not be useful on its own, it is possible to use this data in conjunction with other data that can be gathered to either conduct an attack, conduct an investigation, or conduct other actions.




## Part 3 | TCP Connections

The first immediately noticeable aspect regarding TCP connections in the sheer amount of TCP packets that are being sent in such a short amount of time.

I only captured network traffic for approximately 5-8 seconds and there were at least 5000 packets that were generated and sent. 

As for the ports that were using TCP connections, most of them were using port 6080 and port 22021. However, there were a few that were not, such as 1572, 3215, 45274, 57567, 80, and port 22.

![[Pasted image 20231107144502.png]]

As for IP addresses in the when using the tcp filter, we can see that a lot of tcp requests are made to the 150.135.165.25 IP address, which is internal to the university of Arizona. As you can see in the screenshot above, many of the packets look like this, where they do not actually conduct an operation. Which was interesting to me.

As for the sequence number, I say a wide range in my capture. There were some captures with a sequence number of 0 or 1 as shown in the following screenshot.

![[Pasted image 20231107144654.png]]

There were also captures of packets with much larger sequence numbers as shown in the following screenshot: 
![[Pasted image 20231107144756.png]]

An interesting thing to note is that while the SEQ number might be the same, the Ack number is not. 

Another thing of note is that a lot of the connections made from port 6080 forward to port 22021. The seq numbers from the connections that forward from port 22021 to 6080 have much larger seq numbers as shown in the following screenshot:
![[Pasted image 20231107145125.png]]

The largest number that I found was in the order of 4025568. Assuming that those seq numbers are near the high end of the possible seq numbers, then the largest number that is possible may be $2^22$ or 41,954,304.



### HTTP Filter

When applying the http filter to wireshark we get the following: 

![[Pasted image 20231107151346.png]]

We can see that the source and destination IP addresses are googe.com's server and the IP address of the virtual machine. We can see that the initial request is a GET request to google's server. The initial GET requests contains the user agent, in this case, elinks, as well as a cookie and the language requested. In addition, a keep-alive request is sent in the first packet.

Afterwards, we can see the response from google's servers. The response is the HTML file form google.com to load the webpage. We can see the file is in HTML format and it is in UTF-8 encoding. We can see other information transferred in the packet as well, such as the security policy used to transfer the file and an expiration date for the web page. There is also a 0 flag for XSS which may mean that there is no XSS filtering enabled.

For the ports, we can see the following ouptut:
![[Pasted image 20231107152229.png]]

Source ports for the last and second packets (the responses from the server) were made from google's server. We can see that the src port from the VM changes from 52748 to 55292 from the first packet to the third packet. In addition, we can also see that the Seq number for each of the packets is 1 except for the last packet that is received, this makes me think that when initializing a connection the computer highly prioritizes the packets, but after the connection has been made the packet seq numbers are selected based on other criteria.



## UDP Traffic Analysis


- Source and destination IPs  
  
  ![[Pasted image 20231111191222.png]]
  From the image, we can see two packets that are generated.  
	- Packet 1: 
		- Source: 10.85.24.130
		- Destination: 10.85.0.2
	- Packet 2: 
		- Source: 10.85.0.2
		- Destination: 10.85.24.130

- Source and destination port numbers on both the client and server  
	- Packet 1: 
		- Source Port: 36718
		- Destination Port: 53
	- Packet 2: 
		- Source Port: 53
		- Destination Port: 36718
-  The packet parameters  
	- Packet 1:
		- ![[Pasted image 20231111191928.png]]
		- We can see that the only flag that was set was the 'recursive query' flag. Questions, and RRs were set to a positive flag as well.
	- Packet 2: 
		- ![[Pasted image 20231111192141.png]]
		- In this packet, we can see that the 'answer' flag is positive. 
		- In addition, recursion desired and recursion available flags are set positive as well. All other flags are set to a positive flag as well.
		- Questions is 1, Answer RRs is 2, and the answer specifies the type CNAME, class IN, and cname is 'rweb.engr.arizona.edu'.
		- The time to live for this response is 300 seconds, equivalent to 5 minutes.





- Maximum and minimum values of these parameters
	- Time to live is held in a 32 bit word, so 2^32 - 1 seconds
	- Data length is 8 bits
	- Address is also 8 bits.

Step 4: Other DNS Lookups:

When doing multiple DIG commands after each other, I was unable to get a response from the original four sites. However, after wating for a while, I was able to query the servers again and get a valid response. Hence, showing the implementation of attack mitigations by including wait times for responses.
- Google: 
	- Dig google.com output:
	- ![[Pasted image 20231111193019.png]]
	- Request:
		- ![[Pasted image 20231111194004.png]]
		- ![[Pasted image 20231111194014.png]]
- Wikipedia (Done using wikipedia.com, to test incorrect name resolving): 
	- ![[Pasted image 20231111193129.png]]
	- This did not generate any udp packets
	- Request:
		- ![[Pasted image 20231111194057.png]]
		- ![[Pasted image 20231111194105.png]]
	- Response:
		- ![[Pasted image 20231111194125.png]]
		- ![[Pasted image 20231111194139.png]]
	- Statistics:
		- Query:
			- Recursion desired flag raised
		- Response:
			- Flags Raised: Response, Recursion {available, desired}
			- Name: wikipedia.com 
			- Type: A (Host Address)
			- CLass: IN
			- Time to live: 300 seconds (5 Minutes)
			- Address: 198.35.26.98
	- Regardless of the fact that the name used for the domain as incorrect, the packet returns the address to the wikimedia.org domain.
- Youtube: 
	- ![[Pasted image 20231111193412.png]]
	- Above is the dig command for youtube after a bit of rest time.
	- Request
		- ![[Pasted image 20231111193503.png]]
		- ![[Pasted image 20231111193640.png]]
	- Response
		- ![[Pasted image 20231111193559.png]]
		- ![[Pasted image 20231111193616.png]]
	- Statistics:
		- Flags were contained in a 32 section of the packets.
		- UDP payload size: 512, stored in 8 bits of information.
		- Reponse was
			- Type A (Host Address)
			- Class: In
			- With 264 seconds to live
			- Data length of 4
			- Address 142.251.33.110
			- With a UDP payload size of 4096.
			- Flags Raised: Response, Recursion desired, Recursion available.
- Github: 
	- Request:
		- ![[Pasted image 20231111193659.png]]
		- ![[Pasted image 20231111193707.png]]
	- Response:
		- ![[Pasted image 20231111193742.png]]
		- ![[Pasted image 20231111193754.png]]
	- Statistics:
		- Query:
			- Flags Raised: Recursion desired
			- Name: github.com
			- Name length: 10
			- Label Count: 2
			- Type: A (Host Address)
			- Class: IN
			- Additional Records:
				- Type OPT (41) 
				- 512 payload size


Recap: 
- What information does a DNS request packet contain?  
	- The packet conatins the name of the domain being requested, the type of the query: A for host address, etc.
	- In addition, we can see the flags for the packet that let the DNS system know that this packet is not a response, but instead, a request.
- What information does a DNS reply packet contain?  
	- The packet contains three important things that we immediately care about:
		- Name used to query a domain
		- The address of the name that was queried
		- The time to live for the response.
	- In addition to that vital information, we also get the headers that contain information regarding responses, queries, and recursion requests among others.
- Which resource is handling each DNS request for each domain name?  
	- All of the packet requests were sent out to port 53, which upon further inspection, is the domain name system service present on a system.
	- However, the source port of each of the requests is different, varying from port 49406 (wikipedia) to port  33673 (github).
- How many steps are required to obtain an IP address for each request?
	- From the viewpoint of the server, only one packet is sent as a request and then one packet is received. However, when looking at the total architecture of the internet, many packets can be sent over the network to resolve a domain name. Especially if the domain isn't common.





