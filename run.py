from flask import *
import random
import datetime
from flask_mysqldb import MySQL
from SanFoundry_Scraped import initiate_scraping, scrape
from separation_quest_ans import getQuestionAndOption
import os

app = Flask(__name__)

app.secret_key = 'knss'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'knss_aptitude'

mysql = MySQL(app)


#-----------------------GENERAL ROUTES-----------------------------


@app.route('/')
@app.route('/home')
def home():    
    if 'loggedin' in session:
        if session['role_id'] == '1':
            return redirect(url_for('student_dashboard'))
        else:
            return redirect(url_for('staff_dashboard'))
    return render_template('home.html')

@app.route('/login', methods = ['POST','GET'])
def login():
    msg = ''
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        email = request.form['email']
        password = request.form['password']
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM users WHERE email = %s AND password = %s',(email,password,))
        account = cursor.fetchone()
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['user_id'] = account[0]
            session['email'] = account[1]
            session['fname'] = account[3]
            session['lname'] = account[4]
            session['mobile'] = account[5]
            session['role_id'] = account[6]
            # Redirect to home page
            return redirect(url_for('home'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
    return render_template('login.html',msg=msg)

@app.route('/logout')
def logout():
    # Remove session data to log the user out
    session.pop('loggedin', None)
    session.pop('user_id', None)
    session.pop('email', None)
    session.pop('fname', None)
    session.pop('lname', None)
    session.pop('mobile', None)
    session.pop('role_id', None)
    # Redirect to home page
    return redirect(url_for('home'))

@app.route('/register', methods = ['POST','GET'])
def register():
    msg = ''
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        email = request.form['email']
        fname = request.form['firstname']
        lname = request.form['lastname']
        mobile = request.form['mobile']
        password = request.form['password']
        role = request.form['role'] 
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM users WHERE email = %s', (email,))
        account = cursor.fetchone()
        if account:
            msg = 'Account already exists!'
        # elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
        #     msg = 'Invalid email address!'
        elif not role or not password or not email:
            msg = 'Please fill out the form!'
        else:
            cursor.execute('INSERT INTO users VALUES (%s, %s, %s, %s, %s, %s, %s)', ('', email, password, fname, lname, mobile, role))
            mysql.connection.commit()
            msg = 'You have successfully registered!'
            return redirect(url_for('login'))
    elif request.method == 'POST':
        msg = 'Please fill out the form!'
    return render_template('register.html',msg=msg)



#-----------------------STAFF ROUTES-----------------------------



@app.route('/staff_dashboard')
def staff_dashboard():
    today = datetime.date.today()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    cursor.execute('SELECT * FROM exam')
    exams = cursor.fetchall()
    return render_template('staff/dashboard.html', subjects=subjects, exams=exams, today=today)

@app.route('/create_subject_form')
def create_subject_form():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    return render_template('staff/create_subject_form.html', subjects=subjects)

@app.route('/create_subject', methods = ['POST','GET'])
def create_subject():
    msg = ''
    if request.method == 'POST' and 'subject_name' in request.form:
        subject_name = request.form['subject_name']
        if not subject_name:
            msg = 'Please fill out the form!'
        else:
            subject_desc = request.form['subject_desc']
            subject_code = random.randint(100,1000000)

            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO subject VALUES (%s, %s, %s)', (subject_code, subject_name, subject_desc))
            mysql.connection.commit()
            msg = 'You have successfully created a subject!'
            return redirect(url_for('create_subject_form'))
    elif request.method == 'POST':
        msg = 'Please fill out the form!'
    return redirect(url_for('create_subject_form'))

@app.route('/create_exam_auto_form')
def create_exam_auto_form():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    return render_template('staff/create_exam_auto_form.html', subjects=subjects)

@app.route('/create_automatic_exam', methods = ['POST','GET'])
def create_automatic_exam():
    msg = ''
    if request.method == 'POST' and 'exam_url' in request.form:
        url = request.form['exam_url']
        if not url:
            msg = 'Please fill out the form!'
        else:
            initiate_scraping(url)
            exam1 = getQuestionAndOption()
            subject_id = request.form['subject']
            e_code = random.randint(100,1000000)
            e_title = request.form['exam_title']
            total_num_of_questions = len(exam1[1])
            total_marks = total_num_of_questions * 2
            time_limit = f"{total_num_of_questions * 2}00"
            print(time_limit)
            created_by = session['user_id']
            start_date = datetime.date.today()
            end_date = start_date+datetime.timedelta(20)
            

            #check if same exam is there or not


            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO exam VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', (e_code, e_title, '', time_limit, total_num_of_questions, total_marks, start_date, end_date, created_by, subject_id))
            mysql.connection.commit()
            for ques,options in exam1[0].items():
                q_id = random.randint(100,1000000)
                q_desc = ques
                q_type = 'O'
                marks = 2
                cursor = mysql.connection.cursor()
                cursor.execute('INSERT INTO question VALUES (%s, %s, %s, %s, %s)', (q_id, q_desc, q_type, marks, e_code))
                mysql.connection.commit()
                for option in options:
                    o_id = random.randint(100,1000000)
                    o_desc = option
                    is_correct = '0'
                    if option[0] == exam1[1][ques][0]:
                        is_correct = '1'
                    # print(option,option[0],exam1[1][ques][0],option[0] == exam1[1][ques][0],is_correct)
                    cursor = mysql.connection.cursor()
                    cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id, o_desc, is_correct, q_id))
                    mysql.connection.commit()                    
            msg = 'You have successfully created exam!'
            return redirect(url_for('staff_dashboard'))
    elif request.method == 'POST':
        msg = 'Please fill out the form!'
    return redirect(url_for('staff_dashboard'))

@app.route('/staff_profile')
def staff_profile():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM users WHERE user_id = %s',(session['user_id'],))
    profile_staff_user = cursor.fetchall()
    return render_template('staff/profile.html', profile_staff_user=profile_staff_user)

@app.route('/my_exams')
def my_exams():
    today = datetime.date.today()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    cursor.execute('SELECT * FROM exam WHERE user_id = %s',(session['user_id'],))
    exams = cursor.fetchall()
    return render_template('staff/dashboard.html', subjects=subjects, exams=exams, today=today)



#-----------------------STUDENT ROUTES-----------------------------


@app.route('/student_dashboard')
def student_dashboard():
    today = datetime.date.today()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    cursor.execute('SELECT * FROM exam')
    exams = cursor.fetchall()
    return render_template('student/dashboard.html', subjects=subjects, exams=exams, today=today)

@app.route('/student_profile')
def student_profile():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM users WHERE user_id = %s',(session['user_id'],))
    profile_student_user = cursor.fetchall()
    return render_template('student/profile.html', profile_student_user=profile_student_user)

@app.route('/join_exam')
def join_exam():
    return render_template('student/join_exam.html')

@app.route('/completed_exams')
def completed_exams():
    today = datetime.date.today()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exams_given WHERE user_id = %s',(session['user_id'],))
    exams_given = cursor.fetchall()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    cursor.execute('SELECT * FROM exam')
    exams = cursor.fetchall()
    return render_template('student/completed_exams.html', exams_given=exams_given, subjects=subjects, exams=exams, today=today)

@app.route('/results')
def results():
    return render_template('student/results.html')

@app.route('/exam/<int:exam_code>', methods=["GET"])
def get_exam(exam_code):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exam WHERE exam_code = %s', (exam_code,))
    exam_info = cursor.fetchone()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM question WHERE exam_code = %s ORDER BY RAND()', (exam_code,))
    questions = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM options ORDER BY RAND()')
    options = cursor.fetchall()
    return render_template('student/attempt_exam.html', exam_info=exam_info, questions=questions, options=options)

@app.route('/submit_exam',methods=["GET","POST"])
def submit_exam():
    if request.method == 'POST':

        #check if this exists in exams_given table

        e_code = request.form['exam_code']
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM question WHERE exam_code = %s ORDER BY RAND()',(e_code,))
        questions = cursor.fetchall()
        tot_marks=0
        today = datetime.date.today()
        attempts=1


        cursor = mysql.connection.cursor()
        for q in questions:
            rand_opt_id = random.randint(100,1000000)
            selected_option_id = request.form[str(q[0])]
            cursor = mysql.connection.cursor()
            cursor.execute('SELECT * FROM options WHERE option_id = %s',(selected_option_id,))
            this_option = cursor.fetchone()
            print(selected_option_id,str(q[0]))
            if this_option[2] == '1':
                tot_marks += 2
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO selected_options VALUES (%s, %s, %s)',(rand_opt_id,session['user_id'],selected_option_id,))
            mysql.connection.commit()
        
        cursor = mysql.connection.cursor()
        cursor.execute('INSERT INTO exams_given VALUES (%s, %s, %s, %s, %s)',(e_code,session['user_id'],tot_marks,attempts,today,))
        mysql.connection.commit()
        

        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM exam WHERE exam_code = %s',(e_code,))
        exam_info = cursor.fetchone()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM exams_given WHERE exam_code = %s',(e_code,))
        exam_info = cursor.fetchone()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM question WHERE exam_code = %s',(e_code,))
        questions = cursor.fetchall()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM options')
        options = cursor.fetchall()
        return render_template('student/results.html',)
    else:
        return redirect(url_for('home'))
    
@app.route('/get_exam_by_code',methods=["GET","POST"])
def get_exam_by_code():
    e_code = request.form['exam_code']
    return redirect (url_for('get_exam',exam_code=e_code))
    
if __name__ == '__main__':
    app.run(debug=True)


