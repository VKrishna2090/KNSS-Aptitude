import os
import time
import random
import calendar
import datetime
from flask import *
from flask_mysqldb import MySQL
from flask_mail import Mail, Message
from werkzeug.utils import secure_filename
from separation_quest_ans import getQuestionAndOption
from SanFoundry_Scraped import initiate_scraping, scrape


STAFF_UPLOAD_FOLDER = 'static\\staff_uploads'
STUDENT_UPLOAD_FOLDER = 'static\\student_uploads'
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__)

app.secret_key = 'knss'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'knss_aptitude'
app.config['STAFF_UPLOAD_FOLDER'] = STAFF_UPLOAD_FOLDER
app.config['STUDENT_UPLOAD_FOLDER'] = STUDENT_UPLOAD_FOLDER

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'knss.aptitude@gmail.com'
app.config['MAIL_PASSWORD'] = 'knss12345!'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True

mysql = MySQL(app)
mail = Mail(app)

#---------------------------------------------GENERAL Methods------------------------------------------------

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

#---------------------------------------------GENERAL ROUTES------------------------------------------------


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
            flash('You are successfully logged in','success')
            return redirect(url_for('home'))
        else:
            # Account doesnt exist or username/password incorrect
            flash('Incorrect username/password!','danger')
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
            flash('Account already exists','danger')
        elif not role or not password or not email:
            flash('Fill the form!','danger')
        else:
            cursor.execute('INSERT INTO users VALUES (%s, %s, %s, %s, %s, %s, %s)', ('', email, password, fname, lname, mobile, role))
            mysql.connection.commit()
            flash('You have successfully registered!','success')
            return redirect(url_for('login'))
    elif request.method == 'POST':
        flash('Fill the form!','danger')
    return render_template('register.html',msg=msg)



#---------------------------------------------STAFF ROUTES------------------------------------------------


@app.route('/staff_dashboard')
def staff_dashboard():
    today = datetime.date.today()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    cursor.execute('SELECT * FROM exam WHERE user_id = %s',(session['user_id'],))
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
            flash('Fill the form!','danger')
        else:
            subject_desc = request.form['subject_desc']
            subject_code = random.randint(100,1000000)
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO subject VALUES (%s, %s, %s)', (subject_code, subject_name, subject_desc))
            mysql.connection.commit()
            flash('Subject created successfully','success')
            return redirect(url_for('create_subject_form'))
    elif request.method == 'POST':
        flash('Fill the form!','danger')
    return redirect(url_for('create_subject_form'))

@app.route('/create_exam_auto_form')
def create_exam_auto_form():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    return render_template('staff/create_exam_auto_form.html', subjects=subjects)

@app.route('/create_exam_manual_form')
def create_exam_manual_form():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    return render_template('staff/create_exam_manual_form.html', subjects=subjects)


@app.route('/create_automatic_exam', methods = ['POST','GET'])
def create_automatic_exam():
    msg = ''
    if request.method == 'POST' and 'exam_url' in request.form:
        url = request.form['exam_url']
        if not url:
            flash('Fill the form!','danger')
        else:
            initiate_scraping(url)
            exam1 = getQuestionAndOption()
            subject_id = request.form['subject']
            e_code = random.randint(100,1000000)
            e_title = request.form['exam_title']
            total_num_of_questions = len(exam1[1])
            total_marks = total_num_of_questions * 2
            time_limit = f"{total_num_of_questions * 2}00"
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
                    cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id, o_desc[2:].strip(), is_correct, q_id))
                    mysql.connection.commit()                    
            flash('Exam created!','success')
            return redirect(url_for('staff_dashboard'))
    elif request.method == 'POST':
        flash('Fill the form!','danger')
    return redirect(url_for('staff_dashboard'))

@app.route('/create_manual_exam', methods = ['POST','GET'])
def create_manual_exam():
    msg = ''
    if request.method == 'POST' and ('exam_title' and 'no_of_objective_questions' and 'exam_time_limit' and 'exam_total_marks') in request.form:
        title = request.form['exam_title']
        time_limit = request.form['exam_time_limit'] + "00"
        if 'exam_instructions' in request.form:
            instructions = request.form['exam_instructions']
        else:
            instructions = ''
        total_marks = request.form['exam_total_marks']
         
        no_of_obj_q = request.form['no_of_objective_questions']
        no_of_sub_q = request.form['no_of_subjective_questions']
        no_of_questions = int(no_of_obj_q) + int(no_of_sub_q)

        subject_id = request.form['subject']
        exam_code = random.randint(100,1000000)
        start_date = request.form['exam_start_date']
        end_date = request.form['exam_end_date']
        cursor = mysql.connection.cursor()
        cursor.execute('INSERT INTO exam VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', (exam_code, title, instructions, time_limit, no_of_questions, total_marks, start_date, end_date, session['user_id'],subject_id,))
        mysql.connection.commit()  
        return redirect(url_for('input_questions',q_no=1,tot_obj_q=no_of_obj_q,tot_sub_q=no_of_sub_q,e_code=exam_code))
    elif request.method == 'POST':
        flash('Fill the form!','danger')
        return redirect(url_for('create_exam_manual_form'))

@app.route('/input_questions/<int:q_no>/<int:tot_obj_q>/<int:tot_sub_q>/<int:e_code>',methods=["GET","POST"])
def input_questions(q_no,tot_obj_q,tot_sub_q,e_code):
    if tot_obj_q == 0:
        return redirect(url_for('input_subjective_questions',q_no=1,tot_sub_q=tot_sub_q,e_code=e_code))
    if q_no == 1 and q_no <= tot_obj_q:
        return render_template('staff/create_manual_exam_content.html', q_no=q_no,tot_obj_q=tot_obj_q,tot_sub_q=tot_sub_q,exam_code=e_code)
    elif q_no <= tot_obj_q:
        if request.method == 'POST' and 'question' in request.form:
            q_id = random.randint(100,1000000)
            q_desc = request.form['question']
            q_type = 'O'
            marks = request.form['marks']
            exam_code = request.form['exam_code']
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO question VALUES (%s, %s, %s, %s, %s)', (q_id, q_desc, q_type, marks, e_code,))
            mysql.connection.commit()
            o_id1 = random.randint(100,1000000)
            o_desc1 = request.form['correct_option']
            is_correct1 = '1'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id1, o_desc1, is_correct1, q_id,))
            mysql.connection.commit()
            o_id2 = random.randint(100,1000000)
            o_desc2 = request.form['option_1']
            is_correct2 = '0'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id2, o_desc2, is_correct2, q_id,))
            mysql.connection.commit()
            o_id3 = random.randint(100,1000000)
            o_desc3 = request.form['option_2']
            is_correct3 = '0'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id3, o_desc3, is_correct3, q_id,))
            mysql.connection.commit()
            o_id4 = random.randint(100,1000000)
            o_desc4 = request.form['option_3']
            is_correct4 = '0'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id4, o_desc4, is_correct4, q_id,))
            mysql.connection.commit()
        return render_template('staff/create_manual_exam_content.html', q_no=q_no,tot_obj_q=tot_obj_q,tot_sub_q=tot_sub_q,exam_code=e_code)
    else:
        if request.method == 'POST' and 'question' in request.form:
            q_id = random.randint(100,1000000)
            q_desc = request.form['question']
            q_type = 'O'
            marks = request.form['marks']
            exam_code = request.form['exam_code']
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO question VALUES (%s, %s, %s, %s, %s)', (q_id, q_desc, q_type, marks, e_code,))
            mysql.connection.commit()
            o_id1 = random.randint(100,1000000)
            o_desc1 = request.form['correct_option']
            is_correct1 = '1'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id1, o_desc1, is_correct1, q_id,))
            mysql.connection.commit()
            o_id2 = random.randint(100,1000000)
            o_desc2 = request.form['option_1']
            is_correct2 = '0'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id2, o_desc2, is_correct2, q_id,))
            mysql.connection.commit()
            o_id3 = random.randint(100,1000000)
            o_desc3 = request.form['option_2']
            is_correct3 = '0'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id3, o_desc3, is_correct3, q_id,))
            mysql.connection.commit()
            o_id4 = random.randint(100,1000000)
            o_desc4 = request.form['option_3']
            is_correct4 = '0'
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO options VALUES (%s, %s, %s, %s)', (o_id4, o_desc4, is_correct4, q_id,))
            mysql.connection.commit()
        #flash('Exam created successfully!','success')
        return redirect(url_for('input_subjective_questions',q_no=1,tot_sub_q=tot_sub_q,e_code=exam_code)) 
        #return redirect(url_for('home'))

#input subjective q
@app.route('/input_subjective_questions/<int:q_no>/<int:tot_sub_q>/<int:e_code>',methods=["GET","POST"])
def input_subjective_questions(q_no,tot_sub_q,e_code):
    if tot_sub_q == 0:
        flash('Exam created successfully!','success')
        return redirect(url_for('home'))
    if q_no == 1 and q_no <= tot_sub_q:
        
        return render_template('staff/create_subjective_exam_form.html', q_no=q_no,tot_sub_q=tot_sub_q,exam_code=e_code)
    elif q_no <= tot_sub_q:
        if request.method == 'POST' and 'question' in request.form:
            q_id = random.randint(100,1000000)
            q_desc = request.form['question']
            q_type = 'S'
            marks = request.form['marks']
            exam_code = request.form['exam_code']
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO question VALUES (%s, %s, %s, %s, %s)', (q_id, q_desc, q_type, marks, e_code,))
            mysql.connection.commit()
            sol_id = random.randint(100,1000000)
            subjective_solution = request.files['subjective_solution']
            if subjective_solution.filename == '':
                flash('Solution file not uploaded!','danger')
                return redirect(request.url)
            if subjective_solution and allowed_file(subjective_solution.filename):
                filename = secure_filename(subjective_solution.filename)
                gmt = time.gmtime()
                ts = calendar.timegm(gmt)
                fileNameToStore = str(ts) + '_' + filename
                cursor = mysql.connection.cursor()
                cursor.execute('INSERT INTO subjective_solution VALUES (%s, %s, %s)', (sol_id, fileNameToStore, q_id,))
                mysql.connection.commit()
                subjective_solution.save(os.path.join(app.config['STAFF_UPLOAD_FOLDER'], fileNameToStore))
        return render_template('staff/create_subjective_exam_form.html', q_no=q_no,tot_sub_q=tot_sub_q,exam_code=e_code)
    else:
        if request.method == 'POST' and 'question' in request.form:
            q_id = random.randint(100,1000000)
            q_desc = request.form['question']
            q_type = 'S'
            marks = request.form['marks']
            exam_code = request.form['exam_code']
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO question VALUES (%s, %s, %s, %s, %s)', (q_id, q_desc, q_type, marks, e_code,))
            mysql.connection.commit()
            sol_id = random.randint(100,1000000)
            subjective_solution = request.files['subjective_solution']
            if subjective_solution.filename == '':
                flash('Solution file not uploaded!','danger')
                return redirect(request.url)
            if subjective_solution and allowed_file(subjective_solution.filename):
                filename = secure_filename(subjective_solution.filename)
                gmt = time.gmtime()
                ts = calendar.timegm(gmt)
                fileNameToStore = str(ts) + '_' + filename
                cursor = mysql.connection.cursor()
                cursor.execute('INSERT INTO subjective_solution VALUES (%s, %s, %s)', (sol_id, fileNameToStore, q_id,))
                mysql.connection.commit()
                subjective_solution.save(os.path.join(app.config['STAFF_UPLOAD_FOLDER'], fileNameToStore))
        flash('Exam created successfully!','success')
        return redirect(url_for('home'))
        


@app.route('/staff_profile')
def staff_profile():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM users WHERE user_id = %s',(session['user_id'],))
    profile_staff_user = cursor.fetchall()
    return render_template('staff/profile.html', profile_staff_user=profile_staff_user)

@app.route('/staff_profile_update', methods = ['POST','GET'])
def staff_profile_update():
    if request.method == 'POST' and 'email' in request.form:
        email = request.form['email']
        fname = request.form['fname']
        lname = request.form['lname']
        mobile = request.form['mobile']
        if not email or not fname or not lname or not mobile:
            flash('Form field cannot be empty!','danger')
        else:
            cursor = mysql.connection.cursor()
            cursor.execute('UPDATE users SET email = %s, fname = %s, lname = %s, mobile_number = %s WHERE user_id = %s' , ( email, fname, lname, mobile, session['user_id'],))
            mysql.connection.commit()
            session['email'] = email
            session['fname'] = fname
            session['lname'] = lname
            session['mobile'] = mobile
            flash('Profile Updated!','success')
            return redirect(url_for('staff_profile'))
    elif request.method == 'POST':
        flash('No changes made.','danger')
    return render_template('staff/profile.html')

@app.route('/view_exam/<int:e_code>',methods=["GET"])
def view_exam(e_code):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exam WHERE exam_code = %s AND user_id = %s',(e_code,session['user_id'],))
    exam_info = cursor.fetchone()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM question WHERE exam_code = %s',(e_code,))
    questions = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM options ORDER BY option_description')
    options = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subjective_solution')
    subjective_solutions = cursor.fetchall()
    return render_template('staff/view_exam.html',exam_info=exam_info,questions=questions,options=options,subjective_solutions=subjective_solutions)

@app.route('/edit_exam/<int:e_code>',methods=["GET"])
def edit_exam(e_code):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exam WHERE exam_code = %s AND user_id = %s',(e_code,session['user_id'],))
    exam_info = cursor.fetchone()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    return render_template('staff/edit_exam.html',exam_info=exam_info,subjects=subjects)

@app.route('/update_exam_details/<int:e_code>', methods = ['POST','GET'])
def update_exam_details(e_code):
    if request.method == 'POST' and 'exam_title' in request.form:
        exam_title = request.form['exam_title']
        exam_instructions = request.form['exam_instructions']
        subject = request.form['subject']
        time_limit = request.form['exam_time_limit']
        total_num_of_questions = request.form['exam_no_of_questions']
        total_marks = request.form['exam_total_marks']
        start_date = request.form['exam_start_date']
        end_date = request.form['exam_end_date']
        if not exam_title or not time_limit or not total_num_of_questions or not total_marks or not start_date or not end_date:
            flash('Form field cannot be empty!','danger')
        else:
            cursor = mysql.connection.cursor()
            cursor.execute('UPDATE exam SET exam_title = %s, exam_instructions = %s, time_limit = %s, total_number_of_questions = %s, total_marks = %s, start_date = %s, end_date = %s, subject_id = %s WHERE exam_code = %s AND user_id = %s' , ( exam_title, exam_instructions, time_limit, total_num_of_questions, total_marks, start_date, end_date, subject, e_code, session['user_id'],))
            mysql.connection.commit()
            flash('Exam Details Updated!','success')
            return redirect(url_for('staff_dashboard'))
    elif request.method == 'POST':
        flash('No changes made.','danger')
    return render_template('staff/edit_exam.html')

@app.route('/delete_exam/<int:e_code>',methods=["GET"])
def delete_exam(e_code):
    cursor1 = mysql.connection.cursor()
    cursor1.execute('SELECT * FROM question WHERE exam_code = %s',(e_code,))
    questions = cursor1.fetchall()
    for q in questions:
        cursor6 = mysql.connection.cursor()
        cursor6.execute('SELECT * FROM options WHERE question_id = %s',(q[0],))
        options = cursor6.fetchall()
        for op in options:
            cursor7 = mysql.connection.cursor()
            cursor7.execute('DELETE FROM selected_options WHERE option_id = %s',(op[0],))
            mysql.connection.commit()
        cursor2 = mysql.connection.cursor()
        cursor2.execute('DELETE FROM options WHERE question_id = %s',(q[0],))
        mysql.connection.commit()
        cursor7 = mysql.connection.cursor()
        cursor7.execute('DELETE FROM subjective_solution WHERE question_id = %s',(q[0],))
        mysql.connection.commit()
        cursor10 = mysql.connection.cursor()
        cursor10.execute('DELETE FROM subjective_student_solution WHERE question_id = %s',(q[0],))
        mysql.connection.commit()
    cursor3 = mysql.connection.cursor()
    cursor3.execute('DELETE FROM question WHERE exam_code = %s',(e_code,))
    mysql.connection.commit()
    cursor4 = mysql.connection.cursor()
    cursor4.execute('DELETE FROM exams_given WHERE exam_code = %s',(e_code,))
    mysql.connection.commit()
    cursor5 = mysql.connection.cursor()
    cursor5.execute('DELETE FROM exam WHERE exam_code = %s',(e_code,))
    mysql.connection.commit()
    
    return redirect('/home')

@app.route('/view_responses/<int:e_code>',methods=["GET"])
def view_responses(e_code):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exam WHERE exam_code = %s',(e_code,))
    exam_info = cursor.fetchone()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exams_given INNER JOIN users WHERE users.user_id = exams_given.user_id AND exam_code = %s',(e_code,))
    exams_given = cursor.fetchall()
    return render_template('staff/view_responses.html',exam_info=exam_info,exams_given=exams_given)

@app.route('/get_responses/<int:e_code>/<int:user_id>',methods=["GET"])
def get_student_responses(e_code, user_id):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exam WHERE exam_code = %s',(e_code,))
    exam_info = cursor.fetchone()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM selected_options WHERE user_id = %s',(user_id,))
    selected_options = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exams_given WHERE exam_code = %s AND user_id = %s',(e_code,user_id,))
    exams_given = cursor.fetchone()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM question WHERE exam_code = %s',(e_code,))
    questions = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM options')
    options = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subjective_student_solution WHERE user_id = %s',(user_id,))
    subjective_solutions = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM users WHERE user_id = %s',(user_id,))
    student = cursor.fetchone()
    #print(selected_options)
    return render_template('staff/student_result.html',student=student,subjective_solutions=subjective_solutions,selected_options=selected_options,exam_info=exam_info,exams_given=exams_given,questions=questions,options=options)

@app.route('/subjects_exams/<int:s_id>',methods=["GET"])
def subjects_exams(s_id):
    today = datetime.date.today()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject WHERE subject_id = %s',(s_id,))
    subjects = cursor.fetchone()
    cursor.execute('SELECT * FROM exam WHERE subject_id = %s AND user_id = %s',(s_id,session['user_id'],))
    exams = cursor.fetchall()
    return render_template('staff/subject_exams.html', subjects=subjects, exams=exams, today=today)

@app.route('/unchecked_exams')
def unchecked_exams():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subject')
    subjects = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exams_given, users, exam WHERE users.user_id = exams_given.user_id AND exam.exam_code = exams_given.exam_code AND is_checked = 0 AND exam.user_id = %s',(session['user_id'],))
    exams_given = cursor.fetchall()
    return render_template('staff/show_unchecked_exams.html',subjects=subjects,exams_given=exams_given)

@app.route('/store_marks',methods=["GET","POST"])
def store_marks():
    if request.method == 'POST' and 'marks' in request.form:
        exam_code = request.form['exam_code']
        marks = request.form['marks']
        student_id = request.form['user_id']
        is_checked = 1
        if not marks:
            flash('Form field cannot be empty!','danger')
        else:
            cursor = mysql.connection.cursor()
            cursor.execute('UPDATE exams_given SET marks = %s, is_checked = %s WHERE exam_code = %s AND user_id = %s' , ( marks, is_checked,exam_code,student_id,))
            mysql.connection.commit()
            cursor = mysql.connection.cursor()
            cursor.execute('SELECT * FROM exam WHERE exam_code = %s' , (exam_code,))
            exam = cursor.fetchone()
            cursor = mysql.connection.cursor()
            cursor.execute('SELECT * FROM users WHERE user_id = %s' , (student_id,))
            student = cursor.fetchone()

            msg = Message('Score released for  '+exam[1], sender = 'knss.aptitude@gmail.com', recipients = [student[1]])
            msg.body = f"""Hello {student[3]},
Assessment for {exam[1]} has been completed. 
You have received {marks} out of {int(exam[5])}.
Visit website for more details."""
            mail.send(msg)

            flash('Marks Updated!','success')
            return redirect(url_for('home'))
    elif request.method == 'POST':
        flash('No changes made.','danger')
    return redirect(url_for('unchecked_exams'))


#---------------------------------------------STUDENT ROUTES------------------------------------------------


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

@app.route('/student_profile_update', methods = ['POST','GET'])
def student_profile_update():
    if request.method == 'POST' and 'email' in request.form:
        email = request.form['email']
        fname = request.form['fname']
        lname = request.form['lname']
        mobile = request.form['mobile']
        if not email or not fname or not lname or not mobile:
            flash('Form field cannot be empty!','danger')
        else:
            cursor = mysql.connection.cursor()
            cursor.execute('UPDATE users SET email = %s, fname = %s, lname = %s, mobile_number = %s WHERE user_id = %s' , ( email, fname, lname, mobile, session['user_id'],))
            mysql.connection.commit()
            session['email'] = email
            session['fname'] = fname
            session['lname'] = lname
            session['mobile'] = mobile
            flash('Profile Updated!','success')
            return redirect(url_for('student_profile'))
    elif request.method == 'POST':
        flash('No changes made','danger')
    return render_template('student/profile.html')


@app.route('/update/<int:user_id>', methods = ['POST','GET'])
def update(user_id):
    msg = ''
    cursor = mysql.connection.cursor()
    #cursor.execute('SELECT * FROM users WHERE user_id = %s', (user_id,))
    #update = cursor.fetchone()
    if request.method == 'POST':
        email = request.form['email']
        fname = request.form['fname']
        lname = request.form['lname']
        mobile = request.form['mobile']
        cursor.execute('UPDATE users SET email = %s, fname = %s, lname = %s, mobile_number = %s WHERE user_id = %s', (email, fname, lname, mobile, user_id))
        mysql.connection.commit()
        flash('Changes made and successfully saved!','success')
    else:
        flash('No changes made!','info')
    return render_template('student/profile.html', msg=msg)

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
    cursor.execute('SELECT * FROM exams_given WHERE exam_code = %s AND user_id = %s',(exam_code,session['user_id'],))
    exams_given = cursor.fetchone()
    if exams_given:
        flash('You have already attempted the exam', 'danger')
        return redirect('/home')
    else:
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
        e_code = request.form['exam_code']
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM question WHERE exam_code = %s ORDER BY RAND()',(e_code,))
        questions = cursor.fetchall()
        tot_marks=0
        today = datetime.date.today()
        attempts=1
        cursor = mysql.connection.cursor()
        for q in questions:
            if q[2] == 'O':
                rand_opt_id = random.randint(100,1000000)
                selected_option_id = request.form[str(q[0])]
                cursor = mysql.connection.cursor()
                cursor.execute('SELECT * FROM options WHERE option_id = %s',(selected_option_id,))
                this_option = cursor.fetchone()
                #print(selected_option_id,str(q[0]))
                if this_option[2] == '1':
                    tot_marks += q[3]
                cursor = mysql.connection.cursor()
                cursor.execute('INSERT INTO selected_options VALUES (%s, %s, %s)',(rand_opt_id,session['user_id'],selected_option_id,))
                mysql.connection.commit()
            elif q[2] == 'S':
                sol_id = random.randint(100,1000000)
                subjective_solution = request.files[str(q[0])]
                if subjective_solution.filename == '':
                    flash('Solution file not uploaded!','danger')
                    return redirect(request.url)
                if subjective_solution and allowed_file(subjective_solution.filename):
                    filename = secure_filename(subjective_solution.filename)
                    gmt = time.gmtime()
                    ts = calendar.timegm(gmt)
                    fileNameToStore = str(ts) + '_' + filename
                    cursor = mysql.connection.cursor()
                    cursor.execute('INSERT INTO subjective_student_solution VALUES (%s, %s, %s, %s)', (sol_id, fileNameToStore, q[0], session['user_id'],))
                    mysql.connection.commit()
                    subjective_solution.save(os.path.join(app.config['STUDENT_UPLOAD_FOLDER'], fileNameToStore))
        cursor = mysql.connection.cursor()
        cursor.execute('INSERT INTO exams_given VALUES (%s, %s, %s, %s, %s, %s)',(e_code,session['user_id'],tot_marks,attempts,today,0,))
        mysql.connection.commit()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM exam WHERE exam_code = %s',(e_code,))
        exam_info = cursor.fetchone()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM selected_options WHERE user_id = %s',(session['user_id'],))
        selected_options = cursor.fetchall()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM exams_given WHERE exam_code = %s AND user_id = %s',(e_code,session['user_id']))
        exams_given = cursor.fetchone()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM question WHERE exam_code = %s',(e_code,))
        questions = cursor.fetchall()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM subjective_student_solution WHERE user_id = %s',(session['user_id'],))
        subjective_solutions = cursor.fetchall()
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM options')
        options = cursor.fetchall()
        return render_template('student/results.html',selected_options=selected_options,subjective_solutions=subjective_solutions,exam_info=exam_info,exams_given=exams_given,questions=questions,options=options)
    else:
        return redirect(url_for('home'))
    
@app.route('/get_exam_by_code',methods=["GET","POST"])
def get_exam_by_code():
    e_code = request.form['exam_code']
    return redirect (url_for('get_exam',exam_code=e_code))



@app.route('/get_responses/<int:e_code>',methods=["GET"])
def get_responses(e_code):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exam WHERE exam_code = %s',(e_code,))
    exam_info = cursor.fetchone()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM selected_options WHERE user_id = %s',(session['user_id'],))
    selected_options = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM exams_given WHERE exam_code = %s AND user_id = %s',(e_code,session['user_id']))
    exams_given = cursor.fetchone()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM question WHERE exam_code = %s',(e_code,))
    questions = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM subjective_student_solution WHERE user_id = %s',(session['user_id'],))
    subjective_solutions = cursor.fetchall()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM options')
    options = cursor.fetchall()
    return render_template('student/results.html',selected_options=selected_options,subjective_solutions=subjective_solutions,exam_info=exam_info,exams_given=exams_given,questions=questions,options=options)


if __name__ == '__main__':
    app.run(debug=True)