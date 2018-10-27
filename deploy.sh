#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Checkout the master branch of targeted github pages repository
cd public
git checkout master
cd ..

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push -u origin master

# Come Back up to the Project Root
cd ..