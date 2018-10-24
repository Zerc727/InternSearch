from flask import Flask, render_template, session, request, redirect, url_for
app = Flask(__name__)
#Old debug command in script has been deprecated. Debug now set in run scripts

app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

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