```ballerina
import ballerina/http;

service /greeting on new http:Listener(9090) {
    resource function get [string name]() returns string {
        return string `Greetings, ${name}...!`;
    }
}
```
Terminal 1:
`bal run`

Terminal 2:
`curl localhost:9090/greeting/Ballerina`

```plain
Greetings, Ballerina...!
```
