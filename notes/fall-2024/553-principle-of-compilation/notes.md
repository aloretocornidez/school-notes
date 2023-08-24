# CSC 553 | Principles of Compilation

### Class Layout
**Code Generation**
- Generating a Syntax tree of the code
	- Here's how we convert the tree into code
		- Intermediate code
	- We will be given a syntax tree, we will take the syntax tree and convert it to assembly code.

**Code Optimization**
- How can we optimize the code?
- Machine and Non-machine dependent optimization
	- Register allocation, cache behaviour, code structure
- Quantify optimizations using mathematics.


**'Just In Time' (JIT) Compilers**
GCC compiles first and then executes the compiled code.
JIT compilers analyze the usage of a code section and then determines whether or not to optimize different code sections.





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
**Type Checking**
Given the code `y = f(u ,v ,w)`
- Is `f` a function?
- No. of arguements ok?
- Argument types ok?

**Code Generation**
Given the code `x = y +z` #todo



> Symbol tables keep information of the names (variables/identifiers/function names) that are being used. This makes sure that names are treated correctly in the program.

Purpose: To hold information about identifiers that get computed at one point and used later.

Operations:
	- Create, delete a symbol table;
	- Insert, lookup an identifier

Typical Implementations: Linked list, hash table.



A symbol table keeps track of information about names in the program.

There are usually different symbol tables for each different scope (global, local, etc.)

Information includes things like:
- Type
- No. of elements (arrays); No. and types of arguments(functions)

The **symbol table manager** interacts with the:
- Front End
- Intermediate code generator
- Analyzer + Optimizer
- Final Code Generator

Each distinct scope in the program has its own symbol table for names local to that scope

Symbol table entries are typically created when processing declarations (also some when generating code)

> What does a symbol table look like?

A symbol table contains information about names: 
*Filled when processing declarations*
- Name
- Type info

*Filled in during code generation*
- info related to code generation (e.g. location)


#### Managing Symbol Tables
When looking up a name in a symbol table, we need to find the 'appropriate' declaration.
	- The scope rules of the language determine what is 'appropriate'
	- Often, we want the *most deeply nested* declaration for a name.

*Implementation*: for each new scope: push a new symbol on entry; pop on exit (stack).
	- Implement symbol stack as a linked list of symbol tables;
	- Lookup: 

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

We can see different symbol tables for each scope:
![[Pasted image 20230824131628.png]]

When a new scope is entered, a new symbol table is generated on the stack (pushed)

After the scope is exited, each respective symbol table removed from the stack (popped).




# Intermediate Code Generation

Intermediate code generation occurs after lexical analysis, syntax analysis, and static checking. 

After ICG is completed, final code generation occurs.


### Why Intermediate Code?

- It simplifies code generation
	- Closer to the target language, it simplifies code generation.
- Machine-independent
	- Simplifies re-targeting of the compiler
	- Allows a variety of optimizations to be implemented in a machine-independent way.
- Many compilers use several different intermediate representations (IRs)


**Different Kinds of IRs**
- Graphical IRs: The program structure is represented as a graph (or tree) structure
	- Ex. parse trees, syntax trees, DAGs
- Linear IRs: The program is represented as a list of instructions for some virtual machine
	- Ex. Three-address code.
- Hybrid IRs: Combines elements of graphical and linear IRs
	- Control glow graphs with 3-address code.








### Graphical IRs | Syntax Trees

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














































