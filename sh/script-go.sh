#!/bin/bash

SH_DIR=$(
  cd "$(dirname "$0")"
  pwd
)
ROOT_DIR=$(
  cd "$(dirname "$0")/.."
  pwd
)
TEMPLATE_DIR=$(
  cd "$(dirname "$0")/../template"
  pwd
)

# スクリプト名の取得
while true; do
  echo ""
  echo -e "\033[32m🔧 Please enter your Golang Script Name:\033[0m"
  echo -n ">> "
  read appname

  if [ -n "$appname" ]; then
    break
  fi
  echo -e "\033[31m⚠️ Error: Script name cannot be empty. Please try again.\033[0m"
done

# テンプレートのコピー
if ! cp -r "$TEMPLATE_DIR/script-go" "$appname"; then
  echo -e "\033[31m❌ Error: Failed to copy template. Exiting.\033[0m"
  exit 1
fi

# .vscodeをコピー
if ! cp -r "$ROOT_DIR/.vscode" "$appname"; then
  echo -e "\033[31m❌ Error: Failed to copy .vscode. Exiting.\033[0m"
  exit 1
fi

echo ""
echo -e "\033[34m🎉 Success! Your Golang project '$appname' has been created!\033[0m"
