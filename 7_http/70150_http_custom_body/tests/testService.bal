import ballerina/test;
import ballerina/http;

http:Client testClient = check new ("http://localhost:9150");

@test:Config {}
public function testGet() returns error? {

    http:Response response = check testClient->put("/book?name=BallerinaByExample", ());
    test:assertEquals(response.statusCode, http:STATUS_CREATED);

    json payload = { name : "BallerinaByExample", id : "123"};
    test:assertEquals(response.getJsonPayload(), payload);
}