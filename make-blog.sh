#!/bin/sh

# A small script to create a new blog post with the requisite template structure and specified location

CATEGORY_OPTIONS="bioinformatics, ai, ml"
TITLE_EXAMPLE="a-title-with-dashes"
DATE_FORMAT="YYYY-MM-DD"

# Function to display usage message
APP=$0
usage() {
  echo "Usage: $APP [-c category ($CATEGORY_OPTIONS)] [-t title ($TITLE_EXAMPLE)] [-d date ($DATE_FORMAT)]"
  exit 1
}

# Function to validate the title string
valid_title() {
    local input="$1"

    # Check if the string contains any spaces
    if [[ "$input" =~ \  ]]; then
        echo "Error: The input contains spaces."
        return 1
    fi

    # Check if the string matches the pattern 'a-b-c' (letters and hyphens only)
    if [[ ! "$input" =~ ^[a-z]+(-[a-z]+)*$ ]]; then
        echo "Error: Invalid format."
        return 1
    fi

    # Check if the string has a file extension (i.e., a period at the end)
    if [[ "$input" == *.* ]]; then
        echo "Error: The input has a file extension."
        return 1
    fi

    return 0
}

valid_category() {
    local input="$1"

    if [[ "$input" != "ai" &&
          "$input" != "ml" &&
          "$input" != "bioinformatics" ]]; then
        echo "Invalid category."
        return 1
    else
        return 0
    fi
}

valid_date() {
    local input="$1"

    # Check if the string matches the pattern 'YYYY-MM-DD'
    if [[ "$input" =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$ ]]; then
        return 0
    else
        echo "Invalid date string"
        return 1
    fi
}

# Parse the command-line arguments using getopts
date=$(date '+%Y-%m-%d')
while getopts "c:t:d:" opt; do
  case $opt in
    c) category="$OPTARG" ;;
    t) title="$OPTARG" ;;
    d) date="$OPTARG" ;;
    *) usage ;;
  esac
done

# If we are in an interactive shell then fetch output; otherwise, we bailout on error
if [[ $- == *i* ]]; then
    echo "Interactive shell. Will request unset parameters."
    if [ -z "$category" ]; then
        read -p "Provide a category ($CATEGORY_OPTIONS): " category
    fi

    if [ -z "$title" ]; then
        read -p "Provide a title ($TITLE_EXAMPLE): " title
    fi
else
    echo "Non-interactive shell. Will bailout on error."
    if [ -z "$category" ]; then
        echo "Error: Missing required argument -c CATEGORY"
        usage
        exit 1
    fi

    if [ -z "$title" ]; then
        echo "Error: Missing required argument -t TITLE"
        usage
        exit 1
    fi
fi


if ! valid_category "$category"; then
    echo "Error: '$category' is an invalid category. Try ($CATEGORY_OPTIONS)."
    usage
    exit 1
fi

if ! valid_title "$title"; then
    echo "Error: '$title' is an invalid title. Try ($TITLE_EXAMPLE)."
    usage
    exit 1
fi

if ! valid_date "$date"; then
    echo "Error: '$date' is an invalid date. Try ($DATE_FORMAT)."
    usage
    exit 1
fi

file="$date-$title.md"
path="./blog/$category/_posts/"

# Copy the right file
FRONT_MATTER=$(cat <<EOF
---
layout: default
title: $title
excerpt: ### >>> FILL ME IN <<< ###
category: $category
---
EOF
)

echo "${FRONT_MATTER}" >> "$path/$file"

echo "Created $file at $path"