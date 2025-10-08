#!/bin/bash

set -e

KEY_PATH="$HOME/.ssh/id_ed25519"
PUB_KEY_PATH="${KEY_PATH}.pub"

echo "=== Генерация SSH-ключа для пользователя $(whoami) ==="

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [[ -f "$KEY_PATH" ]]; then
  echo "Key already exists: $KEY_PATH"
else
  ssh-keygen -t ed25519 -f "$KEY_PATH" -N "" -C "$(whoami)@$(hostname)"
  echo "Key created: $KEY_PATH"
fi

echo
echo "=== Your pub key: (paste into the site.yml -> team_pubkey) ==="
echo
cat "$PUB_KEY_PATH"
echo
echo "==============================================================="