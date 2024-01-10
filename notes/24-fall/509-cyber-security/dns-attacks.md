# DNS and DDOS Attacks

## What is DNS?

## DNS Terminology

- Zone: A collection of hostnames/IP paris all managed togethers.
- Nameserver: This is server software that answers DNS questions, such as, "What
  is the IP address for www.unixwiz.net?"
- Authoritative Nameserver: For every zone, somebody has to maintain a file of
  the hsotnames and IP address associations (linux.unixwiz.net is 64.170.162.98
  and so on.). It is the zone master.
- Resolver:

- Recursive Nameserver: This is a nameserver that's willing ot go out on the
  internet and find the results for zones it's not authoritative for, as a
  service to it's clients.

- Resource Record: Though most think of DNS as providing hostname-to-IP mapping,
  there are actually other kinds of questions we can ask a nameserver.

- Delegation:

## DNS Packet Structure

- 32 bits

The IP header contains the Source and Destination IP addresses.

THe UDP Header contains the Source port and the Destination port

The DNS data contains the Query ID.

- Source Destination IP:
- Source Destination Port Numbers
- Query ID
- Query / Response: Set to 0 for a query from a client, and set to 1 for a
  response from a server.
- AA (Authorative Answer): set to 1 if the reponse from the server is
  Authorative
- Recursion Desired: set to 1 if the client wants to search name tables
  recursively
- RA: Recursion Available

## DNS Root Name Servers

Local servers contact root servers when they cannot reoslve a name.

## Caching

DNS Responses are cached. Why?

- Quick response for repeated translations
- Other queries may reuse some parts of lookup

DNS negative queries are cached

- Don't have to repeat past mistakes.
- misspellings, search for strings in resolv.conf

Cached data periodically times out

- Lifetime of the data (TTL) is controlled by the server owner.

## DNS in Real World

Subsequent Lookup example:

Assuming that the server does not have the address in its cache, then you
progressively go up domains:
`fengshui.ece.arizona.edu -> ece.arizona.edu -> arizona.edu -> root & edu DNS server`

## Threat Model of DNS Flow

The DNS is the 'engine' of the internet, so it is the most commonly attacked
sector of the internet.

What are the attack surfaces of a DNS lookup?

The Zone file

Dynamic Updates Masters Slaves Caching Forwarder Resolver

## DNS Attacks

- DNS Spoofing Attack

- DNS Rebinding Attack
  - Uses the same-origin-policy (SOP) and time to live (TTL).
  - SOP: The origin of a website is defined by the protocol, domain, and port.
    For example, URLs A and B have the same origin, but URL C has a different
    origin.
    - A: http://www.yourname.con/index.html
    - B: http://www.yourname.con/news.html
    - C: http://www.yourname.con/index.html
  - TTL defines the amount of time in seconds that a record can be cached before a web server will re-1uiery the DNS name server.










