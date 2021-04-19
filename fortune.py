#!/usr/bin/env python
from flask import Flask
import subprocess
app = Flask(__name__)


@app.route('/')
def hello_world():
    hostname =  subprocess.check_output(['hostname']).decode("utf-8")
    fortune = subprocess.check_output(['/usr/games/fortune']).decode("utf-8")
    return "<div>"+hostname+": "+fortune+"</div>"

if __name__ == '__main__':
    app.run(host='0.0.0.0')
