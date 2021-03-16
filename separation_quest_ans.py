#---Using Regex to retrieve questions and answers
import re

hand = open('Scraped_Text.txt')
quest = [1,2,3,4,5,6,7]
rows, cols = (50, 3)
opt = [[0]*cols]*rows


for i in range(0,50):
    for line in hand:
        line = line.rstrip()
        if re.search('^[1-9]\..*', line):
            quest[i+1] = line
        elif re.search('^[1-9][0-9]\..*', line):
            quest[i+1] = line
        else:
            continue
        i = i + 1

for line in hand:
    for j in range(0,4):
        if re.search('^[a-d]\).*', line):
            opt[i][j] = line
            j = j + 1


Quest_hand = open('Questions.txt')
for line in quest:
    Quest_hand.write(line)

opt_hand = open('Options.txt')
for row in opt:
    for col in row:
        opt_hand.write(col)
