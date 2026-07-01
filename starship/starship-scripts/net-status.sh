#!/bin/bash

# Define colors
BLUE="\e[1;38;2;125;207;255m"
RED="\e[1;38;2;247;118;142m"
RESET="\e[0m"

# Cache settings
CACHE_FILE="/tmp/internet_status.cache"
CACHE_TTL=40 # Check real connectivity every 60 seconds (1 minute)

# If cache file doesn't exist or is too old, perform a real check
if [[ ! -f "$CACHE_FILE" ]] || [[ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0))) -ge $CACHE_TTL ]]; then
  if (exec 3<>/dev/tcp/1.1.1.1/443) 2>/dev/null; then
    echo "connected" >"$CACHE_FILE"
  else
    echo "disconnected" >"$CACHE_FILE"
  fi
fi

# Read from cache and display the status
if [[ $(cat "$CACHE_FILE" 2>/dev/null) == "connected" ]]; then
  printf "${BLUE}⇅${RESET}"
else
  printf "${RED}⇅${RESET}"
fi
