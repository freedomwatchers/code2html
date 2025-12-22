# Implement C++11 Coverage

Improve `code2html` to correctly highlight C++11 features, including new keywords, string literal prefixes, and raw string literals.

## User Review Required

> [!IMPORTANT]
> The parser has a fundamental bug where it doesn't flush the current word being built when it encounters a string or comment start. This causes prefixes like `u8` or characters before a comment to appear after the string/comment. I will fix this as part of the C++11 implementation.

## Proposed Changes

### Keywords

#### [MODIFY] [cpp.kwd](keywords/cpp.kwd)
Add C++11 keywords:
- `alignas`, `alignof`, `char16_t`, `char32_t`, `constexpr`, `decltype`, `noexcept`, `nullptr`, `static_assert`, `thread_local`, `final`, `override`.

---

### Parser Logic

#### [MODIFY] [parser.cpp](parser.cpp)
- **Fix word flushing**: Ensure `keyWord` is flushed (search for match and output) when entering `string_literal`, `char_literal`, or comments.
- **Support String Prefixes**: Modify `handle_code` or `handle_literal` to handle `u8`, `u`, `U`, and `L` prefixes correctly.
- **Support Raw String Literals**: Handle `R"(...)"` syntax. This is more complex because it uses a custom delimiter.

#### [MODIFY] [parser.h](parser.h)
- Add a helper method `flushKeyWord` to avoid duplication.
- Potentially update `Context` to handle raw strings.

## Verification Plan

### Automated Tests
- Run `./code2html tests/test_cpp11.cpp`
- Verify the output `tests/test_cpp11.cpp.html` for:
    - Correct keyword highlighting (blue).
    - Correct string literal highlighting (gray/original color).
    - Correct placement of prefixes (e.g., `u8"..."` should not become `"..."u8`).
    - Correct handling of raw strings `R"(...)"`.
