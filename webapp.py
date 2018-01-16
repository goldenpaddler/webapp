#!/home/programmer/webapp/venv/bin/python

from flask import Flask
from flask import render_template

webapp=Flask(__name__)
webapp.config['DEBUG']=True

@webapp.route('/')
def main():
    return render_template('index.html')

if __name__=="__main__":
    webapp.run()
