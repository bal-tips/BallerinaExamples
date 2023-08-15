import ballerina/test;
import ballerina/http;

http:Client testClient = check new ("http://localhost:9001");

@test:Config {}
public function testGet() returns error? {
    http:Response response = check testClient->get("/greeting/Ballerina");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertEquals(response.getTextPayload(), "Greetings, Ballerina...!");

    response = check testClient->get("/bas");
    test:assertEquals(response.statusCode, http:STATUS_NOT_FOUND);
}