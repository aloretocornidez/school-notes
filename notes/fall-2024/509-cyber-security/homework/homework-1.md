# ECE 509 | Homework 1

Name: Alan Manuel Loreto Cornídez
Date Due: September 12th, 2023



# Question
Apply threat modeling to the smart home architecture below:

![[Pasted image 20230906102412.png]]


---

Follow all the steps in threat modeling (except step 4: validate), identify 5 potential threats, apply STRIDE, and DREAD models, identify the impacted assets, and impacted entry points, and describe the mitigation strategy to handle each threat. Use the following tables as guidelines.




**Threat Identification and Categorization (STRIDE) **

1. Footage from the security camera may be harvested without user authorization.
2. Malicious commands may be sent to any of the 'smart' devices that are contained within the home.
3. Data that is transmitted via the internet may be harvested without user authorization.
4. A malicious actor may gain access to the information contained within the mobile device used to control the smart hardware.
5. Each of the pieces of smart hardware could have commands sent to them that causes them to perform self-destructive actions.
6. Malicious actor may cause the house to ignore the homeowner's commands or remove the owner from trusted devices.

| Threat Description | Spoofing | Tampering | Repudiation | Information Disclosure | Denial of Service | Elevation of Privileges |
| ------------------ | -------- | --------- | ----------- | ---------------------- | ----------------- | ----------------------- |
| Threat 1           |          |           | X           | X                      |                   |                         |
| Threat 2           | X        | X         |             |                        |                   |                         |
| Threat 3           |          |           |             | X                      |                   |                         |
| Threat 4           | X        | X         |             |                        |                   |                         |
| Threat 5           | X        | X         |             |                        | X                 |                         |
| Threat 6           | X        |           |             |                        | X                 | X                       |















**Threat Risk Assessment (DREAD)**


| Threat Description | Damage | Reproducibility | Exploitability | Affected Users | Discoverability | DREAD Score |
| ------------------ | ------ | --------------- | -------------- | -------------- | --------------- | ----------- |
| Threat 1           |        |                 |                |                |                 |             |
| Threat 2           |        |                 |                |                |                 |             |
| Threat 3           |        |                 |                |                |                 |             |
| Threat 4           |        |                 |                |                |                 |             |
| Threat 5           |        |                 |                |                |                 |             |
| Threat 6           |        |                 |                |                |                 |             |


**Impacted Asset Identification**

| Threat Description | Compute Resource | Physical Safety | Availability Integrity | Data Integrity | Data Availability | Data Privacy |
| ------------------ | ---------------- | --------------- | ---------------------- | -------------- | ----------------- | ------------ |
| Threat 1           |                  |                 |                        |                |                   |              |
| Threat 2           |                  |                 |                        |                |                   |              |
| Threat 3           |                  |                 |                        |                |                   |              |
| Threat 4           |                  |                 |                        |                |                   |              |
| Threat 5           |                  |                 |                        |                |                   |              |
| Threat 6           |                  |                 |                        |                |                   |              |

**Impacted Entry Point Assessment**

| Threat Description | Embedded HW/SW | Communication Channels | Admin Tools | Remote Application Interface | Deployment Infrastructure | Mitigation Strategies |
| ------------------ | -------------- | ---------------------- | ----------- | ---------------------------- | ------------------------- | --------------------- |
| Threat 1           |                |                        |             |                              |                           |                       |
| Threat 2           |                |                        |             |                              |                           |                       |
| Threat 3           |                |                        |             |                              |                           |                       |
| Threat 4           |                |                        |             |                              |                           |                       |
| Threat 5           |                |                        |             |                              |                           |                       |
| Threat 6           |                |                        |             |                              |                           |                       |





**Threat Mitigation Analysis**

