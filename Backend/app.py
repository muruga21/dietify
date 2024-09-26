from flask import request, jsonify
from flask_login import login_user, logout_user, login_required, current_user
from models import User
from __init__ import app, db, bcrypt
from groq import Groq

@app.route('/getDietplan', methods=['POST'])
def getDietPlan():
    data = request.get_json()

    # Extract the gene variant and meals from the request body
    gene_variant = data.get('gene_variant')
    breakfast = data.get('breakfast')
    lunch = data.get('lunch')
    dinner = data.get('dinner')

    try:
        groq_text_generation_key = "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"
    except:
    
        return "Error loading groq api key"

    try:
        client = Groq(
            api_key="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",
        )
        chat_completion = client.chat.completions.create(
            messages=[
                {
                    "role": "user",
                    "content": f"i have {gene_variant} gene variant.. and what i had today breakfast = {breakfast} lunch = {lunch}, dinner = {dinner}.. by analysing this and my gene variant give me a proper diet recomendation according to the variant return the datas in this format of json name food type[ breakfast, lunch, dinner ] and details for each food type of the food give the result in that json format. no more text..",
                }
            ],
            model="llama3-8b-8192",
        )
    
        return chat_completion.choices[0].message.content
    except Exception as e:
    
        return e

@app.route('/recommendation', methods=['POST'])
def recommendation():
    data = request.get_json()

    # Extract the gene variant and meals from the request body
    gene_variant = data.get('gene_variant')
    country = data.get('country')

    try:
        groq_text_generation_key = "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"
    except:
    
        return "Error loading groq api key"

    try:
        client = Groq(
            api_key="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",
        )
        chat_completion = client.chat.completions.create(
            messages=[
                {
                    "role": "user",
                    "content": f"i have {gene_variant} gene variant.. and i live in {country}  by analysing this and my gene variant give me a proper diet recomendation according to the variant return the datas in this format of json name food type[ breakfast, lunch, dinner ] and details for each food type of the food give the result in that json format. no more text..",
                }
            ],
            model="llama3-8b-8192",
        )
    
        return chat_completion.choices[0].message.content
    except Exception as e:
    
        return e


@app.route('/login', methods=['POST'])
def login():
    if current_user.is_authenticated:
        return jsonify({'message': 'Already logged in'}), 200
    
    data = request.get_json()  # Get JSON data from request body
    email = data.get('email')
    password = data.get('password')
    
    user = User.query.filter_by(email=email).first()
    if user and bcrypt.check_password_hash(user.password, password):
        login_user(user, remember=data.get('remember', False))
        return jsonify({'message': 'Login successful', 'user': user.email}), 200
    else:
        return jsonify({'message': 'Login failed. Check email and password.'}), 401


@app.route('/signup', methods=['POST'])
def signup():
    if current_user.is_authenticated:
        return jsonify({'message': 'Already logged in'}), 200

    data = request.get_json()  # Get JSON data from request body
    email = data.get('email')
    password = data.get('password')
    
    # Check if user already exists
    user_exists = User.query.filter_by(email=email).first()
    if user_exists:
        return jsonify({'message': 'User already exists'}), 400

    # Hash the password
    hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')

    # Create new user
    user = User(email=email, password=hashed_password)
    db.session.add(user)
    db.session.commit()

    return jsonify({'message': 'User created successfully. You can now log in'}), 201


@app.route('/logout', methods=['POST'])
@login_required
def logout():
    logout_user()
    return jsonify({'message': 'Logged out successfully'}), 200


@app.route('/')
def home():
    return jsonify({'message': 'Welcome to the Home Page'}), 200


if __name__ == '__main__':
    app.run(app.run(host='172.18.0.1', port=5000, debug=True))
