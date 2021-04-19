import matplotlib.pyplot as plt
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="knss_aptitude"
)
mycursor = mydb.cursor()

mycursor.execute("SELECT eg.marks, e.total_marks, s.subject_name FROM exams_given AS eg, exam AS e, subject AS s WHERE eg.exam_code = e.exam_code AND e.subject_id = s.subject_id AND eg.is_checked = 1 ORDER By s.subject_name")
marks = mycursor.fetchall()

mycursor.execute("SELECT subject_name FROM subject ORDER By subject_name")
subjects = mycursor.fetchall()

mymarks = []
for s in subjects:
    avg = 0.0
    count = 0
    tot = 0.0
    for m in marks:
        if m[2] == s[0]:
            tot += m[0]/m[1]*100
            count += 1
    if count > 0:
        avg = tot/count
    mymarks.append(avg)

mysubjects = [s[0] for s in subjects]

colors = ['blue','green']
figure = plt.figure(figsize=(14,6))
axes = figure.add_subplot(1,1,1)
axes.barh(mysubjects,mymarks,color=colors,tick_label=mysubjects)
plt.show()