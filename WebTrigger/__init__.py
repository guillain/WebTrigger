# Target: app init 
# Version: 0.1
# Date: 2017/01/04
# Author: Guillain (guillain@gmail.com)
# Copyright 2017 GPL - Guillain

from flask import Flask, request, render_template, redirect
from flask import url_for, jsonify, flash, session
from static.py.tools import logger, exeReq, wEvent
import re, os

# Conf and create app
app = Flask(__name__)
app.config.from_object(__name__)
app.config.from_envvar('FLASK_SETTING')

# Import login features
from static.py.login import login_api
app.register_blueprint(login_api)

# WEB mgt ----------------------------------------------------------------------------
@app.route('/')
def my_form():
  if 'login' in session:
    return render_template("WebTrigger.html")
  return render_template("login.html")

# End of App --------------------------------------------------------------------------
if __name__ == '__main__':
    sess.init_app(app)
    app.debug = app.config['DEBUG']
    app.run()
