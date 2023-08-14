**Less Type Safe Version:**

```
// Valid & expected by the client
http:Created res = {body: {name : "Bal.tip", id: "123"}}; 

// Valid, But not expected by the client. Typo in the field name.
http:Created res = {body: {neme : "Bal.tip", id: "123"}}; 
```

**Type safe version:**

```
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