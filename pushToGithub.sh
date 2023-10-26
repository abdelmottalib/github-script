#!/bin/bash

GITHUB_USERNAME={your username}
ACCESS_TOKEN={your TOKEN}

read -p "Enter the repository name: " REPO_NAME

curl -u "$GITHUB_USERNAME:$ACCESS_TOKEN" -H "Content-Type: application/json" -X POST -d '{
  "name": "'"$REPO_NAME"'",
  "private": true
}' https://api.github.com/user/repos

git init

git add .
git commit -m "Initial commit"

git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

git push -u origin master

echo "Project successfully pushed to GitHub."
#add this to ur .zshrc so you only need to type new-git for new repo,
#alias new-git='~/.pushToGithub.sh'
