#!/bin/bash

# Convert a PNG icon (created by chatGPT, for instance) to an SVG icon, and copy it to the assets.

# Usage: ./tools/convert_png_to_svg_poi_icon.sh <path/to/icon.png>

# Example: ./tools/convert_png_to_svg_poi_icon.sh

# usage info
if [ $# -eq 0 ]; then
  echo "Usage: $0 <path/to/icon.png> <icon-name>"
  echo "Example: $0 /path/to/icon.png icon-name"
  exit 0
fi

# read the first argument
ICON_PATH=$1
ICON_NAME=$2
TARGET_PATH=$PWD/libs/flutter/yaha-lib/assets/poi-icons

convert $ICON_PATH xxx.bmp
potrace -s xxx.bmp
mv xxx.svg $TARGET_PATH/$ICON_NAME.svg
rm xxx.bmp



