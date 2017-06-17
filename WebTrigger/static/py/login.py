#!/bin/python
# Target: login feature for duty alert system
# Version: 0.1
# Date: 2017/01/18
# Author: Guillain (guillain@gmail.com)
# Copyright 2017 GPL - Guillain

from flask import Flask, session, render_template, request, redirect, url_for
from tools import logger, exeReq, wEvent

from flask import Blueprint
login_api = Blueprint('login_api', __name__)

import re, os, sys, urllib

# Conf app
api = Flask(__name__)
api.config.from_object(__name__)
api.config.from_envvar('FLASK_SETTING')

# Web login --------------------------------------------------------------------------
@login_api.route('/login', methods=['GET', 'POST'])
def login():
    # Web POST login request
    if request.method == 'POST':
        resUser = userlogin(request.form['login'],request.form['password'])
        if   (resUser == 'ok'):
            return render_template('WebTrigger.html')
        elif (resUser == 'accesstoken'):
            return render_template('sparkauth.html')
        else:
            return render_template('login.html')

    # Spark auth back reply
    elif request.args.get("code"):
        return render_template('sparkauth.html')

    # Web GET login request
    elif request.method == 'GET':
        try:
            if session['accesstoken']:
                return render_template('WebTrigger.html')
        except Exception as e:
            return render_template('login.html')

    # Error
    else:
        return render_template('login.html')

# Web log out ------------------------------------------------------------------------------
@login_api.route('/logout')
def logout():
  session.pop('logged_in', None)
  session.clear()
  logger('logout','You were logged out')
  return render_template('login.html')

# Spark auth --------------------------------------------------------------------------------
@login_api.route('/sparkauth', methods=['GET', 'POST'])
def sparkauth():
  if request.method == 'POST':
    return render_template('WebTrigger.html')
  elif request.args.get("code"):
    return render_template('sparkauth.html')
  else:
    return render_template('login.html')

# Spark save Access token ------------------------------------------------------------------------
@login_api.route('/saveAT', methods=['POST'])
def saveAT():
    error = None
    try:
        data = exeReq("UPDATE users SET accesstoken = '"+request.form['token']+"' WHERE login='"+session['login']+"'")
    except Exception as e:
        logger('saveAT','DB connection/request error!')
        return render_template('login.html', error = error)

    session['accesstoken'] = request.form['token']
    logger('saveAT','Your access token was recorded properly')
    return redirect(url_for('login_api.logout'))

# Spark reset Access token ------------------------------------------------------------------------
@login_api.route('/resetAT', methods=['POST'])
def resetAT():
    error = None
    try:
        data = exeReq("UPDATE users SET accesstoken = '' WHERE login='"+session['login']+"'")
    except Exception as e:
        logger('resetAT','DB connection/request error!')
        return render_template('login.html', error = error)

    session['accesstoken'] = ''
    logger('resetAT','Your access token was resetted properly')
    return redirect(url_for('login_api.logout'))


def userlogin(login,password):
    if not login or not password:
        logger('login','Thanks to provide login and password')
        return 'ko'

    try:
        sql  = "SELECT email, webhook, mobile, accesstoken "
        sql += "FROM users "
        sql += "WHERE login = '" + login + "' AND pw_hash = PASSWORD('" + password + "');"
        print sql
        data = exeReq(sql)
    except Exception as e:
        logger('login','DB connection/login request error!')
        return 'ko'

    if data is None:
        logger('login','Wrong email or password!')
        return 'ko'
    else:
        session['logged_in'] = True
        session['login'] = login
        session['email'] = data[0][0]
        session['webhook'] = data[0][1]
        session['mobile'] = data[0][2]
        session['accesstoken'] = ""

        if data[0][3]: # if accesstoken set so finalize the login
            session['accesstoken'] = "Bearer "+data[0][3]
            logger('login','You were logged (login:'+login+',email:'+session['email']+').')
            return 'ok'
        else: # no accesstoken so Cisco registration request
            logger('login','You were logged but without access token, redirect on AT request page ongoing (login:'+login+',email:'+session['email']+').')
            return 'accesstoken'

    return 'ko'
