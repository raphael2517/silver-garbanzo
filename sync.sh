#!/bin/bash

PROJECT_PATH="https://github.com/raphael2517/silver-garbanzo.git"  # Change this to your project path
GODOT_EXECUTABLE="/usr/bin/godot"  # Example: "/usr/bin/godot"

cd "$PROJECT_PATH"

# Pull latest changes before opening the project
echo "Pulling latest changes..."
git pull origin main

# Open Godot
echo "Launching Godot..."
"$GODOT_EXECUTABLE" "$PROJECT_PATH"

# After closing, commit and push changes
echo "Checking for changes..."
if [[ $(git status --porcelain) ]]; then
    git add .
    git commit -m "Auto-sync: $(date)"
    git push origin main
    echo "Changes pushed!"
else
    echo "No changes detected."
fi
