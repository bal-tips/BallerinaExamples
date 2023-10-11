```ballerina
import ballerina/http;

service /greeting on new http:Listener(9090) {
    resource function get [string name]() returns string {
        return string `Greetings, ${name}...!`;
    }
}
```
Terminal 1
<i class="fa fa-terminal"></i><br> 
```
bal run
```

Terminal 2
<i class="fa fa-terminal"></i><br>
```
curl http://localhost:9090/greeting/Ballerina
```

```plain
Greetings, Ballerina...!
```
