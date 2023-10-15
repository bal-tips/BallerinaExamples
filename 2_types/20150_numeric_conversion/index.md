---
title: Auto-Casting and Conversion among Numerical Types
description: Ballerina does not support implicit conversion among numerical types. This safeguard helps prevent unintended loss of precision and unexpected program behavior.
keywords:
    - Conversion among Numerical Types
    - Casting and Conversion in Ballerina
date: 2023-06-05
weight: 20150
tags:
    - int
    - float
    - decimal
    - byte
categories:
    - Numeric Literal
---

Ballerina does not support implicit conversion among numerical types. This safeguard helps prevent unintended loss of precision and unexpected program behavior.

For example, the following code would result in a compile-time error:
    
```ballerina
float x = 10.0;
decimal y = 10 + x; // error
int z = 1.0; // error - floating point literal on the right-hand side.
```

You can use explicit type conversion to convert a value from one numerical type to another. 

{{<example>}}

#### Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

#### Output of the Example

{{< output >}}
