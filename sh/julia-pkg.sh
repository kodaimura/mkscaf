CURRENT_DIR=$(pwd)
GIT_USER=$(git config --global user.name)
GIT_EMAIL=$(git config --global user.email)

# プロジェクト名の取得
while true; do
    echo ""
    echo -e "\033[32m🐐 Please enter your Julia Package Name:\033[0m"
    echo -n ">> "
    read appname
    
    if [ -n "$appname" ]; then
        break
    fi
    echo -e "\033[31m⚠️ Error: Package name cannot be empty. Please try again.\033[0m"
done

docker run --rm \
  -v "$CURRENT_DIR:/pkg" \
  -e GIT_USER="$GIT_USER" \
  -e GIT_EMAIL="$GIT_EMAIL" \
  julia:latest sh -c "
  apt-get update && apt-get install -y git && \
  git config --global user.name \"\$GIT_USER\" && \
  git config --global user.email \"\$GIT_EMAIL\" && \
  cd /pkg && \
  julia -e 'using Pkg; Pkg.add(\"PkgTemplates\"); using PkgTemplates; Template(user=ENV[\"GIT_USER\"], dir=\"/pkg\")(\"$appname\")'"


echo ""
echo -e "\033[34m🎉 Success! Your Julia package '$appname' has been created!\033[0m"