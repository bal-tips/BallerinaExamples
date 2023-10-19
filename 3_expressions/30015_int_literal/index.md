---
title : Decimal Integer Literal
description : An Integer value can be written as a set of decimal digits.
date: 2023-01-01
weight : 6033
aliases:
    - /examples/expr/literals/int-literal/
keywords:
    - Int Literal
tags:
    - int
categories:
    - Expressions
    - Literals
series:
    - Ballerina Expressions
---

An Integer value can be written as a set of decimal digits. In the Decimal system, Digits are 
`0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, and `9`. NonZeroDigit is any digit except `0`.

**Syntax** : `0` | NonZeroDigit Digit*

An Integer value can be made negative by writing a minus (`-`) sign in front of the literal.

{{< example >}}

##### Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

You should see the following output printed to your console, indicating that the program has run successfully.

{{< output >}}
