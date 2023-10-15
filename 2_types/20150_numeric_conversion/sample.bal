import ballerina/io;

public function main() {

    // Safe type inference from literals
    float num1 = 10.0;

    // Explicit conversion from float to decimal
    decimal num2 = 10 + <decimal>num1;

    // Explicit conversion from float to int
    int num3 = <int>num1;
    int num4 = <int>10.0; // Literal

    // Print the results
    io:println("num1: ", num1);
    io:println("num2: ", num2);
    io:println("num3: ", num3);
    io:println("num4: ", num4);
}
