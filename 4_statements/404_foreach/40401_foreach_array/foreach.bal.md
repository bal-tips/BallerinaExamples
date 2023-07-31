---
title: "foreach.bal - Code Walkthrough"
---

# foreach.bal - Code Walkthrough!

## Line 1: Importing the I/O Module{id="line-1"}

**Source Code**
```ballerina {linenos=table,linenostart=1}
import ballerina/io;
```

**Explanation**
As with the previous example, we're importing the `io` module from the `ballerina` organization to enable console interactions.

## Lines 3-9: The processIntArray Function and Foreach Loop{id="line-3-9"}

**Source Code**
```ballerina {linenos=table,linenostart=3}
function processIntArray() {
    final int[] numbers = [1, 2, 3, 4, 5];

    foreach int number in numbers {
        io:println(string `Current number: ${number}`);
    }
}
```

**Explanation**
This function showcases the use of a `foreach` loop to iterate over an integer array. 
- Define an integer array `numbers` with values [1, 2, 3, 4, 5].
- Iterate through each element of the array using a `foreach` loop, where `number` is the variable holding the current element.
- Print each number to STDOUT using the `println` function of the `io` module.


## Lines 11-21: The `processJsonArray` Function and Foreach Loop{id="line-11-21"}

**Source Code**
```ballerina {linenos=table,linenostart=11}
function processJsonArray() {
    final json[] people = [
        {name: "John", age: 30},
        {name: "Jane", age: 25},
        {name: "Smith", age: 32}
    ];

    foreach json person in people {
        io:println(string `Current person: ${person.toString()}`);
    }
}
```

**Explanation**
The `processJsonArray` function demonstrates the usage of a `foreach` loop with a JSON array. 
- We define a JSON array `people` containing three JSON objects, each with `name` and `age` attributes.
- Similar to the integer array, we use a `foreach` loop to iterate through each JSON object in the `people` array.
- We then print each JSON object to STDOUT using the `println` function.

Note that the `toString` function is used to convert the JSON object to a string value to use inside the string interpolation.

## Lines 23-30: Main Function and Function Calls{id="line-23-30"}

**Source Code**
```ballerina {linenos=table,linenostart=23}
public function main() {

    io:println("Processing an integer array using a foreach loop");
    processIntArray();

    io:println("\nProcessing a JSON array using a foreach loop");
    processJsonArray();
}
```

**Explanation**

Finally, the `main` function, which is the entry point to the program, does the following:
- Prints out a message that we are about to process an integer array.
- Calls `processIntArray` to loop through the integer array.
- Prints out a message that we are about to process a JSON array.
- Calls `processJsonArray` to loop through the JSON array.
