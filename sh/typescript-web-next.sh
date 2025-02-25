#!/bin/bash

# プロジェクト名の取得
while true; do
    echo ""
    echo -e "\033[32m🔧 Please enter your Next Project Name:\033[0m"
    echo -n ">> "
    read appname
    
    if [ -n "$appname" ]; then
        break
    fi
    echo -e "\033[31m⚠️ Error: Package name cannot be empty. Please try again.\033[0m"
done

docker run --rm -it -v $(pwd):/app -w /app node:latest bash -c "npx create-next-app \"$appname\" --typescript"


echo ""
echo -e "\033[34m🎉 Success! Your Next package '$appname' has been created!\033[0m"