import re
f = open('input.java', 'r')
content = f.read()
f.close()
# remove comments from file


def removeComments(string):
    # remove all occurrences streamed comments (/*COMMENT */) from string
    string = re.sub(re.compile("/\*.*\*/", re.DOTALL), "", string)
    # remove all occurrence single-line comments (//COMMENT\n ) from string
    string = re.sub(re.compile("//.*?\n"), "", string)
    # string = re.sub(re.compile("\n"), " ", string)
    return string


content = removeComments(content)
# print(content)
testre = re.compile("class\s+([a-zA-Z][a-zA-Z0-9]*)\s*\{", re.DOTALL)
testclass = re.findall(testre, content)
# print(testclass)

testre = re.compile(
    "class\s+([a-zA-Z][a-zA-Z0-9]*)\s+extends\s+([a-zA-Z][a-zA-Z0-9]*)\s*\{", re.DOTALL)
testinclass = re.findall(testre, content)
inclass = [x[0] for x in testinclass]
# print(inclass)
for x in inclass:
    testclass.append(x)
print("Classes:", len(testclass), testclass)
print("Inherited classes:", len(testinclass) ,testinclass)


sum1 = 0
for name in testclass:
    regex = "public\s+" + name
    testre = re.compile(regex, re.DOTALL)
    cons = re.findall(testre, content)
    # print( cons)
    sum1 += len(cons)

    regex = "private\s+" + name
    testre = re.compile(regex, re.DOTALL)
    cons = re.findall(testre, content)
    sum1 += len(cons)

    regex = "protected\s+" + name
    testre = re.compile(regex, re.DOTALL)
    cons = re.findall(testre, content)
    sum1 += len(cons)

print("Constructors:", sum1)

numObjectDeclarations = 0
for item in testclass:
    item += '\s+[a-zA-Z][a-zA-Z0-9]*\s*='
    x = re.findall(item, content)
    print(x)
    for items in x:
        numObjectDeclarations += 1

for item in testclass:
    item += '\s+[a-zA-Z][a-zA-Z0-9]*\s*;'
    x = re.findall(item, content)
    print(x)
    for items in x:
        numObjectDeclarations += 1

for item in testclass:
    item += '\s+[a-zA-Z][a-zA-Z0-9]*\s*,'
    x = re.findall(item, content)
    print(x)
    for items in x:
        numObjectDeclarations += 1
print("Objects:", numObjectDeclarations)
