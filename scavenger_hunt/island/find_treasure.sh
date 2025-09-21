#!/usr/bin/env bash
# find_treasure.sh
# Validates that island/treasuremap.txt has “X marks the spot” uncommented,
# then creates the treasure (treasure_chest.txt) file
#
MAP="$HOME/fall-code-camp-2025/scavenger_hunt/island/treasuremap.txt"

# Check for the uncommented X line
if grep -q '^X marks the spot$' "$MAP"; then
  echo "X found! Crafting your treasure chest..."
  cat > chest.txt << EOL
You found the long lost treasure!
Congratulations!!
EOL
  echo "chest.txt created"
  echo "Move the treasure chest to your loot folder!"
else
  echo "Oops! The line “X marks the spot” is still commented."
  echo "Use vi to remove the “# ” before that line in island/treasuremap.txt"
fi
