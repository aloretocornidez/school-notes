# Data Flow Analysis

## Reaching Definitions

Which instructions could have assigned `x` and `y` at this point?

The most recent possible assignments are the assignments that reach the current
variable.

- A definition of a variable `x` is an instruction that (may) assign a value to
  it
  - unambiguous definitiosn: definiteyl assign to `x`.
  - ambiguous definitions: may (or may not) assign to `x` e.g., indirect stores,
    function calls.
- A definition of `x` is killed along path `pi` if `x` is (definitely) redefined
  somewhere along `pi`.
- A definition `d` reaches a point `p` if there is some apth `pi` from `d` to
  `p` such taht `d` is not killed along `pi`.



























