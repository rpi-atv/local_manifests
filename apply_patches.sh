#!/bin/env bash
set -xe

# Variables
ROOT_DIR=${1:-"."}
PATCHES_DIR=${2:-"arpi-patches"}

# Enumerate all patches
# Keep track of directory structure since it tells us the repo location
pushd "$PATCHES_DIR"
PATCHES=`find . -name '*.patch' | cut -sd / -f 2-`
popd

for PATCH in $PATCHES
do
    # Create a dummy file in /tmp for our patch
    TARGET_DIR=`dirname "$PATCH"`
    TMP_PATCH="/tmp/00-patch.diff"
    cp "$PATCHES_DIR/$PATCH" "$TMP_PATCH"

    # Go into the Git repo and apply the patch
    pushd "$TARGET_DIR"
    git reset --hard HEAD
    git apply "$TMP_PATCH"
    popd

    # Cleanup
    rm "$TMP_PATCH"
done
