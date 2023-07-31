---
title : "Looping Through Arrays with Foreach in Ballerina"
description: "Learn how to use for each statement to loop through integer and JSON arrays in Ballerina."
keywords :
    - foreach loop
    - array handling
    - JSON array
weight: 40401
---

# Looping Through Arrays with Foreach in Ballerina

This walkthrough focuses on using the foreach statement to loop through different types of arrays in Ballerina. We'll use both an integer array and a JSON array for this purpose. We'll then explain the code line by line to help you understand each component.

## Example Source Code and Explanation

{{< example >}}
foreach.bal:::foreach.bal.md
{{< /example >}}

## Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

The output will sequentially display the elements of an integer array and a JSON array, demonstrating the correct execution of the foreach loops in the program.
