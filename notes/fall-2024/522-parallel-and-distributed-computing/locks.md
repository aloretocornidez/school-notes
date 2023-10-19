# Locks

## Problems with Locks

- Error Prone

  - Deadlock is possible, for example, if loacks are acquired in the wrong
    order. This is because locks aren't composable; for example, all modules
    moust adhere to the same convention for multiple locks.

- Overhead in cases where contention is unlikely.
- Vulnerable to failures and faults.

  - e.g., threads holding lock infinite loops
  - threads can die while holding locks.

- Pre-emption while holding lock.

Example of a Deadlock that is not Programmer Induced:

- consider the following case: medium priority thread running, and low priority
  thread owns a lock that a high priority thread is waiting for.

  - This is a priority inversion, even if the lock has a blocking-based
    implementation.

- Lock Convoys
  - if there is heavy contention for a lock, threads may do little work before
    blocking (too much context switching time).

# Load-Linked with Store Conditional

- Used together (but note they are two separate instructions)
  - Load-Linked(LL) returns value at a shared memory lockation
  - Store Conditional (SC) stores new value there if previous value has not changed
    - Returns true if stored, false if not stored




