#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <memory>
#include <algorithm>

// C++11 features

// auto and decltype
auto add(int a, int b) -> int {
    return a + b;
}

void test_keywords() {
    alignas(16) int x;
    bool b = noexcept(add(1, 2));
    static_assert(sizeof(int) >= 4, "int is too small");
    int* p = nullptr;
    constexpr int val = 10;
}

void test_lambda() {
    auto l = [](int x) { return x * x; };
    std::vector<int> v = {1, 2, 3};
    std::for_each(v.begin(), v.end(), [](int n) { std::cout << n << " "; });
}

void test_strings() {
    std::string s1 = u8"UTF-8 string";
    std::u16string s2 = u"UTF-16 string";
    std::u32string s3 = U"UTF-32 string";
    std::string s4 = R"(Raw string literal with \ and " )";
}

enum class Color { Red, Green, Blue };

struct Base {
    virtual void func() final {}
};

struct Derived : Base {
    // void func() override {} // Error if final
};

template<typename... Args>
void var_func(Args... args) {
    // Variadic templates
}

int main() {
    std::vector<int> v = {1, 2, 3, 4, 5};
    for (auto& i : v) {
        std::cout << i << std::endl;
    }
    return 0;
}
