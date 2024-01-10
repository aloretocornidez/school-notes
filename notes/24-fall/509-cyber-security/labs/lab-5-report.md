# Lab 5 | Port Scanning

Name: Alan Manuel Loreto Cornidez

## Purpose

- Actively map the network infrastructure of a target using Nmap
- Perform a vulnerability scan
- Identify the obtained vulnerabilities on the CVE database

## Software Tools

- Network Mapper (Nmap)
  - Free open-source network scanner
  - Used to identify devices running, open ports, available services, perform
    host discovery, and detect security risks
- Common Vulnerabilities and Exposures (CVE)
  - A project dedicated to tracking and cataloging vulnerabilities in consumer
    software and hardware

## Background

- Active information gathering
  - Detected by the target as suspicious or malicious behavior
  - Actively map the network infrastructure
- Port scanning
  - Method of determining which ports on a network are active/open, this allows
    the identification of services running in the target
- Vulnerability scanning
  - A technique used to identify known vulnerabilities in a target

## IP Addresses

Target: 10.85.24.57 Attacker: 10.85.24.155

## Experiment 1

```bash
ip route
```

![[Screenshot_20231201_181808.png]]

IP Range: 10.85.24.1/20

```bash
nmap -sT -p <port> <Attacker IP range>
```

Port 80 ![[Pasted image 20231201182134.png]]

Port 443 ![[Pasted image 20231201182159.png]]

### OS Scan

Basic

```bash
sudo nmap –O <Target IP address>
```

![[Pasted image 20231201182417.png]]

Not much information found using the basic OS scan.

```bash
sudo nmap –A <Target IP address>
```

![[Pasted image 20231201182623.png]]

After using the `-A` flag, `nmap` detected that the OS was Ubuntu and that
openVNC was being used as the VNC viewer.

## Experiment 2

```bash
sudo nmap –-script vuln –sV <IP address>
```

![[Pasted image 20231201185029.png]]

Visiting the CVE Lookup site: https://cve.mitre.org/cve/search_cve_list.html

### Looking at Vulnerabilities:

CVE-2020-12062 ![[Pasted image 20231201185307.png]]

CVE-2020-14145 ![[Pasted image 20231201185723.png]]

CVE-2020-15778 ![[Pasted image 20231201185214.png]]

CVE-2016-20012 ![[Pasted image 20231201185421.png]]

CVE-2021-28041 ![[Pasted image 20231201185648.png]]

CVE-2021-41617 ![[Pasted image 20231201185707.png]]

## Report Questions

### Experiment 1:

- Step 3: What is the status of the ports you specified?
  - It is interesting to see that both port 80 and port 443 were closed for both the attacker and the target.
- Step 5: What information were you able to obtain?
  - Even though the ports were closed, by using the `-A` flag with `nmap`, we were able to identify multiple aspects about the server. The name of the operating system and the versions of ssh (port 22) and VNC protocols being used (port 5901).

### Experiment 2:

- Step 1: How many vulnerabilities did you obtain?
  - There were 6 unique CVE codes that were present.
- Step 2: Choose three vulnerabilities and obtain detailed information using the CVE database.

## CVE-2020-12062 Detail

**Modified**

---

This vulnerability has been modified since it was last analyzed by the NVD. It is awaiting reanalysis which may result in further changes to the information provided.

### Current Description

The scp client in OpenSSH 8.2 incorrectly sends duplicate responses to the server upon a utimes system call failure, which allows a malicious unprivileged user on the remote server to overwrite arbitrary files in the client's download directory by creating a crafted subdirectory anywhere on the remote server. The victim must use the command scp -rp to download a file hierarchy containing, anywhere inside, this crafted subdirectory. NOTE: the vendor points out that "this attack can achieve no more than a hostile peer is already able to achieve within the scp protocol" and "utimes does not fail under normal circumstances.

### Severity

**CVSS 3.x Severity and Metrics:**

**NIST:** NVD

**Base Score:**
[7.5 HIGH](https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator?name=CVE-2020-12062&vector=AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:N&version=3.1&source=NIST)

**Vector:**  CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:N

## CVE-2020-15778 Detail

**Modified**

---

This vulnerability has been modified since it was last analyzed by the NVD. It is awaiting reanalysis which may result in further changes to the information provided.

### Current Description

scp in OpenSSH through 8.3p1 allows command injection in the scp.c toremote function, as demonstrated by backtick characters in the destination argument. NOTE: the vendor reportedly has stated that they intentionally omit validation of "anomalous argument transfers" because that could "stand a great chance of breaking existing workflows."

[View Analysis Description](https://nvd.nist.gov/vuln/detail/CVE-2020-15778#vulnCurrentDescriptionTitle)

### Severity

**CVSS 3.x Severity and Metrics:**

**NIST:** NVD

**Base Score:**
[7.8 HIGH](https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator?name=CVE-2020-15778&vector=AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H&version=3.1&source=NIST)

**Vector:**  CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H

## CVE-2021-28041 Detail

**Modified**

---

This vulnerability has been modified since it was last analyzed by the NVD. It is awaiting reanalysis which may result in further changes to the information provided.

### Description

ssh-agent in OpenSSH before 8.5 has a double free that may be relevant in a few less-common scenarios, such as unconstrained agent-socket access on a legacy operating system, or the forwarding of an agent to an attacker-controlled host.

### Severity

**CVSS 3.x Severity and Metrics:**


**NIST:** NVD

**Base Score:**
[7.1 HIGH](https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator?name=CVE-2021-28041&vector=AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:H/A:H&version=3.1&source=NIST)

**Vector:**  CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:H/A:H
