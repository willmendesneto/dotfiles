# Load CLI utilities
if [ -d ~/.cli ]; then
  CLI_FILES=$(find ~/.cli -maxdepth 2 -type f)
  while read -r line; do
    source $line
  done <<< "$CLI_FILES"
fi

# Load NVM
if [ -d ~/.nvm ]; then
  export NVM_DIR="/Users/willmendesneto/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

