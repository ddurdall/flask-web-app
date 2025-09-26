from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/', methods=['GET'])
def send_message():
    if (request.method == 'GET'):
        message = {"message": "Hello from our web app"}
        return jsonify(message)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
