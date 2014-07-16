#!/usr/bin/env bash

set -ue

README_PATH="$1"
readme_dir=$(dirname "${README_PATH}")

function extract_ghm_code_blocks() {
  local readme_path="$1"
  awk 'BEGIN{blkline=0; skip=0; }
    $0 ~ /^Example:$/ && blkline == 1 { skip=1; }
    $0 ~ /^```$/ && blkline > 0 {blkline=0;}
    blkline > 0 && skip == 0 {print $0; blkline++; }
    $0 ~ /^```shell$/ && blkline == 0 {blkline=1; skip=0;}' < $readme_path
}

function cleanup() {
  if [[ -d "$WORK_DIR" ]]; then
    rm -rf "$WORK_DIR" || :
  fi
  return 0;
}

trap "cleanup" EXIT

WORK_DIR=$(mktemp -d)

extract_ghm_code_blocks "$README_PATH" > "${WORK_DIR}/script.sh"

(
  cd $readme_dir;
  . "${WORK_DIR}/script.sh"
)
