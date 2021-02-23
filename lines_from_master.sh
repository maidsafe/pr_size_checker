#!/usr/bin/env bash

# ignore lock files, eg Cargo.lock, yarn.lock via grep
git diff --stat master \
  | grep -v .lock \
  | awk -F"|" '{ print $2 }' \
  | awk '{ print $1 }' \
  | sed '/^$/d' \
  | paste -sd+ - \
  | bc