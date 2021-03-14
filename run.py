from flask import *
from flask_mysqldb import MySQL
import os

app = Flask(__name__)

app.secret_key = 'knss'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'knss_aptitude'

mysql = MySQL(app)

@app.route('/')
@app.route('/home')
def home():
    if 'loggedin' in session:
        if session['role_id'] == '1':
            return redirect(url_for('student_dashboard'))
        else:
            return redirect(url_for('staff_dashboard'))
    return render_template('home.html')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/student_dashboard')
def student_dashboard():
    return render_template('student/dashboard.html')

@app.route('/staff_dashboard')
def staff_dashboard():
    return render_template('staff/dashboard.html')

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
            session['email'] = account[1]
            session['role_id'] = account[4]
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
   session.pop('email', None)
   session.pop('role_id', None)
   # Redirect to home page
   return redirect(url_for('home'))

@app.route('/register', methods = ['POST','GET'])
def register():
    msg = ''
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        email = request.form['email']
        name = request.form['name']
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
            cursor.execute('INSERT INTO users VALUES (%s, %s, %s, %s, %s)', ('', email, password, name, role))
            mysql.connection.commit()
            msg = 'You have successfully registered!'
            return redirect(url_for('login'))
    elif request.method == 'POST':
        msg = 'Please fill out the form!'
    return render_template('register.html',msg=msg)

if __name__ == '__main__':
    app.run(debug=True)