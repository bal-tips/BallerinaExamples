import ballerina/io;

function processIntArray() {

    final int[] numbers = [1, 2, 3, 4, 5];

    int currentIndex = 0;
    while currentIndex < numbers.length() {
        int currentNumber = numbers[currentIndex];
        io:println(string `Current number: ${currentNumber}`);
        currentIndex += 1;
    }
}

function processJsonArray() {

    final json[] people = [
        {"name": "John", "age": 30},
        {"name": "Jane", "age": 25},
        {"name": "Mary", "age": 20}
    ];

    int currentIndex = 0;
    while currentIndex < people.length() {
        json person = people[currentIndex];
        io:println(string `Current person: ${person.toString()}`);
        currentIndex += 1;
    }
}

public function main() {
    
    io:println("Processing an integer array using a while loop");
    processIntArray();

    io:println("\nProcessing a JSON array using a while loop");
    processJsonArray();
}