#!/bin/bash

# Function to calculate time taken for setup
calculate_time() {
  local START_TIME=$1
  local END_TIME=$2
  local SETUP_TOOL=$3

  local ELAPSED_TIME=$(($END_TIME - $START_TIME))
  local SECONDS=$((ELAPSED_TIME % 60))
  local MINUTES=$(((ELAPSED_TIME / 60) % 60))
  local HOURS=$((ELAPSED_TIME / 3600))

  echo "Time taken to set up the project using ${SETUP_TOOL}: ${HOURS} hour(s), ${MINUTES} minute(s), ${SECONDS} second(s)"
}

# Clone the repository
git clone https://github.com/DevOps2-Fundamentals/example-app-nodejs-backend-react-frontend.git
cd example-app-nodejs-backend-react-frontend

# Measure time for npm install
START_TIME=$(date +%s)
npm install
END_TIME=$(date +%s)
calculate_time $START_TIME $END_TIME "npm"

# Remove node_modules to measure yarn install
rm -rf node_modules

# Measure time for yarn install
START_TIME=$(date +%s)
yarn install
END_TIME=$(date +%s)
calculate_time $START_TIME $END_TIME "yarn"
