```ballerina
final int[] numbers = [1, 2, 3, 4, 5];

int currentIndex = 0;
while currentIndex < numbers.length() {
    int currentNumber = numbers[currentIndex];
    io:println(currentNumber);
    currentIndex += 1;
}
```
