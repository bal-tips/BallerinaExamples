---
title: "HTTP Greeting Service - Ballerina"
---

# Greeting Service in Ballerina

Welcome to the Ballerina "Greeting Service" program walkthrough!

## Line 1: Importing the HTTP Module{id="line-1"}

**Source Code**
```ballerina{linenos=table,linenostart=1}
import ballerina/http;
```

**Explanation**
Here, we're importing the `http` module from the `ballerina` organization.
- This import statement allows us to use the HTTP functionalities that the `http` module provides in our service.
- The identifier `http` acts as a prefix, enabling us to reference this module elsewhere in the source file.

## Lines 3 & 7: Defining the Service

**Source Code**
```ballerina{linenos=table,linenostart=3}
service /greeting on new http:Listener(9090) {
    // ...
}
```

**Explanation**
These lines define the `greeting` service.
- The service is exposed at the `/greeting` path.
- The service runs on an HTTP listener that listens on port `9090`.
- The scope of the service is marked by the open `{` and closing `}` braces.

## Lines 4-6: Defining the Resource Function

**Source Code**
```ballerina {linenos=table,linenostart=4}
    resource function get [string name]() returns string {
        // ...
    }
```

**Explanation**
These lines define the `get` resource function within the service.
- The function expects a string parameter `name`, which it retrieves from the URL (this is a path parameter).
- The function returns a string as a response.
- The scope of the resource function is defined by the open `{` and closing `}` braces.

## Line 5: Constructing the Greeting

**Source Code**
```ballerina {linenos=table,linenostart=5}
        return string `Greetings, ${name}...!`;
```

**Explanation**
This line constructs and returns a greeting message that includes the provided name.
- The greeting is a string, interpolated with the `name` parameter using the `${name}` syntax.
- The backtick (\`) character defines a template string, which allows us to include variables directly in the string.
- The greeting message is returned as the response to the HTTP request.
- The `Content-Type` is set to `text/plain` because we are returning a string value.
