import ballerina/io;
import ballerina/lang.array;

function processIntArray() {
    final int[] numbers = [1, 2, 3, 4, 5];

    int[] squares = numbers.map((n) => n * n);
    io:println(squares);
}

function processJsonArray() returns error? {
    final json[] people = [
        {name: "John", age: 30},
        {name: "Jane", age: 25},
        {name: "Smith", age: 32}
    ];

    string[] names = array:map(people, p => (check p.name).toString());
    io:println(names);
}

public function main() returns error? {
    io:println("Processing an integer array using the array:map function");
    processIntArray();

    io:println("\nProcessing a JSON array using the array:map function");
    check processJsonArray();
}
