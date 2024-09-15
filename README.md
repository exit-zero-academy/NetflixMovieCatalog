# NetflixMovieCatalog

NetflixMovieCatalog is a simple Flask-based API that provides information about TV shows and movies.

## Endpoints

- `GET /` - Welcome message
- `GET /discover` - Discover movies or TV shows
- `POST /updatePopularity` - Update the popularity of a specific movie
- `GET /status` - Check the API status

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/NetflixMovieCatalog.git
    cd NetflixMovieCatalog
    ```
   
    While changing the `yourusername` to your GitHub account name.

2. Create a Python virtual environment and activate it:
    ```sh
    python3 -m venv venv
    source venv/bin/activate
    ```

3. Install the required dependencies:
    ```sh
    pip install -r requirements.txt
    ```

4. Run the application:
    ```sh
    python app.py
    ```

## Data Files

- `data/data_tv.json` - Data for TV shows
- `data/data_movies.json` - Data for movies

