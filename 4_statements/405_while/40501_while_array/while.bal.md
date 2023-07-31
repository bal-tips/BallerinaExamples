---
title: "while.bal - Code Walkthrough"
---

# while-loop.bal - Code Walkthrough!

## Line 1: Importing the I/O Module{id="line-1"}

**Source Code**
```ballerina {linenos=table,linenostart=1}
import ballerina/io;
```

**Explanation**
As with the previous examples, we are importing the `io` module from the `ballerina` organization, which enables interactions with the console.

## Line 3: Declaring `processIntArray` Function{id="line-3"}

**Source Code**
```ballerina
function processIntArray() {
```

## Lines 3-13: The `processIntArray` Function and While Loop{id="line-3-13"}

**Source Code**
```ballerina {linenos=table,linenostart=3}
function processIntArray() {

    final int[] numbers = [1, 2, 3, 4, 5];

    int currentIndex = 0;
    while currentIndex < numbers.length() {
        int currentNumber = numbers[currentIndex];
        io:println(string `Current number: ${currentNumber}`);
        currentIndex += 1;
    }
}
```

**Explanation**
This function showcases how to use a `while` loop to iterate over an integer array.
- Define an integer array `numbers` with values [1, 2, 3, 4, 5].
- Initialize a counter variable `currentIndex` to 0 for array traversal.
- Using a `while` loop, iterate through each element of the array as long as `currentIndex` is less than the length of the `numbers` array.
- For each iteration, assign the current array element to `currentNumber` and print it out, then increment `currentIndex` by 1.

## Lines 15-29: The `processJsonArray` Function and While Loop{id="line-15-29"}

**Source Code**
```ballerina {linenos=table,linenostart=15}
function processJsonArray() {

    final json[] people = [
        {"name": "John", "age": 30},
        {"name": "Jane", "age": 25},
        {"name": "Mary", "age": 20}
    ];

    int currentIndex = 0;
    while currentIndex < people.length() {
        json person = people[currentIndex];
        io:println(string `Current person: ${person.toString()}`);
        currentIndex += 1;
    }
}
```

**Explanation**
The `processJsonArray` function demonstrates how to use a `while` loop with a JSON array.
- Define a JSON array `people` containing three JSON objects, each with `name` and `age` attributes.
- Initialize a counter variable `currentIndex` to 0 for array traversal.
- Using a `while` loop, iterate through each JSON object in the `people` array as long as `currentIndex` is less than the length of the `people` array.
- For each iteration, assign the current array element to `person` and print it out, then increment `currentIndex` by 1.

Note that the `toString()` method is used to convert the JSON object to a string value before printing it out.

## Lines 31-38: Main Function and Function Calls{id="line-31-38"}

**Source Code**
```ballerina {linenos=table,linenostart=31}
public function main() {
    
    io:println("Processing an integer array using a while loop");
    processIntArray();

    io:println("\nProcessing a JSON array using a while loop");
    processJsonArray();
}
```

**Explanation**

Finally, the `main` function, which is the entry point to the program, does the following:
- Prints out a message that we are about to process an integer array.
- Calls `processIntArray` to loop through the integer array using a while loop.
- Prints out a message that we are about to process a JSON array.
- Calls `processJsonArray` to loop through the JSON array using a while loop.