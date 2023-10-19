# Monitors



## Object-Oriented Monitors

annotation `synchronized` can be applied to a member function

### Traditional vs Object Object-Oriented Implementations
- Traditional
    - all functions synchronized 
    - no public data 
    - separate construct (simpler to implement, i.e. no inheritance)
    - safer (can statustucally guarentee no race conditions, because there is no public data) 
    - less flexible
- Object-Oriented 
    - can mix and match 
    - public data allowed 
    - intecgreated with class (interaction with rest of language)
    - riskier (can circumbent the monitor idea by using and modifying public data) 
    - more flexible



# Recursive Calls
If you use a monitor to execute naive recursion, a function that is blocked will cause deadlock if the same function is recursively called.

The same happens if you use `foo.hepler()` when `foo` is a monitor. 









