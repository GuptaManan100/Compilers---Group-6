#include <bits/stdc++.h>
#ifndef UnionStructs_H
#define UnionStructs_H
using namespace std;

struct str {
    string x;
    str(string c) { x = c; }
};

struct vecStr {
    vector<string> x;
    void addString(string c) { x.push_back(c); }
};
struct expr {
    string addr;
    vector<string> code;
    void addcode(expr *a) {
        code.insert(code.end(), a->code.begin(), a->code.end());
    }
    void dbgcode() {
        cerr << addr << endl;
        for (auto it : code) cerr << it << endl;
        cout << endl;
    }
    string tempaddr(int val = 0) { return addr = "__temp" + to_string(val); }
};

#endif