# CSC 553 | Principles of Compilation

### Class Layout

**Code Generation**

- Generating a Syntax tree of the code
  - Here's how we convert the tree into code
    - Intermediate code
  - We will be given a syntax tree, we will take the syntax tree and convert it
    to assembly code.

**Code Optimization**

- How can we optimize the code?
- Machine and Non-machine dependent optimization
  - Register allocation, cache behaviour, code structure
- Quantify optimizations using mathematics.

**'Just In Time' (JIT) Compilers** GCC compiles first and then executes the
compiled code. JIT compilers analyze the usage of a code section and then
determines whether or not to optimize different code sections.

# Background

### Compilers

A compiler maps source language strings to 'equivalent' target language strings.

- gcc
- f2c
- latex2html
- javac
- ps2pdf

Gecko and Webkit

### Structure of a compiler ("phases")

The phases of a compiler's runtime are as follows:

Source Program

1. Lexical Analysis (Scanning)
2. Syntax Analysis (Parsing)
3. Type Checking
4. Intermediate Code Generation
5. Machine-independent optimization
6. Final Code Generation
7. Machine Dependent Optimization

Target Program

# Symbol Tables

### Information About Names

**Type Checking** Given the code `y = f(u ,v ,w)`

- Is `f` a function?
- No. of arguements ok?
- Argument types ok?

**Code Generation** Given the code `x = y +z` #todo

> Symbol tables keep information of the names (variables/identifiers/function
> names) that are being used. This makes sure that names are treated correctly
> in the program.

Purpose | To hold information about identifiers that get computed at one point
and used later.

Operations: - Create, delete a symbol table; - Insert, lookup an identifier

Typical Implementations: Linked list, hash table.

A symbol table keeps track of information about names in the program.

There are usually different symbol tables for each different scope (global,
local, etc.)

Information includes things like:

- Type
- No. of elements (arrays); No. and types of arguments(functions)

The **symbol table manager** interacts with the:

- Front End
- Intermediate code generator
- Analyzer + Optimizer
- Final Code Generator

Each distinct scope in the program has its own symbol table for names local to
that scope

Symbol table entries are typically created when processing declarations (also
some when generating code)

> What does a symbol table look like?

A symbol table contains information about names: _Filled when processing
declarations_

- Name
- Type info

_Filled in during code generation_

- info related to code generation (e.g. location)

#### Managing Symbol Tables

When looking up a name in a symbol table, we need to find the 'appropriate'
declaration. - The scope rules of the language determine what is 'appropriate' -
Often, we want the _most deeply nested_ declaration for a name.

_Implementation_| for each new scope: push a new symbol on entry; pop on exit
(stack). - Implement symbol stack as a linked list of symbol tables; - Lookup:

Given this code:

```c
int foo, bar, bas;
foo = ...
bar = ...
if (foo > bar)
{
	int foo, bar, bas;
	bar = ...
	bas = ...
	while (bar != bas)
	{
		int foo, bar, bas;
		...
	}
}
```

We can see different symbol tables for each scope: ![[Pasted image
20230824131628.png]]

When a new scope is entered, a new symbol table is generated on the stack
(pushed)

After the scope is exited, each respective symbol table removed from the stack
(popped).

# Intermediate Code Generation

Intermediate code generation occurs after lexical analysis, syntax analysis, and
static checking.

After ICG is completed, final code generation occurs.

**Why Intermediate Code?**

- It simplifies code generation
  - Closer to the target language, it simplifies code generation.
- Machine-independent
  - Simplifies re-targeting of the compiler
  - Allows a variety of optimizations to be implemented in a machine-independent
    way.
- Many compilers use several different intermediate representations (IRs)

**Different Kinds of IRs**

- Graphical IRs | The program structure is represented as a graph (or tree)
  structure
  - Ex. parse trees, syntax trees, DAGs
- Linear IRs | The program is represented as a list of instructions for some
  virtual machine
  - Ex. Three-address code.
- Hybrid IRs: Combines elements of graphical and linear IRs
  - Control glow graphs with 3-address code.

## Syntax Trees

![[Pasted image 20230824133352.png]]

> A syntax tree shows the structure of a program

- Each node represents a computation to be performed

### Structure | Syntax Tree

**Expressions**

- Leaves: identifiers or constants
- Internal nodes are labeled with operators
- The children of a node are its operands

**Statements**

- A node's label indicates what kind of statement it is
- The children correspond to the components of the statement.

#### Example

![[Pasted image 20230824134519.png]]

### Information is Syntax Trees

Information is added to syntax tree nodes as compilation progresses:

- Parsing
  - Node type
  - Children
- Type Checking
  - Value Type
- Code Generation
  - Location where an expression's value is stored
  - Intermediate code generated for the tree rooted at the node

**Exercise**

Given the syntax tree:

![[Pasted image 20230829124412.png]]

What source code expression could have this come from?

`a + (2 * b)`

or

`a + 2 * b)`

## Linear IRs

Source Language programs often use features not available in the target language
code.

EG: `x = (a + b)/(c-b)*2`

asm doesn't support multiple operations in an instruction, so we need to save
intermediate results as they are computed.

`while(x>0){x--;y++;}`

asm doesn't support complex grouping of statements and arbitrarty control flow
so we need a way to decompose complex control flow into something simpler.

A linear IR consists of a sequence of instrucitons that execute in that order.

Instructions contain multiple operation, which (if present) execute in parallel

They often form a starting point for hybrid representations (e.g., control flow
graphs.)

### Linear IRs 1 | Three-Address Code

Instructions of the form `x = y op z`, where x, y, z, are virables, constants,
or "temporaries".

At most, one operator is allowed on the right hand side

- No "built up expressions"
- Instead, expressions are computed using temporaries (compiler-generated
  variables).

The specific set of operators represented, and their level of abstraction, can
vary widley.

**Example:**

Source:

```
if ( x + y*z > x*y + z)
a = 0;
```

Three Address Code:

```
t1 = y*z
t2 = x+t1 // x + y*z
t3 = x*y
t4 = t3+z // x*y + z
if (t2 <= t4) goto L
a = 0
L:
```

#### Example Intermediate Instruction Set

![[Pasted image 20230829125247.png]]

**Example**

Source Code

```
int fact(int n) {
	int p = 1;
	while (n > 0) {
		p *= n;
		n –= 1;
	}
	return p;
}
```

Three Address Code:

```
	enter fact
	p = 1
L0: if n <= 0 goto L1
	tmp0 = p * n
	p = tmp0
	tmp1 = n – 1
	n = tmp1
	goto L0
L1: leave
	return p
```

#### Three Address Code | Representation

Each instruction is represented as a structure called a _quadruple_ (or "quad")

- Contains info about the operation, up to 3 operands.
- For operands | use a bit to indicate whether constant or ST pointer.

e.g.

![[Pasted image 20230829130245.png]]

---

![[Pasted image 20230829130411.png]]

---

![[Pasted image 20230829130430.png]]

### Linear IRs 2 | Stack Machine Code

#postpone


## Hybrid IRs

- Combine Features of graphical and linear IRs.


### Control Flow Graphs

A control flow graph for a function is a directed graph $G = (V,E)$ such that:
- each $v \in V$ is a straight line code sequence ("basic block")
- there is an edge $a \rightarrow b \in E$ iff control can go directly from a to b.



![[Pasted image 20230921124130.png]]


### Basic Blocks

Definition: A basic block $B$ is a sequence of consecutive instructions such that:
- control enters $B$ only at its beginning
- control leaves $B$ only at its end (under normal execution)

This implies that if a basic block is entered, then all instructions in $B$ are executed. 
- For program analysis purposes, we can tread a basic block as a single entity.





### Identifying Basic Blocks

1. Determine the set of __leaders__, i.e., the first instruction of each basic block
	- The entry point of a function is a leader
	- any instruction that is the target of a branch is a leader
	- any instruction following a conditional or unconditional branch is a leader.
2. For each leader, its basic block consists of:
	- the leader itself
	- all subsequent instructions up to, but not including, the next leader.



### Constructing Control Flow Graphs

Algorithm:
1. Identify Basic Blocks 
2. For each block $B$:
	- if $B$ ends in a branch instructions: add an edge to each possible control flow target
	- else add en edge to each contextually basic block (i.e., the block that follows $B$ in terns if instruction order)

Issues:
- handling function calls
	- You can think about function calls as making the function call an exit to a basic block. This means you have to take into consideration the worst case after the execution of the function (that is, we don't know what has been modified).
	- The second option is to not consider a function call an exit to a basic block. This means that you have to keep track of what variables have been modified and how and so on.
- entry and exit blocks
	- We are compiling a function at a time, after the CFG is constructed we do program analysis and generate final code
	- after generation of final code, you'll have an entry node and there are multiple returns. (you want one return/exit block)
	- You can create a return/exit block so that you have one entry node and one exit node in the control flow graphs. 



























# Code Generation | Lecture Slides 04

**Overview**

![[Pasted image 20230829132109.png]]

Processing a function definition:

**Intermediate Code Generation**

- Generate 3-addr code by recursively traversing syntax tree
- Each AST node has a list of 3-addr instructions attached to it
- List of instructions at the root of the tree is the code for the entire
  function.

Much of the work of code generation is done here.

**Storage Allocation**

- Traverse the local symbol table
- Allocate a stack frame slot for each local and temporary
- The info determines how much space to allocate

Traverse the function's local symbol table Allocate storage locations to each ST
entry based on its type

- Allocated as slots in the function's stack frame
- Respect any alignment restrictions imposed by target machine architecture

Formal parameter locations are fixed by argument position.

![[Pasted image 20230829134020.png]]

**Final Code Generation**

- Traverse the list of 3-addr instructions at the root of the function's AST
- Expand each 3-addr instruction into asm code
- Write out the code generated

![[Pasted image 20230829133957.png]]

### Procedure Calls and Returns

**Calling sequences** handle all of the work that needs to be done in order to
make a function happen.

**Return sequences** do all of the work after a function is completed.

- loads the return value where the caller can find it.

### Caller Conventions

A **calling convention** specifies how values are communicated between
procedures.

We can have multiple conventions in MS windows.

### Caller-saved vs. Callee-saved registers

Caller-saved | registers who's values may be overwritten by a function call.
Callee-saved | registers who's values will survive accross a function call.

### Code Executed for a function call

---

![[Pasted image 20230905124347.png]]

![[Pasted image 20230905124454.png]]

**Code Generated for Function Definitions** ![[Pasted image 20230905125047.png]]

![[Pasted image 20230905125104.png]]

### Left-hand-side and right-hand-side statements

**l-values and r-values** #todo

### Type Conversion

- Values of different types may be represented differently a the machine level.
- When the code to be compiled operates on values of different types, the
  compiler may have to insert code to convert from one representation to
  another.
  - _Implicit type conversion_ | type conversion done by the compiler without
    explicit user input
  - _Explicit type conversion_ | user-directed type casting

**Implicit Type Conversion Examples**

Assignments: `var = exp`

- `var` has a different type than `exp`
- The compiler adds code to convert the value of `exp` to the type of `var`
  before the assignment.

Arithmetic Expressions | `exp1 + exp2`

- `exp1` has a different type than `exp2`
- The type conversion is language specified:
  - usually, the smaller type is converted to the larger, e.g., char to int

Array Indexing | `A[exp]`

- exp is not an int (e.g., a char)
- the compiler adds code to convert `exp` to an int value

Parameter Passing | `f(exp)`

- `exp` is not the right type for c=parameter passing (e.g., a char)
- The compiler adds code to convert the `exp` appropriately

### Code Generation for Expressions

**Expressions 1 | Scalar Variables** Source code: `id` Code structure: (no code
needed)

![[Pasted image 20230907125705.png]]

**Expressions 2 | Integer Constants** Source Code: `intcon` Code Structure:
`tmp = intcon.value`

![[Pasted image 20230907125802.png]]

**Example**

![[Pasted image 20230907130203.png]]

**Example 3 | Struct Fields**

Source code: A.field_k Generated code needs to:

- Compute the address of A.field_k
- Access addr(A.field_k)

![[Pasted image 20230907130931.png]]

If something is an R-value, you need to generate code to de-reference an
address, then you need to put that value somewhere.

### Code Generation for Arithmetic Operations

**Arithmetic Expressions 1 | Unary Ops**

Source Code: -E Code Structure: `some_loc = ...value of E...` `tmp = -some_loc`

![[Pasted image 20230907132203.png]]

**Arithmetic Expressions 2 | Binary Ops**

Source Code: `e1 + e2` Code structure:

- `loc1 = ...value of e1...`
- `loc2 = ...value of e2...`
- `tmp = loc1 + loc2`

![[Pasted image 20230907132628.png]]

![[Pasted image 20230907132643.png]]

**Exercise**

![[Pasted image 20230907132833.png]] Consider the statement

```
avg = (max + min) / 2
```

![[Pasted image 20230907134422.png]]

![[Pasted image 20230907134437.png]]

**Exercise**

Source code: `u = * - y`

Work out the 3-addr code at each node.

`tmp0 = y mul -1` `tmp1 = x mul tmp0` `u = tmp1`

### Reusing Temporaries

Storage can be reduced considerably by reusing temporaries:

- For each type T, keep a "free list" of temporaries of type T;
- `newtemp(T)` uses a temp from the free list for type T whenever possible.

Putting Temps in the free list:

- free only compiler-generated temps, not user variables.
- free a temp after the point of its last use (i.e. when its value is no longer
  needed.)

### Code Generation for Logical Operators

**Logical Expressions**

A naive but simple approach is by assigning an actual truth value:

![[Pasted image 20230912125758.png]]

_**Disadvantage:**_ lots of unnecessary memory references.

_Observation:_ logical expressions are usually used to direct flow of control.

![[Pasted image 20230912130021.png]]

Is it possible to generate code to direct control flow without evaluating an
explicit truth calculation?

_Idea_: "Tell" the code generator where the generated code should jump:

- _trueDst_: label to jump to if expression is True
- _falseDst_: label to jump to if expression is False

# Lecture September 14th | More Code Generation

### Loops

Code Structure:

**Loops**

```
L_top : code to evaluate B
    if (!B) go to L_after
L_body: code for S_1
    goto L_top
L_after: ...
```

```
codeGen_stmt(S)
{
    L_top = newlabel();
    L_body = newlabel();
    L_after = newlabel();

    codeGen_bool(B, L_body, L_after);
    codeGen_stmt(S);

    S.code = L_top ...
}
```

**Loops 2**

```
goto L_eval

L_top : code for S_1
L_body: code to evaluate B
    if (B) goto L_top
L_after: ...
```

### Exercise

Ternary expressions: `E === E_1 ? E_2 E_3`

### Multi-Way Branches (Switch Statements)

Goal: generate code that has a fixed set of alternatives based on the value of
an expression.

**Implementation Choices**

**Linear Search**
- best for a small number of case labels
- cost increases with the number of case labels; later cases are more expensive

**Binary Search**
- Best for a moderate number of case labels.
- Cost increases with no-of case labels.

**Jump tables**
- Best for a large number of case labels (>8).
- May take a large amount of space if the labels are not clustered.





### Jump Tables

**What is a jump table?**
A jump table is basically an array of addresses.

If the set of case labels has "holes", then those holes didn't have an explicit case label and should jump to the default case.

**Bounds Checking**

- Before indexing into a jump table, we must check that the expression value is within the proper bounds (if not, jump to the default case).
- The check:
	- `lower_bound <= exp_value <= upper_bound`
	- can be implemented using 1 unsigned comparison.


Given a switch with max and min case labels $c_max$ and $c_min$, the jump table is is accessed as follows: 

![[Pasted image 20230919124853.png]]

**Cycle Costs**

Now, let's talk about the cost of the amount of cycles for a case statement.

![[Pasted image 20230919124933.png]]


The point at the end of the day, is that is is expensive to go through a jump table. So switch statements can be expensive (if they use jump tables).

**Space Costs**

What about the space costs?

A jump table with max and min case labels needs to be about $c_{max}- c_{min}$ entries.

What if the density of the cases is not dense enough?

```c
switch (x) {
	case 1: …
	case 1000: …
	case 1000000: …
}
```

Define the density as:

$$\frac{\text{No. of case labels}}{c_{max}-c_{min}}$$

Compilers will not generate a jump table if density below some threshold (typically, 0.5)

### Switch statements: Overall Algorithm

If the number of case labels is small ~$(\le 8)$:

- use linear or binary search.


If the density >= the theshold, (~0.5):

- then generate the jump table.

Else:
- divide the set of case labels into sub ranges, where each sub range has density >= threshold.
- Generate code to use binary search to choose amongst the sub-ranges.
- handle each sub range recursively.





Next Unit: [[program-analysis]]




