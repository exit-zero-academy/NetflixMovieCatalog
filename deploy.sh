#!/bin/bash

# TODO your deploy script implementation...
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update package lists and install Python 3.12 venv if not already installed
sudo apt-get update
sudo apt-get install -y python3.12-venv

# Navigate to the application directory
cd ~/app || exit

# Create a virtual environment if it doesn't already exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install required Python packages
pip install --no-cache-dir -r requirements.txt

# Stop the app service if it's running (optional)
# Uncomment and modify if using a service manager like systemd
# sudo systemctl stop netflix-movie-catalog.service

# Run the application
nohup python app.py > app.log 2>&1 &

# Optional: Start the service using systemd (if applicable)
# Uncomment and modify if you have a service defined
# sudo systemctl start netflix-movie-catalog.service

echo "Deployment complete! Application is running in the background."
