import ballerina/http;

public type Created record {|
    *http:Created;
    record {|
        string name;
        string id;
    |} body;
|};

configurable int port = 9090;

service on new http:Listener(port) {
    resource function put book(string name) returns Created {
        // Implementation goes here. 
        // Partially implemented for demo purposes.
        Created res = {body: {name, id: "123"}};
        return res;
    }
}
