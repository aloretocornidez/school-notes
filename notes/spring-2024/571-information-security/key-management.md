# Key Management

Distribution of keys is a very difficult problem because you cannot anticipate
lost keys, who wants to communicate, compromised keys, users leaving, revoking
keys. etc. These problems all pertain to key management.

Some solutions rely on a trusted authority pre distributing keys through a
secure channel. That allows every pair of users determine a shared key
(non-interactively).

Session key distribution focuses on key management for short sessions.

## Long vs Short Lived Keys

Long lived keys are stored more securely than short lived keys.

## Key Predistribution

Given N users, how many pairwise keys do we need?

When N=4, we can generate a complete graph, (that is, all nodes connected), In
this case, there are 6 links from for each node.

$$\frac{N(N-1)}{2}$$

This scales to $N^{2}$, which is a significant cost. Too high for our liking.

### Trusted Key Distribution Center (KDC)

In this case, all users share a key with a centralized authority (in this case,
the KDC), and when you want to establish communication with another user, you
can then generate a secret key with the other user through the already trusted
key source.


In this case, with N users, you need N long term keys, which is much less than $O(N^{2})$


