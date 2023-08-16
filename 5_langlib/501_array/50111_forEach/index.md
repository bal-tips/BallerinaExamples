---
title: Array forEach Function
description: Array forEach Function
keywords:
    - forEach array function
    - array handling 
weight: 50111
ballerina_feature: [iterate]
ballerina_lang: []
ballerina_type: [list, json]
ballerina_module: [array]
date: 2023-07-31
---

This example demonstrates the usage of the `forEach` function in Ballerina. The `forEach` function is used to iterate through the elements of an array. The `forEach` function takes a function as a parameter. The function passed as a parameter to the `forEach` function is executed for each element of the array. The function passed as a parameter to the `forEach` function can be a lambda (anonymous) function or a function pointer.

<!--more-->

## Example

{{< example >}}

## Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

The output will sequentially display the elements of an integer array and a JSON array, demonstrating the correct execution of the forEach function in the program.

{{< output >}}