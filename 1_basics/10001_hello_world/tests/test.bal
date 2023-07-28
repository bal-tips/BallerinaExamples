import ballerina/test;
import ballerina/io;

string stdout = "";

// This has a function signature similar to the `io:println` function.
public function mockPrint(any|error... val) {
    test:assertExactEquals(val.length(), 1);
    string value = let var arg0 = val[0] in arg0 is any ? arg0.toString() : arg0.toString();
    stdout = stdout + value + io:NEW_LINE;
}

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
test:MockFunction printlnMockFn = new ();


@test:Config
function testOutput() returns error? {
    stdout = "";
    test:when(printlnMockFn).call("mockPrint");
    main();
    string expected = check io:fileReadString("output.txt");
    // We have to ignore the last character because it is a new line character.
    // See fileReadString function in io module.
    test:assertEquals(stdout.substring(0, stdout.length() - 1), expected);
}

