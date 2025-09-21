#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Extended Bash Scavenger Hunt Setup Script
# – Cave lives under mountain
# – Island stage requires uncommenting “X marks the spot” in treasuremap.txt
# – find_treasure.sh checks for the X and builds treasure_chest.txt
# – Uses “loot” as the final directory
# -----------------------------------------------------------------------------

# 1. Clean slate
rm -rf ~/scavenger_hunt
mkdir -p ~/scavenger_hunt/{forest,mountain/cave,island,loot}

# 2. Populate clues

# Clue 1: root
cat > ~/scavenger_hunt/clue1.txt <<EOF
Bravo! You’ve found the first clue.
Venture into the forest next.
EOF

# Clue 2: forest
cat > ~/scavenger_hunt/forest/note.txt <<EOF
Well done. Next, a hidden file awaits in the mountain’s cave.
Use ls -a inside mountain/cave to find it.
EOF

# Clue 3: mountain’s cave (hidden)
cat > ~/scavenger_hunt/mountain/cave/.secret.txt <<EOF
Almost there! Climb out to the mountain root for your next message.
EOF

# Clue 4: mountain root
cat > ~/scavenger_hunt/mountain/scroll.txt <<EOF
Congratulations! Before the treasure, you must visit the island.
Open island/treasuremap.txt with vi, uncomment “X marks the spot,” then run find_treasure.sh.
EOF

# Clue 5: island treasuremap (with commented “X marks the spot”)
cat > ~/scavenger_hunt/island/treasuremap.txt <<EOF
# Welcome to the Island
# X marks the spot
EOF

# 3. Create find_treasure.sh in island
cat > ~/scavenger_hunt/island/find_treasure.sh <<'EOF'
#!/usr/bin/env bash
# find_treasure.sh
# Validates that island/treasuremap.txt has “X marks the spot” uncommented,
# then creates the treasure (treasure_chest.txt) file
#
MAP="$HOME/scavenger_hunt/island/treasuremap.txt"

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
EOF

chmod +x ~/scavenger_hunt/island/find_treasure.sh

# 4. Final instructions
echo "Setup complete. Start your hunt in ~/scavenger_hunt."
