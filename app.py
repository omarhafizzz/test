from flask import Flask, render_template, request, jsonify

app = Flask(__name__)
latest_data = {
    "voltage": 0,
    "current": 0,
    "power": 0
}
@app.route('/')
def home():
    return render_template("index.html")

@app.route('/data', methods=['POST'])
def receive_data():
    global latest_data
    latest_data = request.json
    return jsonify({"status": "received"}), 200

@app.route('/data', methods=['GET'])
def get_data():
    return jsonify(latest_data)

if __name__ == '__main__':
    app.run(debug=True)
    
    