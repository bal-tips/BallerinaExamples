import ballerina/test;

string[] stdout = [];

// This has a function signature similar to the `io:println` function.
public function mockPrint(any|error... val) {
    test:assertExactEquals(val.length(), 1);
    string value = let var arg0 = val[0] in arg0 is any ? arg0.toString() : arg0.toString();
    stdout.push(value);
}

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
test:MockFunction printlnMockFn = new ();


@test:Config
function testMainFunction() {
    test:when(printlnMockFn).call("mockPrint");
    main();
    test:assertEquals(stdout.length(), 1);
    test:assertEquals(stdout[0], "Hello, World...!");
}
