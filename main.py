from flask import Flask, render_template
app = Flask(__name__)
#Old debug command in script has been deprecated. Debug now set in run scripts

#Main route, root of application
@app.route('/')
def index():
	#render_templates looks in "template" folder in root of project for html documents
	return render_template('index.html')