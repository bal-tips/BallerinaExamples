import ballerina/test;
import ballerina/io;

string stdout = "";

public function mockPrintln(any|error... val) {
    // This has a function signature similar to the `io:println` function.
    foreach var item in val {
        stdout = stdout + (item is any ? item.toString() : item.toString());
    }
    stdout = stdout + io:NEW_LINE;
}

public function mockPrint(any|error... val) {
    // This has a function signature similar to the `io:print` function.
    foreach var item in val {
        stdout = stdout + (item is any ? item.toString() : item.toString());
    }
}

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
test:MockFunction printlnMockFn = new ();

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "print"
}
test:MockFunction printMockFn = new ();

@test:Config
function testOutput() returns error? {
    stdout = "";
    test:when(printlnMockFn).call("mockPrintln");
    test:when(printMockFn).call("mockPrint");
    check main();
    string expected = check io:fileReadString("output.txt");
    // We have to ignore the last character because it is a new line character.
    // See fileReadString function in io module.
    test:assertEquals(stdout.substring(0, stdout.length() - 1), expected);
}
