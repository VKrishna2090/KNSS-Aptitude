#---Using Regex to retrieve questions and answers
import re
import json

hand = open('Scraped_Text.txt',"r")
quest = [1,2,3,4,5,6,7]
rows, cols = (50, 3)
qno = dict()
answers = dict()

i=0

for line in hand:
    line = line.rstrip()
    if re.search('^[1-9]\. .*', line) or re.search('^[1-9][0-9]\. .*', line):
        i=i+1
        ques = line
        qno[ques] = list()
        answers[ques] = ""
    if re.search('^[a-d]\).*', line):
        qno[ques].append(line)
    if re.search('^View Answer Answer:.*', line):
        answers[ques] = line[20:22]    

def filterTheDict(dictObj, callback):
    newDict = dict()
    for (key, value) in dictObj.items():
        if callback((key, value)):
            newDict[key] = value
    return newDict

new_qno = filterTheDict(qno, lambda elem : "following" not in elem[0])
new_answers = filterTheDict(answers, lambda elem : "following" not in elem[0])

print(json.dumps(new_qno, indent=1))
print(json.dumps(new_answers, indent=1))
