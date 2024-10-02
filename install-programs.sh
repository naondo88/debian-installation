#!/bin/sh

# Check if the programs.txt file exists
if [ ! -f "programs.txt" ]; then
  echo "Error: programs.txt file not found in the root directory."
  exit 1
fi

# Loop through each line in programs.txt
while IFS= read -r program; do
  # Skip empty lines or lines starting with a comment (optional)
  [ -z "$program" ] && continue
  echo "$program"
  # Check if the program directory exists
  if [ -d "$program" ]; then
    # Check if install.sh exists in the program directory
    if [ -f "$program/install.sh" ]; then
      echo "Installing $program..."
      # Run the install.sh script
      sh "$program/install.sh"
      if [ $? -ne 0 ]; then
        echo "Error installing $program. Exiting..."
        exit 1
      fi
    else
      echo "Error: $program/install.sh not found."
    fi
  else
    echo "Error: Directory $program not found."
  fi
done <"programs.txt"

echo "All program installation complete!"
