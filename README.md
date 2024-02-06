# create-app
アプリケーション雛形作成コマンド

## Install
```
$ git clone https://github.com/kodaimura/create-app
```
* create-app/bin にPATHを通す
* 実行権限付与
```
$ chmod -R +x path/to/create-app/bin
```
## Usage
### Golang (Gin) テンプレート作成
```
$ goat <appname> [-db {sqlite3| postgres | mysql}]
```
参照 https://github.com/kodaimura/goat
