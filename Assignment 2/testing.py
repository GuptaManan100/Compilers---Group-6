import re
f = open('testfile1.java', 'r')
content = f.read()
f.close()
# remove comments from file


def removeComments(string):
    # remove all occurrences streamed comments (/*COMMENT */) from string
    string = re.sub(re.compile("/\*.*\*/", re.DOTALL), "", string)
    # remove all occurrence single-line comments (//COMMENT\n ) from string
    string = re.sub(re.compile("//.*?\n"), "", string)
    string = re.sub(re.compile("\n"), " ", string)
    return string


content = removeComments(content)
print(content)
testre = re.compile("class\s+([a-zA-Z][a-zA-Z0-9]*)\s*\{", re.DOTALL)
testclass = re.findall(testre, content)
print(testclass)

testre = re.compile(
    "class\s+([a-zA-Z][a-zA-Z0-9]*)\s+extends\s+([a-zA-Z][a-zA-Z0-9]*)\s*\{", re.DOTALL)
testinclass = re.findall(testre, content)
print(testclass, testinclass)

cons = []
for cl in testclass:
    testre = re.compile("class\s+"+cl+"\s*\{.*"+cl+"\s*\(.*\)\s*{", re.DOTALL)
    cons = re.findall(testre, content)
    print(cons)
