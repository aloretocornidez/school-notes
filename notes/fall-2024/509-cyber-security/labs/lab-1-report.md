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




