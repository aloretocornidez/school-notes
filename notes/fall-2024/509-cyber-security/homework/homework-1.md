# ECE 509 | Homework 1

Name: Alan Manuel Loreto Cornídez
Date Due: September 12th, 2023



# Question
Apply threat modeling to the smart home architecture below:

![[Pasted image 20230906102412.png]]


---

Follow all the steps in threat modeling (except step 4: validate), identify 5 potential threats, apply STRIDE, and DREAD models, identify the impacted assets, and impacted entry points, and describe the mitigation strategy to handle each threat. Use the following tables as guidelines.




**Threat Identification and Categorization (STRIDE) **

| Threat Description                                                                                                          | Spoofing | Tampering | Repudiation | Information Disclosure | Denial of Service | Elevation of Privileges |
| --------------------------------------------------------------------------------------------------------------------------- | -------- | --------- | ----------- | ---------------------- | ----------------- | ----------------------- |
| Footage from the security camera may be harvested without user authorization.                                               |          |           | X           | X                      |                   |                         |
| Malicious commands may be sent to any of the 'smart' devices that are contained within the home.                            | X        | X         |             |                        |                   |                         |
| Data that is transmitted via the internet may be harvested without user authorization.                                      |          |           |             | X                      |                   |                         |
| A malicious actor may gain access to the information contained within the mobile device used to control the smart hardware. | X        | X         |             |                        |                   |                         |
| Each of the pieces of smart hardware could have commands sent to them that causes them to perform self-destructive actions. | X        | X         |             |                        | X                 |                         |
| Malicious actor may cause the house to ignore the homeowner's commands or remove the owner from trusted devices.            | X        |           |             |                        | X                 | X                       |















**Threat Risk Assessment (DREAD)**


| Threat Description                                                                                                          | Damage | Reproducibility | Exploitability | Affected Users | Discoverability | DREAD Score |
| --------------------------------------------------------------------------------------------------------------------------- | ------ | --------------- | -------------- | -------------- | --------------- | ----------- |
| Footage from the security camera may be harvested without user authorization.                                               |        |                 |                |                |                 |             |
| Malicious commands may be sent to any of the 'smart' devices that are contained within the home.                            |        |                 |                |                |                 |             |
| Data that is transmitted via the internet may be harvested without user authorization.                                      |        |                 |                |                |                 |             |
| A malicious actor may gain access to the information contained within the mobile device used to control the smart hardware. |        |                 |                |                |                 |             |
| Each of the pieces of smart hardware could have commands sent to them that causes them to perform self-destructive actions. |        |                 |                |                |                 |             |
| Malicious actor may cause the house to ignore the homeowner's commands or remove the owner from trusted devices.            |        |                 |                |                |                 |             |


**Impacted Asset Identification**

| Threat Description                                                                                                          | Compute Resource | Physical Safety | Availability Integrity | Data Integrity | Data Availability | Data Privacy |
| --------------------------------------------------------------------------------------------------------------------------- | ---------------- | --------------- | ---------------------- | -------------- | ----------------- | ------------ |
| Footage from the security camera may be harvested without user authorization.                                               |                  |                 |                        |                |                   |              |
| Malicious commands may be sent to any of the 'smart' devices that are contained within the home.                            |                  |                 |                        |                |                   |              |
| Data that is transmitted via the internet may be harvested without user authorization.                                      |                  |                 |                        |                |                   |              |
| A malicious actor may gain access to the information contained within the mobile device used to control the smart hardware. |                  |                 |                        |                |                   |              |
| Each of the pieces of smart hardware could have commands sent to them that causes them to perform self-destructive actions. |                  |                 |                        |                |                   |              |
| Malicious actor may cause the house to ignore the homeowner's commands or remove the owner from trusted devices.            |                  |                 |                        |                |                   |              |

**Impacted Entry Point Assessment**

| Threat Description                                                                                                          | Embedded HW/SW | Communication Channels | Admin Tools | Remote Application Interface | Deployment Infrastructure | Mitigation Strategies |
| --------------------------------------------------------------------------------------------------------------------------- | -------------- | ---------------------- | ----------- | ---------------------------- | ------------------------- | --------------------- |
| Footage from the security camera may be harvested without user authorization.                                               |                |                        |             |                              |                           |                       |
| Malicious commands may be sent to any of the 'smart' devices that are contained within the home.                            |                |                        |             |                              |                           |                       |
| Data that is transmitted via the internet may be harvested without user authorization.                                      |                |                        |             |                              |                           |                       |
| A malicious actor may gain access to the information contained within the mobile device used to control the smart hardware. |                |                        |             |                              |                           |                       |
| Each of the pieces of smart hardware could have commands sent to them that causes them to perform self-destructive actions. |                |                        |             |                              |                           |                       |
| Malicious actor may cause the house to ignore the homeowner's commands or remove the owner from trusted devices.            |                |                        |             |                              |                           |                       |





**Threat Mitigation Analysis**

