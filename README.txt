## How to Build full repo

1. execute `bal run build.bal`
2. execute `./gradlew test` to Run Tests

Each example must contains following files:
- `index.md` - Markdown file with example description
- `Ballerina.toml` 
- `output.txt` - Text file with output of program
- `short.md` - Markdown file with short code example with output
- `tests\test.bal` - Ballerina tests for the example
