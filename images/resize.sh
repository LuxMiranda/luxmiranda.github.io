#!/bin/bash

for f in thumbs/*
do
  dimensions=$(identify $f | cut -d " " -f 3)
  width=$(echo $dimensions | cut -d "x" -f 1)
  if (( width > 600 )); then
    echo "Resizing $f ($dimensions)"
    convert -resize 600x $f $f
  fi
done
