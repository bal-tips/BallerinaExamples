---
title: "Add custom body to an HTTP response in Ballerina"
description: "Add custom body to an HTTP response in Ballerina"
keywords:
    - HTTP service
    - resource function
    - HTTP Response
weight: 70150
tags: 
    - "http"
    - "service"
    - "custom types"
categories:
    - "Services"
series:
    - "HTTP Services and APIs"
    - "Ensure Type Safety"
date: 2023-08-14
---

In Ballerina, you may sometimes want to add custom information to an HTTP response's body. While you can directly use built-in HTTP responses such as `http:Created` to override the body payload, this approach may not always be type-safe. The `body` field in such responses is of type `anydata`, which can lead to mistakes such as typos in field names.

<!--more-->

## Less Type-Safe Version

Below, you can see an example of how a typo in the field name can still be syntactically valid, potentially leading to unexpected behavior.

```ballerina
// Expected
http:Created res = {body: {name: "Bal.tip", id: "123"}}; 

// Still valid at compile time, but the typo will cause runtime error
http:Created res = {body: {neme: "Bal.tip", id: "123"}}; 
```

The second line contains valid Ballerina code. However, the typo in the field name (`neme` instead of `name`) might cause unexpected runtime results.

To prevent such problems and enhance code robustness and type-safety, consider defining a new record type that represents the desired payload. This approach allows you to harness Ballerina's robust type system to detect errors during compilation.

{{< example test=true >}}

In this type-safe approach, the body's structure is clearly outlined, specifying expected fields. This not only enables the compiler to identify mistakes but also enhances code clarity, maintainability, and safety.

#### Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

Your service should now be running on `localhost:9090`.

#### Testing the Service

You can test this service using the `curl` command in the terminal:

Open a new terminal window and enter the following command, replacing `{name}` with any name of your choosing:

```bash
curl -X 'PUT' \
'http://localhost:9090/book?name={name}'
```
    
e.g., 
  
```bash
curl -X 'PUT' \
'http://localhost:9090/book?name=BallerinaByExample'
```

    You should see a json message in the terminal.

#### Stopping the Server

To stop the server, you can press `Ctrl + C` in the terminal where the server is running. This will terminate the Ballerina process and stop the server.
