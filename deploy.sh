#!/bin/bash
set -e

# Variables
PORT=8080

echo ""
echo "Installing python3.12-venv..."
echo "--------------------------------"
sudo apt-get update
sudo apt-get install -y python3.12-venv

echo ""
echo "Creating a Python virtual environment..."
echo "--------------------------------"
python3 -m venv venv

echo ""
echo "Activating the Python virtual environment..."
echo "--------------------------------"
source venv/bin/activate

echo ""
echo "Installing Python dependencies..."
echo "--------------------------------"
pip install -r requirements.txt

echo ""
echo "Stopping any process using port $PORT..."
echo "--------------------------------"
sudo fuser -k $PORT/tcp || true  # Kill process using the port, suppress errors if non

echo ""
echo "Starting the Python application..."
echo "--------------------------------"
python app.py
