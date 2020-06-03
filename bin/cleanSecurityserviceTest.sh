#!/bin/bash

# x86_64 or arm64 for make run option
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="arm64"

MAKEFILE=$(dirname "$0")/../Makefile

echo "Info: Clean Securityservice's test data."

make -f ${MAKEFILE} del-token ${USE_ARM64} jerry

echo "Info: Securityservice's test data Cleaned"
