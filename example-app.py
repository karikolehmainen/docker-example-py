import os
from flask import Flask, request
from flask_cors import CORS, cross_origin
from flask_restful import Api
from flask_marshmallow import Marshmallow


app = Flask(__name__)
ma = Marshmallow(app)
cors = CORS(app)
api = Api(app)
app.config['CORS_HEADERS'] = 'Content-Type'
Base = declarative_base()

def prepare_error_response(message):
	return {'status_code': 500, 'message': message}

def prepare_success_response(message=None, data=None):
	return {'status_code': 200, 'message': message, 'data': data}


@app.route("/hello", methods=['GET'])
@cross_origin()
def hello():
	try:
		result = "Hi ya!"
		return prepare_success_response(data=result)
	except mariadb.Error:
		return prepare_error_response('Failed to return data')

