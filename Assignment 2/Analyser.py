import re
f = open('code.txt', 'r')
content = f.read()
f.close()
# remove comments from file


def removeComments(string):
    # remove all occurrences streamed comments (/*COMMENT */) from string
    string = re.sub(re.compile("/\*.*\*/", re.DOTALL), "", string)
    # remove all occurrence single-line comments (//COMMENT\n ) from string
    string = re.sub(re.compile("//.*?\n"), "", string)
    return string

content = removeComments(content)

Classdef = [re.findall(re.compile('class.*\{', re.DOTALL),content)]
print(Classdef)
# Classname = []
# for x in Classdef:
#     Classname.append(x.split(' ')[1])
# print(Classname)
#
# a = [re.findall(r'class',line)
#             for line in open('code.txt')]
testclass = ['MountainBike']
numObjectDeclarations = 0;
for item in testclass:
    item += '\s+[a-zA-z][a-zA-Z0-9]*\s*='
    x = [re.findall(item, content)]
    for item in x:
        numObjectDeclarations+=1
print(numObjectDeclarations)
