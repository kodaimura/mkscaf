#!/bin/bash

SH_DIR=$(cd $(dirname $0); pwd)
ROOT_DIR=$(cd $(dirname $0); cd ../; pwd)
CLONE_DIR=$(cd $(dirname $0); cd ../clone; pwd)

# JLATリポジトリのクローン
rm -rf "$CLONE_DIR/jlat"
if ! git clone https://github.com/kodaimura/jlat.git "$CLONE_DIR/jlat"; then
    echo -e "\033[31m❌ Error: Failed to clone the JLAT repository.\033[0m"
    exit 1
fi
chmod -R +x "$CLONE_DIR/jlat/bin"

# プロジェクト名の取得
while true; do
    echo ""
    echo -e "\033[32m🐐 Please enter your JLAT Project Name:\033[0m"
    echo -n ">> "
    read appname
    
    if [ -n "$appname" ]; then
        break
    fi
    echo -e "\033[31m⚠️ Error: Project name cannot be empty. Please try again.\033[0m"
done

# データベースタイプの取得
while true; do
    echo ""
    echo -e "\033[32m🔌 Please choose the type of database:\033[0m"
    echo "1. SQLite"
    echo "2. PostgreSQL"
    echo "3. MySQL"
    echo -n "Enter the number (1-3): "
    read database_choice
    
    case $database_choice in
        1)
            database="SQLite"
            break
            ;;
        2)
            database="PostgreSQL"
            break
            ;;
        3)
            database="MySQL"
            break
            ;;
        *)
            echo -e "\033[31m⚠️ Error: Invalid choice. Please choose a number between 1-3.\033[0m"
            ;;
    esac
done

# アプリケーションの作成
if ! "$CLONE_DIR/jlat/bin/jlat" "$appname" -db "$database"; then
    echo -e "\033[31m❌ Error: Failed to create the application.\033[0m"
    exit 1
fi

echo ""
echo -e "\033[34m🎉 Success! Your JLAT project '$appname' has been created with the '$database' database!\033[0m"
