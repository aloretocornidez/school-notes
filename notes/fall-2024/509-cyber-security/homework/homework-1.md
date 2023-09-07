# ECE 509 | Homework 1

Name: Alan Manuel Loreto Cornídez
Date Due: September 12th, 2023



# Question
Apply threat modeling to the smart home architecture below:

![[Pasted image 20230906102412.png]]


---

Follow all the steps in threat modeling (except step 4: validate), identify 5 potential threats, apply STRIDE, and DREAD models, identify the impacted assets, and impacted entry points, and describe the mitigation strategy to handle each threat. Use the following tables as guidelines.




## **Threat Identification and Categorization (STRIDE) **

Threat 1| Footage from the security camera may be harvested without user authorization.
Threat 2 | Malicious commands may be sent to any of the 'smart' devices that are contained within the home by posing as the home owner.
Threat 3 | Data that is transmitted via the internet may be harvested without user authorization.
Threat 4 | A malicious actor may gain access to the information contained within the mobile device used to control the smart hardware.
Threat 5 | Each of the pieces of smart hardware could have commands sent to them that causes them to perform self-destructive actions.
Threat 6 | Malicious actor may cause the house to ignore the homeowner's commands or remove the owner from trusted devices.

| Threat Description | Spoofing | Tampering | Repudiation | Information Disclosure | Denial of Service | Elevation of Privileges |
| ------------------ | -------- | --------- | ----------- | ---------------------- | ----------------- | ----------------------- |
| Threat 1           |          |           | X           | X                      |                   |                         |
| Threat 2           | X        | X         |             |                        |                   |                         |
| Threat 3           |          |           |             | X                      |                   |                         |
| Threat 4           | X        | X         |             |                        |                   |                         |
| Threat 5           | X        | X         |             |                        | X                 |                         |
| Threat 6           | X        |           |             |                        | X                 | X                       |


## **Threat Risk Assessment (DREAD)**
- **D**amage – how bad would an attack be?
- **R**eproducibility – how easy is it to reproduce the attack?
- **E**xploitability – how much work is it to launch the attack?
- **A**ffected users – how many people will be impacted?
- **D**iscoverability – how easy is it to discover the threat?

*Note*: Using a scale from 0-5 (0: Not severe, 5: Extremely Severe)

| Threat Description | Damage | Reproducibility | Exploitability | Affected Users | Discoverability | DREAD Score |
| ------------------ | ------ | --------------- | -------------- | -------------- | --------------- | ----------- |
| Threat 1           | 5      | 3               | 3              | 1              | 3               | 15          |
| Threat 2           | 3      | 4               | 3              | 3              | 3               | 16          |
| Threat 3           | 3      | 5               | 3              | 5              | 3               | 19          |
| Threat 4           | 3      | 2               | 3              | 1              | 3               | 12          |
| Threat 5           | 5      | 4               | 3              | 3              | 3               | 18          |
| Threat 6           | 2      | 3               | 3              | 3              | 3               | 14          |

Reasoning for my dread scores:
- Damage was evaluated on how much the user, is affected. This could include financially, or personally (such as private video being leaked). 
- Reproduciblity was difficult to evaluate considering that there is no knowledge of how the system architecture is build (from a software point of view). However, assuming that the system has no security measures in place on the software side, then attacks may easily be executed be a malicious actor.
- Exploitability was given an average of 3 for each of the threats because without knowledge of whether trust must be established, or if data transfer is encrypted, it cannot be determined how reproducible attacks are on a system.
- Affected users was straightforward to assess, if the attack itself only affects few or one user, then the number off users affects is low, however, if the attack is executed successfully and it affects multiple users when the attack executes, then the number of affected users is higher. 
- Discoverability was also given an average score of three, this is because again, without knowing how the system architecture is laid out, it cannot be determined whether or not a threat is discover-able. We cannot know whether the attacker has any knowledge of the system either. For example, if an old engineer has knowledge of the system and its weaknesses, then the discoverability may be higher for that attacker. However, we cannot assume the incompetency of the attacker either and must believe that as the attacker will gain familiarity/intimacy with the system.

## **Impacted Asset Identification**
Filling the matrix table below for how each threat affects each category.

| Threat Description | Compute Resource                                                                                                                                                                                                                                                     | Physical Safety                                                           | Data Availability                                                                                                                                                                                                                                                                                                                                                                                                                                         | Data Integrity                                                                                                                                     | Data Privacy                                                                                                                                                                                                                                                                                                        |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Threat 1           | Gaining access to the footage affects the system differently depending on the attack vector that is executed. If the attacker gains access though footage that is passed on the cloud, then the company servers may be slowed down because of failed packet sending. | Physical safety is not affected heavily if only the footage is harvested. | If the data is harvested from the camera (and footage is sent accross the cloud), then the availability of this data may not be sent to the host server if the attacker changes the course of the video feet, however, if the attacker only copies the footage and then sends it to the original destination (likely to help avoid detection) then availability will still not be a problem, however, the system designer cannot count on that happening. | An attacker with access to the footage may change metadata of the videos. If this happens, a false record of the security footage could be forged. | Privacy is heavily affected when if this attack is successfully executed. If the attacker gains access to the footage, then there is no way to tell what can happen to the footage. It coul dbe publicly posted or sold online, someone may be stalked, or any other malicious act that the attacker can formulate. |
| Threat 2           | The effect on compute resources depends on how the system is programmed to send commands. Assuming a local network is used to achieve this, then the corporation's compute resources will be fine, however, this will not be the case for the network that the smart home uses to communicate. (In many cases, the homeowner's network.)                                                                                                                                                                                                                                                                      |                                                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                     |
| Threat 3           |                                                                                                                                                                                                                                                                      |                                                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                     |
| Threat 4           |                                                                                                                                                                                                                                                                      |                                                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                     |
| Threat 5           |                                                                                                                                                                                                                                                                      |                                                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                     |
| Threat 6           |                                                                                                                                                                                                                                                                      |                                                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                     |



























## **Impacted Entry Point Assessment**

| Threat Description | Embedded HW/SW | Communication Channels | Admin Tools | Remote Application Interface | Deployment Infrastructure | Mitigation Strategies |
| ------------------ | -------------- | ---------------------- | ----------- | ---------------------------- | ------------------------- | --------------------- |
| Threat 1           |                |                        |             |                              |                           |                       |
| Threat 2           |                |                        |             |                              |                           |                       |
| Threat 3           |                |                        |             |                              |                           |                       |
| Threat 4           |                |                        |             |                              |                           |                       |
| Threat 5           |                |                        |             |                              |                           |                       |
| Threat 6           |                |                        |             |                              |                           |                       |





**Threat Mitigation Analysis**

