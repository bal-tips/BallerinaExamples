---
title: "main.bal - Hello, World"
---

# main.bal - Hello, World in Ballerina!

Welcome to the Ballerina "Hello, World" program walkthrough!

## Line 1: Importing the I/O Module{id="line-1"}

**Source Code**
```ballerina
import ballerina/io;
```

**Explanation**
Here, we declare the import of the `io` module from the `ballerina` organization. 
- This import allows us to use the `io` module in our code.
- The identifier `io` acts as a prefix, allowing us to reference this module later in the source file.
- The `io` module is essential here, as we'll be using it to print a line to the standard output (STDOUT).

## Line 2: Formatting the Code{id="line-2"}

**Source Code**
Empty line

**Explanation**
This empty line is intentionally added for readability and better formatting. Proper formatting makes our code easy to read and understand.

## Lines 3 & 5: Defining the Main Function{id="line-3-5"}

**Source Code**
```ballerina {linenos=table,linenostart=3}
public function main() {
    // ...
}
```

**Explanation**
These lines define the `main` function, which serves as the entry point to the program. 
- We begin with the keyword `function`, followed by the function's name - in this case, `main`.
- The `main` function is required to be public, indicated by the `public` keyword, since it's invoked from outside its module scope (the program runner in this case).
- The function's scope is delineated by open `{` and close `}` braces.

## Line 4: Printing "Hello, World!"{id="line-4"}

**Source Code**
```ballerina {linenos=table,linenostart=4}
    io:println("Hello, World...!");
```

**Explanation**
In this line, we're calling the `println` function from the `io` module (recall the [prefix](#line-1) we discussed earlier). 
- The function is invoked using its fully qualified name, with the module prefix `io` followed by `:` and then the function name.
- The argument `"Hello, World...!"` is the string we want to print out to STDOUT.
