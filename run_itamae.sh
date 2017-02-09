#!/bin/sh

WORK_DIR="`pwd`/itamae"

bundle exec "itamae ssh --vagrant --host itamae-jenkins --node-yaml $WORK_DIR/node.yml $WORK_DIR/roles/ci.rb"
