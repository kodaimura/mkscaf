#!/bin/bash

# プロジェクト名の取得
while true; do
  echo ""
  echo -e "\033[32m🔧 Please enter your Gin Project Name:\033[0m"
  echo -n ">> "
  read appname

  if [ -n "$appname" ]; then
    break
  fi
  echo -e "\033[31m⚠️ Error: Project name cannot be empty. Please try again.\033[0m"
done

# webscafのクローン
if ! git clone https://github.com/kodaimura/webscaf.git $appname; then
  echo -e "\033[31m❌ Error: Failed to clone template. Exiting.\033[0m"
  exit 1
fi

cd $appname

chmod +x ./setup.sh

# プロジェクトのセットアップ
bash ./setup.sh <<EOF
1
$appname
EOF
