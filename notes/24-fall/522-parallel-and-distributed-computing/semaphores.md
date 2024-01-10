# Semaphores

## Bounded Buffers

(1 producer, 1 consumer)

```c
char buf[n], int front:= 0, rear := 0
sem empty := n, full := 0
```

```c
Producer()
    do forever...
    produce message m
    P(empty)
    buf[rear] := m;
    rear := rear "+" 1
    V(full)
```

```c
Consumer()
    do forever...
    P(full)
    m := buf[front]
    front := front "+" 1
    V(empty)
    consume(m)
```

- Don't let a consumer consume from an empty buffer.
- Don't let a producer produce into a full buffer.

It is possible to extend this into multiple producers and consumers.

In the single producer and single consumer, you can just let them conduct their
operations, however when there are multiple producers and/or consumers

To implement multple C/P, you need two semaphores, one for the producer and
another for the consumer.

You can have different amounts of producers and/or consumers. We are limited by
the buffer.

### Blocking vs Deadlock

Deadlock | All threads are blocked and none/one is unable to proceed. Blocking |
Not allowing another thread to proceed until a set of conditions is met.

```c
Producer()
    do forever...
    produce message m
    P(empty); P(mutexP)
    buf[rear] := m;
    rear := rear "+" 1
    V(mutexP); V(full)

Consumer()
    do forever...
    P(full); P(mutexC);
    m := buf[front]
    front := front "+" 1;
    V(mutexC); V(empty);
    consume(m)
```

## Readers/Writer

- Given a Databasse
  - Can have multiple "readers" at a time.
    - don't ever modify the database.
  - Can only have one "writer" at a time.
    - will modify the database
    - readers not allowed in while writer is.

This problem has many variations.

### Idea of Readers/Writers Solution

All readers and writers need to call entry and exit routines, so we use a mutex
semaphore initialized to one.

`mutex` is just the name of the variable of the semaphore to let us manage
mutual exclusion, there is no such thing as a 'mutex semaphore'

Keep a state of database, enforece ocnstirains. One semaphore blocks, the other

```c
int nr := 0, nw := 0, dr := 0, dw := 0
sem mutex := 1, r := 0, w := 0
readEnter() {
    P(mutex); // need mutual exclusion
    if (nw > 0) { // writer is in, better block
        dr++; // increment number of delayed readers
        V(mutex); // release mutual exclusion
        P(r); // block on read semaphore
    }

    nr++; // going to go in, record this

    if (dr > 0) { // other delayed readers, let them in
        dr−−; // one fewer delayed reader
        V(r); // actually let reader in
    }
    else {
        V(mutex); // no readers waiting, release mutex
    }
}

readExit() {
    P(mutex); // need mutual exclusion
    nr−−; // one reader is out

    if (nr == 0 and dw > 0) { // last reader and writer waiting, so let it in
        dw−−; // one fewer delayed writer
        V(w); // actually let writer in
    }

    else V(mutex); // release mutual exclusion

}

writeEnter() {
    P(mutex); // need mutual exclusion
    if (nr > 0 or nw > 0) { // someone else is in, better block
        dw++; // increment number of delayed writers
        V(mutex); // release mutual exclusion
        P(w); // block on write semaphore
    }

    nw++; // going to go in, record this
    V(mutex); // release mutual exclusion
}

writeExit() {
    P(mutex); // need mutual exclusion

    nw−−; // one fewer writer in

    if (dr > 0) // reader waiting, let it in
        dr−−; V(r); // decrement and let in reader

    else if (dw > 0) // writer waiting, let it in
        dw−−; V(w); // decrement and let writer in

    else V(mutex); // release mutual exclusion

}
```





























