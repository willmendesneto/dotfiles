# Reinstalling Xcode
#
# how to use:
# xcode-reinstall
#
function xcode-reinstall () {
  XCODE_PATH="$(xcode-select --print-path)"
  echo "Xcode current path: ${XCODE_PATH}"

  echo "Removing Xcode ..."
  sudo rm -r -f /Library/Developer/CommandLineTools
  echo "✅ Removing Xcode"

  echo "Reinstalling Xcode ..."
  xcode-select --install

  echo "✅ Reinstalling Xcode"
}

