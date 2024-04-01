---
title: User Authentication and Passwords
author: Alan Manuel Loreto Cornídez
date: March 29th, 2024
output: pdf_document
---

# Basic Problem

How do you prove that you are someone you claim to be?

Any system with access control must solve this problem.

# Authentication

Authentication is the binding of an identity to a subject (e.g. a person or a
machine.)

There are multiple ways to prove that you are the individual you claim to be.
Examples of these items can be:

- What you know: passwords, SSN, birthdates
- What you have: physical keys, credit cards, smart card
- What you are: biometrics
- Where you are

<!-- Often we want to verify who is being authenticated in what way, such as: -->

There are many situations that are possible when authenticating an actor in a
system. Who is being authenticated?:

- Authenticate a person to a server
- Authenticate a machine to a machine
- Authenticate both a person and a machine to a server
- A machine stores a high-quality secret; a person memorizes a low-quality
  password

# Authentication of People

User authentication aims to verify that you are indeed who you claim to be.

# Password Based Authentication

This kind of authentication is part of the 'what you know' subset.

The user has a secret password and the system checks it to authenticate the
user.

Password in plaintext being sent for authentication has a few problems:

- eavesdropping
- database reading
- password guessing: on-line, off-line (dictionary attack)

# Storing User Passwords

Where do you store passwords? What format do you store passwords in?

Where to store:

- Store passwords individually on each server.
- Store all passwords at an authentication storage node
  - Retrieve password information from the storage node; authentication is done
    at the server node
- Store all passwords at an authentication facilitator node
  - Send the login information received to the facilitator node; authentication
    is done at the facilitator node; result is sent back to the server node.

In what format:

- Store plain passwords
- Store hashes of passwords
  - password guessing
- Store encrypted passwords
  - Involves a high quality key, cannot do a password guessing attack, but
    vulnerable to an insider attack.

## Password Hashing

Instead of storing the password, you can store the hash of the password. The
user enters the password and then the hash is computed to compare the entry in
the password file.

The system does not store actual passwords using this system.

However, the hash function must have the following characteristics:

- One-way
- Collision-resistant

## Unix Password System

Unfortunately, passwords are not truly random. Passwords containing names or
common terms are quite common and thus, there are many common passwords.

# Dictionary Attacks

The password file is readable at `/etc/passwd` is world readable

This file contains user IDs and group IDs which are used by many system programs

A dictionary attack is possible because many passwords come from a small
dictionary.



