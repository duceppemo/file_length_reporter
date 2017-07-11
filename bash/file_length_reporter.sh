#!/bin/bash

to_scan="/media/partage"  # mapped network drive
max_len=220
report_file="~/Desktop/long_paths.txt"

find -P "$to_scan" -type f | while read k; do
  i=${k/\/media\//Z\:}  # replace root for Windows
  l=$(echo "$i" | sed 's/\//\\/g')  # Convert / to \ for Windows
  len=${#l}  # length of the absolute path as seen by Windows
  if [ "$len" -gt "max_len" ]; then
    echo -e ""${l}"\t"${len}""  >> "$report_file"
  fi
done
