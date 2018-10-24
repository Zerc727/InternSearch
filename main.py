import pymysql #used to connect SQL DB to python and run queries
import getpass #Used to get secure password for 
import signal #Used for Ctrl-C Event Handle
from flask import Flask, render_template, session, request, redirect, url_for
pswd = getpass.getpass('SQL Password: ')
db = pymysql.connect(host='35.190.161.194', user='root', password=pswd, db='lotr')
app = Flask(__name__)

#Notes:
#Old debug command in script has been deprecated. Debug now set in run scripts

#########################
####Below is untested####
#########################

#Below is the connection settings for the database. After prompting for the password it trys to connect
c = db.cursor()

#Below will run commands on Ctrl-C. Used to close the database
def sigint_handler(signum, frame):
	print("Closing Database")
	db.close()
	exit()

signal.signal(signal.SIGINT, sigint_handler)

#########################
#########################
#########################

app.secret_key = b'_5#y2L"F4Q8z\n\xec]/' #Used for the session

#Main route, root of application
@app.route('/')
def index():
	#render_templates looks in "template" folder in root of project for html documents
	return render_template('index.html')

@app.route('/splash')
def splash():
	#if session.get('logged_in') == True:
	#	return 'You are logged in'
	#return 'You are not logged in'
	return redirect(url_for('index'))

@app.route('/signup')
def signup():
	return render_template('signup.html')

@app.route('/login')
def login():
	#session['logged_in'] = True
	#return redirect(url_for('splash'))
	return render_template('login.html')

@app.route('/logout')
def logout():
	#session.pop('logged_in', None)
	#return redirect(url_for('splash'))
	return redirect(url_for('index'))