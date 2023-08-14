import ballerina/http;

public type Created record {|
    *http:Created;
    record {|
        string name;
        string id;
    |} body;
|};

service on new http:Listener(9090) {
    resource function put book(string name) returns Created {
        // Implementation goes here. 
        // Partially implemented for demo purposes.
        Created res = {body: {name, id: "123"}};
        return res;
    }
}
