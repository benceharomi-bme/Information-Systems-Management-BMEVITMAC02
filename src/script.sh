#!/bin/bash

GREEN='\033[0;32m'
WHITE='\033[0m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
RED='\033[0;31m'

# User inputs
echo -e -n "${WHITE}Please enter the name of the searched file: ${GREEN}"
read file_name
echo -e -n "${WHITE}Please enter the hash of the commit where the search should start: ${PURPLE}"
read commit_hash

# Checking whether the commit is present on one of the branches
branches=($(git branch --format="%(refname:short)" --contains $commit_hash 2>/dev/null))
if [ ${#branches[@]} -eq 0 ]; then
  echo -e "\n${WHITE}No branch found which contains a commit with the hash of ${PURPLE}$commit_hash${WHITE}"
  exit 1
else
  echo -e "\n${WHITE}The ${PURPLE}$commit_hash${WHITE} commit is present on the following branch(es): ${YELLOW}${branches[*]}${WHITE}"
fi

# Finding the commit where the file was deleted
format="\tHash: ${CYAN}%H${WHITE}\n\tMessage: ${CYAN}%s${WHITE}\n\tDate: ${CYAN}%ci${WHITE}\n\tCommitter: ${CYAN}%cn${WHITE}"
commit=$(git log --diff-filter=D --max-count=1 --pretty=format:"$format" $commit_hash -- "*/$file_name" $file_name)
if [ -z "$commit" -a "${commit+x}" = "x" ]; then
  echo -e "\n${WHITE}No commit found where the file ${GREEN}$file_name${WHITE} was deleted";
else
  echo -e "\n${WHITE}The file ${GREEN}$file_name${WHITE} was deleted in the following commit:"
  echo -e "$commit"
fi
