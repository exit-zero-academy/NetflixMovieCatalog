sudo apt update

cd ./NetflixMovieCatalog

source .venv/bin/activate

cd ..

sudo systemctl stop uwsgi-flask.service

sudo systemctl enable uwsgi-flask.service

sudo systemctl start uwsgi-flask.service

sudo apt update

sudo systemctl start nginx

sudo apt update
