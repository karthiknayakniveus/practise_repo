#!/bin/bash

# Specify the commit range you want to compare
commit1=$(git log --pretty=format:%H -n 1 HEAD~0)
commit2=$(git log --pretty=format:%H -n 1 HEAD~1)

# Create the directory to store downloaded files


# Loop through the added files and copy them to the directory
git diff --name-only $commit1 $commit2 | while read -r file; do
    git show "$commit2:$file" > "/home/karthik/Downloadfilelist/$file"
done

