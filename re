#include <iostream>
#include <regex>
#include <string>
using namespace std;

int main() {
    string pattern, input;

    cout << "Enter Regular Expression: ";
    getline(cin, pattern);

    cout << "Enter String to Validate: ";
    getline(cin, input);

    try {
        // Convert RE to C++ compatible form (escape if needed)
        regex re(pattern);

        if (regex_match(input, re))
            cout << "String is accepted by the Regular Expression.\n";
        else
            cout << "String is NOT accepted by the Regular Expression.\n";
    }
    catch (regex_error& e) {
        cout << "Invalid Regular Expression!\n";
    }

    return 0;
}
