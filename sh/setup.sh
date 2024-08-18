#!/bin/bash

SH_DIR=$(cd $(dirname $0); pwd)
ROOT_DIR=$(cd $(dirname $0); cd ../; pwd)
CLONE_DIR=$(cd $(dirname $0); cd ../clone; pwd)

# GOAT
rm -rf $CLONE_DIR/goat
git clone https://github.com/kodaimura/goat.git $CLONE_DIR/goat
rm -rf $ROOT_DIR/bin
ln -s $CLONE_DIR/goat/bin $ROOT_DIR

chmod -R +x $ROOT_DIR