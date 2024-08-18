# goat-cli
アプリケーション雛形作成コマンド

## Install
```
$ git clone https://github.com/kodaimura/goat-cli
```
* goat-cli/bin にPATHを通す
* 実行権限付与
```
$ chmod -R +x path/to/goat-cli/bin
```
## Usage
### Golang (Gin) テンプレート作成
```
$ goat-create-app <appname> [-db {sqlite3| postgres | mysql}]
```
参照 https://github.com/kodaimura/goat
