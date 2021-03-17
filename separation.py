import re
hand = open('Scraped_Text.txt')

for line in hand:
   line = line.rstrip()
   if re.search('^[1-9]\..*', line):
       print(line)

for line in hand:
   line = line.rstrip()
   if re.search('^[a-d]\).*', line):
       print(line)

i = 0
opt = []
for line in hand:
    line = line.rstrip()
    if re.search('^[a-d]\).*', line):
        opt[i] = line
        i = i + 1
