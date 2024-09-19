#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Set the correct permissions for the SSH key
chmod 400 ~/.ssh/mykey.pem

# Start the SSH agent and add the key
eval $(ssh-agent -s)
ssh-add ~/.ssh/mykey.pem

# Update package lists and install Python 3.12 venv if not already installed
sudo apt-get update
sudo apt-get install -y python3.12-venv

# Navigate to the application directory
cd ~/app || exit

# Create a virtual environment if it doesn't already exist
if [ ! -d "venv" ]; then
    python3.12 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install required Python packages
pip install --no-cache-dir -r requirements.txt

# Run the application in the background
nohup python app.py > app.log 2>&1 &

# Optional: Start the service using systemd (if applicable)
# sudo systemctl start netflix-movie-catalog.service

echo "Deployment complete! Application is running in the background."
