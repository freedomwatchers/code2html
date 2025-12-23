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
The following table details the level of C++ support provided by this tool.

| Feature Category | Fully Supported | Not Supported (Rendered as plain text) |
| :--- | :--- | :--- |
| **C++ Standard** | `C++98`, `C++03`, `C++11` | `C++14`, `C++17`, `C++20` |
| **Keywords** | All keywords from C++11 (e.g., `constexpr`, `nullptr`, `decltype`, `final`, `override`) | Post-C++11 keywords |
| **Types** | `int`, `char`, `float`, `double`, `void`, `bool`, `char16_t`, `char32_t`, `auto`, etc. | Post-C++11 types |
| **OO / Memory** | `class`, `struct`, `union`, `new`, `delete`, `this`, `public`, `private`, `friend`, `virtual` | - |
| **Preprocessor** | `#include`, `#define`, `#ifdef`, `#ifndef`, `#endif`, `#pragma`, `#import`, `#else` | - |
| **Modern C++** | Lambdas, static_assert, thread_local (Keywords) | `co_await`, `module`, etc. |

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
To build the project on Linux/Unix (full-featured version):
```bash
g++ parser.cpp cppparse.cpp -o code2html
```

> [!NOTE]
> `parsefiles.cpp` contains a legacy standalone version with limited keyword support. For full C++11 highlighting, always build with `parser.cpp` and `cppparse.cpp`.

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
- [C++11 Implementation Plan](C++11_Implementation_Plan.md)
