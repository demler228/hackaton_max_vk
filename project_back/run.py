import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from flask import Flask
from flask_cors import CORS

from project_back import main_blueprint

app = Flask(__name__)
app.register_blueprint(main_blueprint, url_prefix="/api")

CORS(app)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
