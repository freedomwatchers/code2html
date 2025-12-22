# C++98 Coverage Implementation Plan (Executed)

## Goal
Enable `code2html` to correctly highlight all C++98 features (keywords) and ensure the project compiles and runs reliably on Linux.

## Implemented Changes

### Compilation & Critical Bug Fixes
The project had several issues prohibiting compilation and correct execution on Linux.

#### [MODIFY] [cppparse.cpp](cppparse.cpp)
- **Feature**: Updated `main` to accept command-line arguments (`argv[1]`) instead of hardcoding `CppParser.cpp`.
- **Fix**: Adjusted `#include "cppparse.h"` and `keywords/cpp.kwd` to match Linux case-sensitive filenames.

#### [MODIFY] [cppparse.h](cppparse.h)
- **Fix**: Changed `#include "parser.h"` to match filename case.
- **Fix**: Corrected destructor to avoid memory corruption/core dump by deleting individual char arrays in `keyWords` instead of the array of pointers.

#### [MODIFY] [parser.h](parser.h)
- **Fix**: Increased `MAX_KEYWORD` from 64 to 256 to prevent buffer overflow (segmentation fault) when loading the larger C++98 keyword set.
- **Fix**: Added `virtual` keyword to comment handling methods for correct polymorphism.

#### [MODIFY] [parser.cpp](parser.cpp)
- **Fix**: Commented out duplicate `main` function (conflicted with `cppparse.cpp`).
- **Fix**: Repaired syntax errors (broken comments, invalid scope operators `Parser: :`) caused by file corruption.
- **Fix**: corrected logic in `keyMatch` to properly reset `keyIndex` and ensure all paths return a value.

### C++98 Feature Coverage

#### [MODIFY] [keywords/cpp.kwd](keywords/cpp.kwd)
- Added all missing C++98 keywords:
  `asm`, `auto`, `catch`, `const_cast`, `continue`, `dynamic_cast`, `explicit`, `export`, `extern`, `goto`, `inline`, `mutable`, `namespace`, `operator`, `private`, `protected`, `public`, `register`, `reinterpret_cast`, `static`, `static_cast`, `template`, `throw`, `try`, `typedef`, `typeid`, `typename`, `virtual`, `volatile`, `wchar_t`.

## Verification

### Automated Tests
1.  **Compile**: `g++ parser.cpp cppparse.cpp -o code2html`
2.  **Test Execution**:
    - Created `tests/test_cpp98.cpp` with all C++98 keywords.
    - Ran `./code2html tests/test_cpp98.cpp`.
    - Validated output `tests/test_cpp98.cpp.html` contains correct syntax highlighting.
