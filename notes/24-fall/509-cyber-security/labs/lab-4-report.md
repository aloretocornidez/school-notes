# Lab 4 | Port Scanning

## Objective

- The purpose of this lab is to familiarize the student with the basics of port
  scanning
- In this lab, the student will perform port scanning attacks using NMAP
- The students will also use NMAP to identify the different services running on
  the target system

## What is port scanning?

- Attackers use port scanning to perform reconnaissance on the target system
- A successful port scanning attack, informs the attackers of the open ports and
  services running on the target system
- The attacker uses this information to perform an attack by exploiting an
  existing vulnerability on one or more services running on the target system

## Lab IP Addresses

Attacker: 10.85.24.168 Target: 10.85.24.207

## Lab Report

- From Experiment 1 Step 4: Observe the traffic and describe how `nmap` knows
  which ports are open and which are closed.

  - The way that the `nmap` command can decipher which ports are open is by
    looking at the response of the target. Whenver a port is closed, the
    response shown in wireshark is red. However, whenver the port is open then
    wireshark shows a gray response. From a technical perspective, the open
    ports will reponse with a TCP packet using the `ACK` flag, wheras closed
    ports will respond with the both the `ACK` and `RST` flags.

- Investigate the command used in Experiment 2 Step 1, what is half-port
  scanning, and how it works.

  - half-port scanning, also referred to as half-open scans, are port scan
    attacks which, according to
    [nmap documentation](https://nmap.org/book/man-port-scanning-techniques.html),
    do not open full TCP connections, these attacks send a `SYN` packet as if
    you are going to open a TCP connection, but only look at the response given
    by the target. Depending on the response, you may know if a target has an
    open/listening port. (The presence of an RST flag denotes this.) This port
    scan method is stealthy in comparison to the default connect scan executed
    by nmap when the user is unprivileged. half-open scans can be executed in
    `nmap` using the `-sS` flag.

- Observe the differences in Experiment 3 Step 1. Investigate why one command
  provides more information than the other. ![[Pasted image 20231127115710.png]]

  - Above is a screenshot of the difference between the output of the same
    command `nmap -A <target I.P.>` using both normal(left) and elevated(right)
    privileges. As you can see, both the normal and root user can see that
    pports 22 and 5901 are open, however, the normal user is locked out pf the
    protocol on port 5901, whereas the root user is not locked out. There is a
    message given by the `nmap` command stating the the specific operating
    system of the target is not found and a fingerprint is given. In addition,
    the number of hops is given when running the root command.

- Based on the traffic observed in Experiment 3 Step 2, how does nmap find the
  OS and running services?
  - `nmap` deciphers the OS that the target is using by using a multitude of
    probing techniques. TCP ISN sampling, TCP options support ordering, IP ID
    sampling, and the initial window size check are all used to compare against
    a database with known parameters. This data is then consolidated to come up
    with a match for an operating system. If the exact operating system is not
    known, then an approximation is provided.
