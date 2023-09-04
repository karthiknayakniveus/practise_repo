#!/bin/bash

# Specify the commit range you want to compare
commit1="a22c1bf21c0f1ea5f67626392d3d9521775d82f3"
commit2="c6c6eb9a5c38f30504380b5a38fd2d2ea80ff94a"

# Create the directory to store downloaded files


# Loop through the added files and copy them to the directory
git diff --name-only $commit1 $commit2 | while read -r file; do
    git show "$commit2:$file" > "/home/karthik/Downloadfilelist/$file"
done

