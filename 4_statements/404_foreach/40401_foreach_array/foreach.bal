import ballerina/io;

function processIntArray() {
    final int[] numbers = [1, 2, 3, 4, 5];

    foreach int number in numbers {
        io:println(string `Current number: ${number}`);
    }
}

function processJsonArray() {
    final json[] people = [
        {name: "John", age: 30},
        {name: "Jane", age: 25},
        {name: "Smith", age: 32}
    ];

    foreach json person in people {
        io:println(string `Current person: ${person.toString()}`);
    }
}

public function main() {

    io:println("Processing an integer array using a foreach loop");
    processIntArray();

    io:println("\nProcessing a JSON array using a foreach loop");
    processJsonArray();
}