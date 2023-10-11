---
title: Array forEach Function
description: Array forEach Function
keywords:
    - forEach array function
    - array handling 
weight: 50111
tags:
    - "forEach function"
    - "array"
categories:
    - "Array Functions"
series:
    - "Working with Arrays"
    - "Methods of Iteration"
date: 2023-07-31
---

This example highlights the use of the forEach function in Ballerina to iterate over array elements. The forEach function accepts a function as its parameter, which is executed for each array element. This provided function can be either a lambda (anonymous) function or a function pointer.

<!--more-->

{{< example >}}

#### Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

The output will sequentially display the elements of an integer array and a JSON array, demonstrating the correct execution of the forEach function in the program.

{{< output >}}