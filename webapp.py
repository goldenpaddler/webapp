#!/home/programmer/webapp/venv/bin/python

from flask import Flask
from flask import render_template,request
from flask import json

webapp=Flask(__name__)
webapp.config['DEBUG']=True

@webapp.route('/')
def main():
    return render_template('index.html')

@webapp.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

"""
@webapp.route('/signUp',methods=['POST'])
def signUp():
    #read the posted values
    _name=request.form['inputName']
    _email=request.form['inputEmail']
    _password=request.form['inputPassword']

if _name and _email and _password:
    return json.dump({'html':'<span>All fields are good!</span>'})
else:
    return json.dump({'html':'<span>Enter the required fields</span>'})
"""
if __name__=="__main__":
    webapp.run()
