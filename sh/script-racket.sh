#!/bin/bash

SH_DIR=$(cd "$(dirname "$0")"; pwd)
ROOT_DIR=$(cd "$(dirname "$0")/.."; pwd)
TEMPLATE_DIR=$(cd "$(dirname "$0")/../template"; pwd)

# Racketスクリプト名の取得
while true; do
    echo ""
    echo -e "\033[32m🚀 Please enter your Racket Script Name:\033[0m"
    echo -n ">> "
    read appname
    
    if [ -n "$appname" ]; then
        break
    fi
    echo -e "\033[31m⚠️ Error: Script name cannot be empty. Please try again.\033[0m"
done

# テンプレートのコピー
if ! cp -r "$TEMPLATE_DIR/script-racket" "$appname"; then
    echo -e "\033[31m❌ Error: Failed to copy template. Exiting.\033[0m"
    exit 1
fi

echo ""
echo -e "\033[34m🎉 Success! Your Racket project '$appname' has been created!\033[0m"
