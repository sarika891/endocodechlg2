import sys
import logging
from logging.handlers import RotatingFileHandler
import flask
import subprocess
from flask import request, jsonify
import re

app = flask.Flask(__name__)
app.config["DEBUG"] = True

logHandler = RotatingFileHandler('info.log', maxBytes=1000, backupCount=1)

# set the log handler level
logHandler.setLevel(logging.INFO)
# set the app logger level
app.logger.setLevel(logging.INFO)
app.logger.addHandler(logHandler)

@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to my small application</h1><p>This site is a prototype API hosting only two calls.</p>"

@app.errorhandler(404)
def not_found(error):
    """
    Gives error message when any bad requests are made.
    Args:
        error (string):
    Returns:
        Error message.
    """
    print error
    return make_response(jsonify({'error': 'Bad request'}), 404)

@app.route('/helloworld', methods=['GET'])
def api_id():
    try:
        if 'name' in request.args:
            name=str(request.args['name'])
            rs = re.findall('[A-Z][^A-Z]*',name)
            fs = ""
            for word in rs:
                fs += " "+word

            return fs
        else:
            fs="Hello World Strange"
            return fs
    except Exception as e:
	    return str(e)


@app.route('/version', methods=['GET'])
def api_githash():
    commitid=sys.argv[1]
    return commitid
app.run(host='0.0.0.0', port=8090)
