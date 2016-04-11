#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# css, js compile
cd themes/rz0372
gulp
cd ../..

# Build the project.
hugo -t rz0372 # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..
