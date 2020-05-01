#include<bits/stdc++.h>
#ifndef UnionStructs_H
#define UnionStructs_H
using namespace std;

struct str{
    string x;
    str(string c)
    {
        x = c;
    }
};

struct vecStr{
    vector<string> x;
    void addString(string c)
    {
        x.push_back(c);
    }
};

#endif