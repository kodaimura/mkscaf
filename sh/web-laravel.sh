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

# プロジェクト名の取得
while true; do
  echo ""
  echo -e "\033[32m🔧 Please enter your Laravel Project Name:\033[0m"
  echo -n ">> "
  read appname

  if [ -n "$appname" ]; then
    break
  fi
  echo -e "\033[31m⚠️ Error: Project name cannot be empty. Please try again.\033[0m"
done

# テンプレートのコピー
if ! cp -r "$TEMPLATE_DIR/web-laravel" "$appname"; then
  echo -e "\033[31m❌ Error: Failed to copy template. Exiting.\033[0m"
  exit 1
fi

# srcディレクトリの作成
if ! mkdir "$appname/src"; then
  echo -e "\033[31m❌ Error: Failed to create 'src' directory. Exiting.\033[0m"
  exit 1
fi

# プロジェクトディレクトリへの移動
if ! cd "$appname"; then
  echo -e "\033[31m❌ Error: Failed to change directory to '$appname'. Exiting.\033[0m"
  exit 1
fi

# Laravelのセットアップ
echo -e "\n🚀 Running Docker compose to set up Laravel..."
if docker compose run --rm app composer create-project --prefer-dist laravel/laravel .; then
  echo -e "\n\033[34m🎉 Success! Your Laravel project '$appname' has been created!\033[0m"
else
  echo -e "\033[31m❌ Error: Docker compose failed. Please check the error messages.\033[0m"
  exit 1
fi
