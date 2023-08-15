```ballerina
final int[] numbers = [1, 2, 3, 4, 5];

// Same forEach function, 4 different ways of calling it.

// with lambda
numbers.forEach((n) => io:println(n));
array:forEach(numbers, (n) => io:println(n));

// function pointer
numbers.forEach(printNumberFunction);
array:forEach(numbers, printNumberFunction);
```
`bal run`

```plain
1
2
3
4
5
```