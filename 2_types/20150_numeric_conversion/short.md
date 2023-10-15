
Compile time error <i class="far fa-times-circle text-danger"></i> 

```ballerina
float num1 = 10.0;
decimal num2 = 10 + num1; // error
int num3 = 1.0; // error - floating point literal on the right-hand side.
```

With type conversion <i class="far fa-check-circle text-success"></i> 

```ballerina
float num1 = 10.0;
decimal num2 = 10 + <decimal>num1;
int num3 = <int>num1;
int num4 = <int>1.0; // Literal
```