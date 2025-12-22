# CodeToHTML

This is a simple tool to generate code syntax highlighting in HTML format.

## Features
- **Syntax Highlighting**: Supports C/C++ syntax highlighting.
    - Keywords (Blue)
    - Comments (Green)
    - string/char literals (Gray)
- **HTML Generation**: Converts source code to HTML documents.
- **Cross-Platform**: Compiles on Linux and Windows.
- **Wildcard Support**: Built-in wildcard expansion for Windows.

## C++ Support Matrix
The following table details the level of C++ support provided by this tool. Note that `code2html` primarily supports a subset of C++98.

| Feature Category | Fully Supported | Not Supported (Rendered as plain text) |
| :--- | :--- | :--- |
| **Keywords** | `if`, `else`, `while`, `for`, `switch`, `case`, `break`, `default`, `return`, `do`, `true`, `false` | `virtual`, `protected`, `static`, `inline`, `extern`, `explicit`, `export`, `mutable`, `namespace`, `operator`, `throw`, `try`, `catch`, `volatile` |
| **Types** | `int`, `char`, `float`, `double`, `void`, `bool`, `short`, `long`, `unsigned`, `signed` | `auto`, `decltype`, `wchar_t`, `char16_t`, `char32_t` |
| **OO / Memory** | `class`, `struct`, `union`, `new`, `delete`, `this`, `public`, `private`, `friend` | `final`, `override`, `constexpr`, `nullptr` |
| **Preprocessor** | `#include`, `#define`, `#ifdef`, `#ifndef`, `#endif`, `#pragma`, `#import` | - |
| **Modern C++ (C++11+)** | - | All modern features (e.g., `lambda`, `static_assert`, `thread_local`, `co_await`, `module`) |

## C++ Feature Documentation
Below are links to documentation for features discussed above.

### Supported Features
- [Control Flow Statements](https://en.cppreference.com/w/cpp/language/statements) (`if`, `while`, `for`, `switch`)
- [Fundamental Types](https://en.cppreference.com/w/cpp/language/types) (`int`, `char`, `float`, `void`)
- [Classes and Structures](https://en.cppreference.com/w/cpp/language/classes) (`class`, `struct`, `union`)
- [Dynamic Memory Management](https://en.cppreference.com/w/cpp/language/new) (`new`, `delete`)

### Unsupported Features
- [Virtual Functions](https://en.cppreference.com/w/cpp/language/virtual) (`virtual`)
- [Namespaces](https://en.cppreference.com/w/cpp/language/namespace) (`namespace`)
- [Exceptions](https://en.cppreference.com/w/cpp/language/exceptions) (`try`, `catch`, `throw`)
- [Modern C++ Support](https://en.cppreference.com/w/cpp/language/history) (C++11, C++14, C++17, C++20)



## Development Onboard

### Dependencies
- C++ Compiler (g++, clang++, or MSVC)
- Standard C++ Libraries

#### fast-track for Ubuntu/Debian
```bash
sudo apt-get install build-essential
```

### Build Instructions
To build the project on Linux/Unix:
```bash
g++ parsefiles.cpp -o code2html
```

### Usage
Run the tool by providing the source file(s) as arguments:
```bash
./code2html parsefiles.cpp
```
This will generate `parsefiles.cpp.html`.

## Testing Battery

A more complex testing battery is available to run `code2html` against entire Git repositories. This battery clones a repository, processes all C++ files, and generates a summary report.

### Running the Testing Battery
Provide the Git repository URL as an argument to the `run_test_battery.sh` script:

```bash
./run_test_battery.sh <repository_url>
```

**Example:**
```bash
./run_test_battery.sh https://github.com/danmar/cppcheck.git
```

### Outputs
- **Cloned Repo**: The repository is cloned into a local directory.
- **HTML Files**: All generated HTML files are stored in a `code2html_output` directory within the cloned repository, preserving the original directory structure.
- **Summary Report**: A `summary_report.md` is generated in the `code2html_output` directory, containing metrics, stats, and details of any failed files.

## Notes
- This project contains some legacy code for wildcard expansion from the Samba project.

## Feature Coverage & Reports
- [C++98 Implementation Plan](C++98_Implementation_Plan.md)
- [C++03 Coverage Report](C++03_Coverage_Report.md)
