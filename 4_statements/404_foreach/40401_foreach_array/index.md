---
title: "Looping Through Arrays with Foreach in Ballerina"
description: "Learn how to use for each statement to loop through integer and JSON arrays in Ballerina."
keywords:
    - foreach loop
    - array handling
    - JSON array
weight: 40401
tags:
    - "foreach"
    - "loop"
    - "array"
    - "JSON array"
categories:
    - "Iteration"
series:
    - Methods of Iteration
    - Working with Arrays
date: 2023-07-31
---

This walkthrough demonstrates how to use the `foreach`` statement in Ballerina to iterate over arrays, including both integer and JSON arrays. We'll break down the code to help you understand every detail.

<!--more-->
Here's the complete code for this example. Refer to <span class="text-info"><i class="far fa-lightbulb"></i> Tips</span> for line-by-line explanations.

{{< example >}}


#### Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

The output will sequentially display the elements of an integer array and a JSON array, demonstrating the correct execution of the foreach loops in the program.

{{< output >}}
