---
title : "Looping Through Arrays with While Loop in Ballerina"
description: "Learn how to use a while loop to iterate through integer and JSON arrays in Ballerina."
keywords :
    - while loop
    - array handling
    - JSON array
weight: 40501
---

# Looping Through Arrays with While Loop in Ballerina

In this tutorial, we will demonstrate how to use a while loop to iterate through arrays in Ballerina. We'll use an integer array and a JSON array for this example and explain each line of code to ensure you understand how the while loop works.


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

The output will sequentially display the elements of an integer array and a JSON array, demonstrating the correct execution of the while loops in the program.
