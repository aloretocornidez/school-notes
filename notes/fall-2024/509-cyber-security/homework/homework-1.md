# ECE 509 | Homework 1

Name: Alan Manuel Loreto Cornídez
Date Due: September 12th, 2023



# Question
Apply threat modeling to the smart home architecture below:

![[Pasted image 20230906102412.png]]


---

Follow all the steps in threat modeling (except step 4: validate), identify 5 potential threats, apply STRIDE, and DREAD models, identify the impacted assets, and impacted entry points, and describe the mitigation strategy to handle each threat. Use the following tables as guidelines.




## Threat Identification and Categorization (STRIDE)

**Threat 1** | Footage from the security camera may be harvested without user authorization.
**Threat 2** | Malicious commands may be sent to any of the 'smart' devices that are contained within the home by posing as the home owner.
**Threat 3** | Data that is transmitted via the internet may be harvested without user authorization.
**Threat 4** | A malicious actor may gain access to the information contained within the mobile device used to control the smart hardware.
**Threat 5** | Each of the pieces of smart hardware could have commands sent to them that causes them to perform self-destructive actions.
**Threat 6** | Malicious actor may cause the house to ignore the homeowner's commands or remove the owner from trusted devices.

| Threat Description | Spoofing | Tampering | Repudiation | Information Disclosure | Denial of Service | Elevation of Privileges |
| ------------------ | -------- | --------- | ----------- | ---------------------- | ----------------- | ----------------------- |
| Threat 1           |          |           | X           | X                      |                   |                         |
| Threat 2           | X        | X         |             |                        |                   |                         |
| Threat 3           |          |           |             | X                      |                   |                         |
| Threat 4           | X        | X         |             |                        |                   |                         |
| Threat 5           | X        | X         |             |                        | X                 |                         |
| Threat 6           | X        |           |             |                        | X                 | X                       |


## Threat Risk Assessment (DREAD)
- **D**amage – how bad would an attack be?
- **R**eproducibility – how easy is it to reproduce the attack?
- **E**xploitability – how much work is it to launch the attack?
- **A**ffected users – how many people will be impacted?
- **D**iscoverability – how easy is it to discover the threat?

*Note*: Using a scale from 0-5 (0: Not severe, 5: Extremely Severe)

**Threat 1**
- Damage | 5
- Reproducability | 3
- Exploitability | 3
- Affected Users | 1
- Discoverability | 3
- DREAD Score | 15

**Threat 2**
- Damage | 2
- Reproducability | 3
- Exploitability | 4
- Affected Users | 3
- Discoverability | 3
- DREAD Score | 16

**Threat 3**
- Damage | 3
- Reproducability | 3
- Exploitability | 4
- Affected Users | 3
- Discoverability | 5
- DREAD Score | 19

**Threat 4**
- Damage | 3
- Reproducability | 2
- Exploitability | 3
- Affected Users | 1
- Discoverability | 3
- DREAD Score | 12

**Threat 5**
- Damage | 5
- Reproducability | 4
- Exploitability | 3
- Affected Users | 3
- Discoverability | 3
- DREAD Score | 18

**Threat 6**
- Damage | 2
- Reproducability | 3
- Exploitability | 3
- Affected Users | 3
- Discoverability | 3
- DREAD Score | 14

Reasoning for my dread scores:
- Damage was evaluated on how much the user, is affected. This could include financially, or personally (such as private video being leaked). 
- Reproduciblity was difficult to evaluate considering that there is no knowledge of how the system architecture is build (from a software point of view). However, assuming that the system has no security measures in place on the software side, then attacks may easily be executed be a malicious actor.
- Exploitability was given an average of 3 for each of the threats because without knowledge of whether trust must be established, or if data transfer is encrypted, it cannot be determined how reproducible attacks are on a system.
- Affected users was straightforward to assess, if the attack itself only affects few or one user, then the number off users affects is low, however, if the attack is executed successfully and it affects multiple users when the attack executes, then the number of affected users is higher. 
- Discoverability was also given an average score of three, this is because again, without knowing how the system architecture is laid out, it cannot be determined whether or not a threat is discover-able. We cannot know whether the attacker has any knowledge of the system either. For example, if an old engineer has knowledge of the system and its weaknesses, then the discoverability may be higher for that attacker. However, we cannot assume the incompetency of the attacker either and must believe that as the attacker will gain familiarity/intimacy with the system.

## Impacted Asset Identification
Filling the matrix table below for how each threat affects each category.

**Threat 1**    
- Compute Resource
	- Gaining access to the footage affects the system differently depending on the attack vector that is executed. If the attacker gains access though footage that is passed on the cloud, then the company servers may be slowed down because of failed packet sending.
- Physical Safety 
	- Physical safety is not affected heavily if only the footage is harvested.
- Data Availability
	- If the data is harvested from the camera (and footage is sent across the cloud), then the availability of this data may not be sent to the host server if the attacker changes the course of the video feet, however, if the attacker only copies the footage and then sends it to the original destination (likely to help avoid detection) then availability will still not be a problem, however, the system designer cannot count on that happening. 
- Data Integrity
	- An attacker with access to the footage may change metadata of the videos. If this happens, a false record of the security footage could be forged.
- Data Privacy
	- Privacy is heavily affected if this attack is successfully executed. If the attacker gains access to the footage, then there is no way to tell what can happen to the footage. It could be publicly posted or sold online, someone may be stalked, or any other malicious act that the attacker can formulate.


**Threat 2**
- Compute Resource
	- The effect on compute resources depends on how the system is programmed to send commands. Assuming a local network is used to achieve this, then the corporation's compute resources will be fine, however, this will not be the case for the network that the smart home uses to communicate. (In many cases, the homeowner's network.) 
- Physical Safety 
	-  The physical safety of the user depends on what sort of smart hardware is present within the home. Controlling lights may give the attacker the ability to damage someone with epilepsy. 
- Data Availability
	- If the attacker uses methods to avoid detection, then availability for data regarding state of the smart home may not be present. This can cause debugging and logging issues.
- Data Integrity
	- In the same way as with data availability, assuming the attacker uses strategies to avoid detection, then the integrity of the data cannot be trusted either. 
- Data Privacy
	- The privacy of the user is also heavily affected in a similar way to the first threat.

**Threat 3**
- Compute Resource
	- Depending on the attack vector taken by the attacker, compute resource usage will or will not be affected. Harvesting data will not affect the compute resources of the corporation much, it also won't affect the network too much when compared to the other attacks that are executed.
- Physical Safety 
	- There is no one in direct physical harm because of this threat.
- Data Availability
	- Availability of the data depends on how the attacker chooses to harvest the data. If the attacker wants to add an attempt at avoiding detection, then the data would be properly routed to the original destination and data availability would not be severely affected.
- Data Integrity
	- Similar to before, if the attacker wishes to avoid detection, then the integrity of the data should not be affected.
- Data Privacy
	- This threat is a severe breach of privacy.

**Threat 4**
- Compute Resource
	- If the attacker gains access to the mobile device used to control the home, the computing resources of the phone could be heavily affected assuming the attacker wants to spam commands to the home and cause a denial of service (DoS). 
- Physical Safety 
	- The user should not have physical safety affected so long as the hardware contained within the home cannot cause physical harm.
- Data Availability
	- If the user cannot access their data from their mobile device, then the data availability is severely affected. However, if the phone is able to manipulate the deletion of stored footage (for example) then the data may not be available and this then becomes a sever concern.
- Data Integrity
	- The data integrity should not be affected as long as the homeowner's device cannot change the stored data (for example, cameras).
- Data Privacy
	- If the attacker can gain access the the data within the device in addition to the ability to execute commands, then the data privacy breach concern is a severe concern.

**Threat 5**
- Compute Resource
	- Assuming the attacker now has access to sending arbitrary commands, the same sort of thought process follows as threat 4 when thinking about the affected compute resources.
- Physical Safety 
	- If there are smart hardware resources present that can cause someone physical harm, such as a garage door, then the safety of the smart home is compromised.
- Data Availability
	- Availability of the data would theoretically not be affected if commands are being sent, this is assuming that a DoS attack is not attempted (via command spamming)
- Data Integrity
	- The data integrity should not be affected so long as the attacker does not change the data held within the devices.
- Data Privacy
	- The privacy of the data my be compromised if the attacker has access to send commands arbitrary commands. The attacker may cause the system to send data from the hardware to an unauthorized destination.

**Threat 6**
- Compute Resource
	- Depending on how the attacker chooses to cause DoS to the user, the compute resources of the business may or may not be affected. 
- Physical Safety 
	- Assuming that the attacker cannot send arbitrary commands to the hardware as well, the physical safety of the user is not compromised, however if the attacker also has access to controlling the smart hardware and the user does not, it can be quite dangerous if there is hardware present that is capable of causing harm to the user.
- Data Availability
	- If the user has lost access to the devices, then all data availability is gone.
- Data Integrity
	- The data present in the home may still be valid, so data integrity is not compromised.
- Data Privacy
	- While the user may have been logged out of the system, the data has still not been compromised, so data privacy is still intact (assuming that the company having access to the data has not violated privacy concerns.)





## **Impacted Entry Point Assessment**

| Threat Description | Embedded HW/SW | Communication Channels | Admin Tools | Remote Application Interface | Deployment Infrastructure |
| ------------------ | -------------- | ---------------------- | ----------- | ---------------------------- | ------------------------- |
| Threat 1           |                | X                      |             | X                            | X                         |
| Threat 2           | X              | X                      | X           | X                            | X                         |
| Threat 3           |                | X                      |             | X                            | X                         |
| Threat 4           |                | X                      | X           | X                            | X                         |
| Threat 5           | X              | X                      | X           | X                            | X                         |
| Threat 6           |                | X                      | X           |                              |                           |


**Threat Mitigation Analysis**

- Threat 1
	- The first line of defense for this threat is communication channel encryption. This makes it so that even if the data is harvested, it is still difficult to have access to the actual footage. Doing behavioral analysis on the packet travel to detect when packets are being tampered with is also a viable option to make sure that there is no unauthorized access to the packets when the footage is being sent over the cloud.
- Threat 2
	- Creating process to verify that commands are coming only from trusted sources would be a valid mitigation strategy. This could be done with a signature file that is stored on the device and a key that is sent via the network whenever a device wants to send a command. This would also introduce features that take advantage of control permissions between users.
- Threat 3
	- The biggest form of restricting open access to the data that is transmitted over networks is by encrypting the data before sending it on the network. For additional security, encrypt the data when it is stored on servers as well. If user privacy is a concern, make sure that that there is no 'back door' to access user data either.
- Threat 4
	- By including the 'trust verification' process discussed in threat 2 you can also mitigate the current threat as well.
- Threat 5
	- By including hardware limitations within the smart devices, it is possible to highly mitigate the chances of executing commands that are damaging to the device itself. For example, including sensors that turn off a blender if it gets too hot
- Threat 6
	- If the user cannot send commands to the devices this is definitely a problem. The first line of defense for this problem would be to include a way to set the smart home parameters via hardware. That is, a physical switch, that overrides all software  locks that could be present. The next best step would be prevention of a lockout. This would mean looking into the software and seeing examining what could be done to stop execution of commands on the smart hardware.
