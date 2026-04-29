#!/usr/bin/env bash

BASHRC="$HOME/.bashrc"

# Check if qa function already exists
if ! grep -q "qa()" "$BASHRC"; then
  cat << 'EOF' >> "$BASHRC"

qa() {
  local qnum="$1"
  local lines="$2"
  local pattern="$3"

  curl -s "https://raw.githubusercontent.com/tr580pp/snmp/main/${qnum}.txt" \
    | grep -A"$lines" "$pattern" \
    | grep -v "$pattern" \
    | xclip -selection clipboard
}
EOF

else
  echo "qa() already exists in ~/.bashrc"
fi

echo "Run: source ~/.bashrc"
