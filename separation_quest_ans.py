#---Using Regex to retrieve questions and answers
import re

hand = open('Scraped_Text.txt')
quest = [1,2,3,4,5,6,7]
rows, cols = (50, 3)
qno = dict()
answers = dict()
count=0

for line in hand:
    line = line.rstrip()
    if re.search('^[1-9]\..*', line) or re.search('^[1-9][0-9]\..*', line):
        count=count+1

i=0
for line in hand:
    line = line.rstrip()
    if re.search('^[1-9]\..*', line) or re.search('^[1-9][0-9]\..*', line):
        i=i+1
        ques = line
        print(ques)
        qno[ques] = list()
        answers[ques] = ""
    if re.search('^[a-d]\).*', line):
        print(line)
        qno[ques].append(line)
    if re.search('^View Answer Answer:\).*', line):
        answers[ques] = line[21,22]    
    if i==count:
        break

print(qno)
print(answers)
