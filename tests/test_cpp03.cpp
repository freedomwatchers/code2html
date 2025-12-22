/* C++03 Feature Verification */

// 1. Value Initialization
// In C++03, `new int()` value-initializes to 0. 
// `code2html` should correctly highlight 'new', 'int', and handle parentheses.
int* p = new int(); 

#include <vector>

// 2. std::vector contiguous storage
// C++03 guarantees vector elements are contiguous.
// Ensuring templates and namespaces are highlighted/handled.
void foo() {
    std::vector<int> v(10);
    if (!v.empty()) {
        int* data_ptr = &v[0];
    }
}
