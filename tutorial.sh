#!/usr/bin/env bash
# tutorial_hunt setup

rm -rf ~/tutorial_hunt
mkdir -p ~/tutorial_hunt/step1/step2/final

# Clue 1
cat > ~/tutorial_hunt/clue1.txt <<EOF
Welcome, explorer!
To find your next clue, change into the 'step1' directory.
EOF

# Clue 2
cat > ~/tutorial_hunt/step1/clue2.txt <<EOF
Great job! 
Head into 'step2' next to uncover the final message.
EOF

# Final message
cat > ~/tutorial_hunt/step1/step2/final/final.txt <<EOF
🎉 You made it! 
This is the end of the mini hunt. Celebrate your bash skills!
EOF

echo "tutorial_hunt environment ready at ~/tutorial_hunt"
