```ballerina
final int[] numbers = [1, 2, 3, 4, 5];

foreach int number in numbers {
    io:print(number, ",");
}
```
`bal run`

```plain
1,2,3,4,5,
```
