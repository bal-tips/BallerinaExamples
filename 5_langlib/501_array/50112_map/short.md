```ballerina
final int[] numbers = [1, 2, 3, 4, 5];

int[] squares = numbers.map((n) => n * n);
io:println(squares);
```
