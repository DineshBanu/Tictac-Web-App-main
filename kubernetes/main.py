from flask import Flask, jsonify, request, render_template

app = Flask(__name__)

# 1. Home route (renders HTML or JSON)
@app.route('/')
def home():
    return '<h1>Welcome to Flask!</h1>'

# 2. JSON API route
@app.route('/api/greet', methods=['GET'])
def greet():
    name = request.args.get('name', 'world')
    return jsonify(message=f'Hello, {name}!')

# 3. POST example
@app.route('/api/echo', methods=['POST'])
def echo():
    data = request.get_json()
    return jsonify(received=data), 201

if __name__ == '__main__':
    # 4. Run the development server
    app.run(host='0.0.0.0', port=5000, debug=True)
