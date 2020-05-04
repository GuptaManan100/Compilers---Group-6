#include <bits/stdc++.h>
#ifndef AdditionalClasses_H
#define AdditionalClasses_H

using namespace std;

#define pb push_back

enum dataType { _int, _float, _bool, _void, _error };
enum opType { _add, _subtract, _div, _mul, _mod, _assign };

class Variable {
   public:
    dataType type;
    string name;

    Variable(dataType dt, string s) {
        name = s;
        type = dt;
    }
};

class Function {
   public:
    string name;
    dataType returnType;
    vector<Variable> params;

    Function(dataType ret, string s) {
        name = s;
        returnType = ret;
        params.clear();
    }

    void addParameter(Variable x) { params.pb(x); }

    Variable findParameter(string s) {
        for (auto x : params) {
            if (x.name == s) return x;
        }
        Variable toret(_error, "a");
        return toret;
    }
};

class SymbolTable {
   public:
    vector<map<string, Variable *>> vars;
    map<string, Function *> funcs;
    int level;

    Variable *findVariable(string s) {
        for (int i = level; i >= 0; i--) {
            if (vars[i].find(s) != vars[i].end()) {
                return vars[i][s];
            }
        }
        return NULL;
    }

    Function *findFunction(string s) {
        if (funcs.find(s) != funcs.end()) {
            return funcs[s];
        }
        return NULL;
    }

    int addVariable(string s, dataType dt, string id) {
        if (level < 0) return 1;
        if (vars[level].find(s) != vars[level].end()) return 1;
        if (findFunction(s) != NULL) return 1;
        vars[level][s] = new Variable(dt, id);
        return 0;
    }

    int upgradeVariable(string s, dataType dt, string id) {
        if (level < 0) return 1;
        delete vars[level][s];
        vars[level][s] = new Variable(dt, id);
        return 0;
    }

    int addFunction(string s, dataType ret, string id) {
        if (findFunction(s) || findVariable(s)) return 1;
        funcs[s] = new Function(ret, id);
        return 0;
    }

    void addLevel() {
        level++;
        map<string, Variable *> newLevel;
        vars.pb(newLevel);
    }

    void reduceLevel() {
        if (level >= 0) {
            level--;
            vars.pop_back();
        }
    }

    SymbolTable() {
        level = -1;
        vars.clear();
        funcs.clear();
        addLevel();
    }

    void printVars() {
        cout << "level: " << level << endl;
        for (int i = 0; i <= level; i++) {
            cout << "----------" << i << "-----------" << endl;
            for (auto x : vars[i])
                cout << x.first << " " << x.second->name << endl;
        }
    }
};

#endif