#!/usr/bin/env bash

QUIET=0

print_help() {
  cat <<EOF
Usage: $(basename "$0") [options]

Options:
  -q        Quiet mode. Suppress log messages (stderr).
  -h        Show this help message and exit.

Description:
  This script watches dconf changes and prints the changes at the end.
  It generates a dconf dump snapshot, waits for user input 
  (ENTER or CTRL+D) and prints the added lines grouped by dconf groups
  By default it prints the added lines in a DCONF DUMP format 
  to stdout (so you can safely pipe it into dconf2nix).
  It prints extra info to stderr, including the real diff between the 
  changes made, so you can check for deleted lines and remove them.
EOF
}

# Parse args
while getopts "qh" opt; do
  case $opt in
    q) QUIET=1 ;;
    h)
      print_help
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      print_help
      exit 1
      ;;
  esac
done

log() {
  if [ "$QUIET" -eq 0 ]; then
    echo "$@" >&2
  fi
}

before=$(mktemp)
after=$(mktemp)

# Take snapshot before changes
dconf dump / > "$before"
# echo "Snapshot taken. Make your changes now."
# echo "Press ENTER when you're done..."
read -r
dconf dump / > "$after"

echo "==== DCONF diff ====" >&2
echo "(check if something was removed here but isn't in the DUMP at the end)" >&2
echo "(if so, manually remove them from the config file)" >&2

diff --new-line-format='+%L' --unchanged-line-format=' %L' --old-line-format='-%L' "$before" "$after" \
| awk '
  BEGIN { group=""; first=1 }
  # Detect group headers (space/+/- followed by [ )
  /^[ +\-]\[/ { group = substr($0, 2); next }
  # Only additions (+)
  /^[+-]/ {
	# Skip if its an empty line 
    if ($0 ~ /^\+$/) next
    # Print the group name only once
    if (!printed[group]) {
      if (!first) print ""
      print group
      printed[group]=1
      first=0
    }
    print
  }
' >&2

echo >&2
echo "==== DCONF DUMP (new changes) ====" >&2
diff --new-line-format='+%L' --unchanged-line-format=' %L' --old-line-format='-%L' "$before" "$after" \
| awk '
  BEGIN { group=""; first=1 }
  # Detect group headers (space/+/- followed by [ )
  /^[ +\-]\[/ { group = substr($0, 2); next }
  # Only additions (+)
  /^\+/ {
	# Skip if its an empty line 
    if ($0 ~ /^\+$/) next
    # Print the group name only once
    if (!printed[group]) {
      if (!first) print ""
      print group
      printed[group]=1
      first=0
    }
    # hide the "+ "
    print substr($0, 2)
  }
'

rm "$before" "$after"

