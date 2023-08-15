import ballerina/io;
import ballerina/lang.array;

function processIntArray() {
    final int[] numbers = [1, 2, 3, 4, 5];

    // method call syntax. 
    numbers.forEach((n) => io:println(n));
}

function processJsonArray() {
    final json[] people = [
        {name: "John", age: 30},
        {name: "Jane", age: 25},
        {name: "Smith", age: 32}
    ];

    // function call syntax.
    array:forEach(people, printPerson);
    
    // 1. Same as above using a lambda function
    // array:forEach(people, p => io:println(p)); 

    // 2. Same as above using a lambda function with method call syntax
    // people.forEach(p => io:println(p));
}

function printPerson(json person) {
    io:println(person);
}

public function main() {
    io:println("Processing an integer array using the array:forEach function");
    processIntArray();

    io:println("\nProcessing a JSON array using the array:forEach function");
    processJsonArray();
}