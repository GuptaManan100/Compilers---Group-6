#include <bits/stdc++.h>

#include "additionalClasses.h"
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
    dataType type;
    void setType(dataType a = _int, dataType b = _int) {
        type = _int;
        if (a == _float || b == _float) type = _float;
    }
    string tempaddr(int val = 0) { return addr = "__temp" + to_string(val); }
};

struct stmt{
    list<int> *truelist,*falselist,*nextlist;

    list<int> *mergelist(list<int> *a,list<int> *b){
        list<int> *temp = new list<int>;
        temp->merge(*a);
        temp->merge(*b);
        return temp;
    }

    list<int> *makelist(int i){
        list<int> *temp = new list<int>;
        temp->push_back(i);
        return temp;
    }

    void backpatch(vector<string> &instructions,list<int> *a,string label){
        for(auto x: *a){
            instructions[x] += label;
        }
    }
};

#endif