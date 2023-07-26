---
title : "Creating a Greeting HTTP Service in Ballerina"
description: "Create a Greeting HTTP Service in Ballerina"
keywords :
    - HTTP service
    - resource function
    - string interpolation
    - import declaration
weight: 20002
---

# Creating a Greeting HTTP Service in Ballerina

Welcome to our example of creating a simple HTTP Greeting Service using Ballerina. This example will guide you through the process of creating an HTTP service that greets users based on the name provided in the URL. We'll break down the code and explain each part in detail.

## Example Source Code and Explanation

{{< example >}}
simple_http_service.bal:::simple_http_service.bal.md
{{< /example >}}

## Running the Example

To run this example on your local machine, follow these steps:

1. Ensure Ballerina is installed on your machine. If not, download it from the [official Ballerina website](https://ballerina.io).
2. Clone [this repository]({{< data "repo" >}}) to your local machine.
3. Navigate to the directory `{{< pwd >}}`.
4. Run the command `bal run`. 

Your service should now be running on `localhost:9090`.

## Testing the Service

You can test this service using either a web browser or the `curl` command in the terminal:

1. **Web Browser:** Simply navigate to `localhost:9090/greeting/{name}` in your browser, replacing `{name}` with any name of your choosing. You should see a greeting message.
   
   e.g., `localhost:9090/greeting/Ballerina`

2. **Curl:** Open a new terminal window and enter the following command, replacing `{name}` with any name of your choosing:

    ```bash
    curl localhost:9090/greeting/{name}
    ```
    e.g., `curl localhost:9090/greeting/Ballerina`

    You should see a greeting message in the terminal.

## Stopping the Server

To stop the server, you can press `Ctrl + C` in the terminal where the server is running. This will terminate the Ballerina process and stop the server.
