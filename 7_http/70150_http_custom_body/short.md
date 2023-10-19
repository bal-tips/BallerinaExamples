**Less Type Safe Version:**

```ballerina
// Expected
http:Created res = {body: {name : "Bal.tip", id: "123"}}; 

// Still valid at compile time, but the typo will cause runtime error
http:Created res = {body: {neme : "Bal.tip", id: "123"}}; 
```

**Type safe version:**

```ballerina
public type Created record {|
    *http:Created;
    record {|
        string name;
        string id;
    |} body;
|};

/// ...

Created res = {body: {name : "Bal.tips", id: "123"}};
```