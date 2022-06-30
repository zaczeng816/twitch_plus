#!/bin/bash

# Check if commit message is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a commit message"
    echo "Usage: ./random_commit.sh \"Your commit message\""
    exit 1
fi

# Store the commit message from all arguments
commit_message="$*"

# Generate random date in 2022 for macOS
start_timestamp=$(date -j -f "%Y-%m-%d" "2022-01-01" "+%s")
end_timestamp=$(date -j -f "%Y-%m-%d" "2022-12-31" "+%s")
random_timestamp=$((start_timestamp + RANDOM * (end_timestamp - start_timestamp) / 32767))
random_date=$(date -r $random_timestamp "+%Y-%m-%d %H:%M:%S")

# Set Git dates
export GIT_COMMITTER_DATE="$random_date"
export GIT_AUTHOR_DATE="$random_date"

# Make the commit
git commit -m "$commit_message"

# Unset Git dates
unset GIT_COMMITTER_DATE GIT_AUTHOR_DATE

echo "Commit created with date: $random_date"