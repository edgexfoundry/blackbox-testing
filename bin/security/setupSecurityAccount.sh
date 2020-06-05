#!/bin/bash

option="${1}"

# x86_64 or arm64 for make run option
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="arm64"

BB_ROOT_DIR=$(cd $(dirname "$0"); cd ..; pwd)
MAKEFILE=$BB_ROOT_DIR/Makefile

case ${option} in
  -useradd)
  echo "Info: Add security account."
  export TOKEN=`make -f ${MAKEFILE} get-token ${USE_ARM64} geneva`
  echo TOKEN=$TOKEN
  ;;
  -userdel)
  echo "Info: Delete security account."
  make -f ${MAKEFILE} del-token ${USE_ARM64} geneva
  ;;
  *)
  exit 0
  ;;
esac
