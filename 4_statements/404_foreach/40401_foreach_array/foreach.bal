import ballerina/io;

public function main() {

    io:println("foreach with int array");
    foreachIntArray();

    io:println("\nforeach with json array");
    foreachJsonArray();
}

function foreachIntArray() {
    final int[] numbers = [1, 2, 3, 4, 5];

    foreach int number in numbers {
        io:print(number, ",");
    }
}

function foreachJsonArray() {
    final json[] people = [
        {name: "John", age: 30},
        {name: "Jane", age: 25},
        {name: "Smith", age: 32}
    ];

    foreach json person in people {
        io:print(person, ",");
    }
}
