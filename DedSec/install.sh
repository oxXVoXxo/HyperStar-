#!/bin/bash
# DedSec Install Script - GitHub version with Rain Effect

rain_effect() {
  clear
  rows=$(tput lines)
  cols=$(tput cols)

  # Initialize array of column positions
  columns=()
  for ((i=0; i<cols; i++)); do
    columns[i]=0
  done

  for _ in {1..100}; do
    for ((i=0; i<cols; i++)); do
      if (( RANDOM % 20 == 0 )); then
        columns[i]=$(( (columns[i] + 1) % rows ))
      fi
      tput cup ${columns[i]} $i
      echo -ne "\033[1;32m$(printf \\$(printf '%03o' $(( RANDOM % 26 + 65 ))))\033[0m"
    done
    sleep 0.05
  done
  clear
}

# Run rain effect before installation
rain_effect

echo "[+] Starting DedSec setup..."

# Define your GitHub repo URL here
REPO_URL="https://github.com/yourusername/dedsec-tool.git"
INSTALL_DIR="$HOME/dedsec-tool"

# Install dependencies
deps=(figlet jq curl nmap neofetch git)
for dep in "${deps[@]}"; do
  if ! command -v $dep >/dev/null 2>&1; then
    echo "[*] Installing $dep..."
    if command -v pkg >/dev/null 2>&1; then
      pkg install -y $dep
    else
      sudo apt update && sudo apt install -y $dep
    fi
  fi
done

# Clone or update repo
if [ -d "$INSTALL_DIR" ]; then
  echo "[*] Existing DedSec installation found, updating..."
  cd "$INSTALL_DIR" && git pull
else
  echo "[*] Cloning DedSec repository..."
  git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Make the main script executable
chmod +x "$INSTALL_DIR/dedsec.sh"

echo "[✓] Setup complete."
echo "Run the tool with: bash $INSTALL_DIR/dedsec.sh"

exit 0
