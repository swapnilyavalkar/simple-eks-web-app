from flask import Flask, render_template
import socket

app = Flask(__name__)

@app.route('/')
def home():
    hostname = socket.gethostname()
    return render_template('index.html', hostname=hostname)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)