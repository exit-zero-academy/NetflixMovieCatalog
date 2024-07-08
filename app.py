from flask import Flask, request, jsonify
import json
import random


app = Flask(__name__)


with open('data/data_tv.json', 'r') as f:
    data_tv = json.load(f)


with open('data/data_movies.json', 'r') as f:
    data_movies = json.load(f)


@app.route("/", methods=['GET'])
def home():
    return "Hi! This app is an API, there is no UI ;-)"


@app.route('/discover')
def get_discover():
    """
    Find movies using over filters and sort options.
    """
    type_ = request.args.get('type')
    data = data_tv if type_ == 'tv' else data_movies
    genre_id = request.args.get('genre')

    if not genre_id:
        results = random.sample(list(data.values()), 20)
    else:
        results = []
        for item in data.values():
            if int(genre_id) in item['genre_ids']:
                results.append(item)
                if len(results) >= 20:
                    break  # stop searching after the first 20 items

    return jsonify(results)


@app.route('/updatePopularity', methods=['POST'])
def update_popularity():
    movie_id = request.json.get('movieId')
    new_popularity = request.json.get('popularity')

    if movie_id not in data_movies:
        return jsonify({'error': 'Movie Id value not provided or not found'}), 400

    if new_popularity is None:
        return jsonify({'error': 'Popularity value not provided'}), 400

    try:
        new_popularity = float(new_popularity)
    except ValueError:
        return jsonify({'error': 'Popularity value must be a float'}), 400

    data_movies[movie_id]['popularity'] = new_popularity

    return jsonify({'message': 'Popularity updated successfully', 'new_popularity': new_popularity}), 200


@app.route('/status')
def status():
    return 'OK'


if __name__ == '__main__':
    app.run(port=8080, host='0.0.0.0')
