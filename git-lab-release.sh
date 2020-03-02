#!/bin/bash

RELEASE_NAME="$1"
TAG_NAME="$2"
PROJECT_ID="$3"
DESCRIPTION="$4"
PRIVATE_TOKEN="$5"

if [ "$5" == "" ]; then
    echo "Missing parameter! Parameters are RELEASE_NAME, TAG_NAME, PROJECT_ID, DESCRIPTION_FILE_PATH and PRIVATE_TOKEN.";
    exit 1;
fi

curl --request POST\
     --header 'Content-Type: application/json'\
     --header "Private-Token: ${PRIVATE_TOKEN}"\
     --data-binary "{\"name\": \"${RELEASE_NAME}\", \"tag_name\": \"${TAG_NAME}\", \"description\": \"${DESCRIPTION}\"}"\
     "https://MY_GITLAB_HOSTING.com/api/v4/projects/${PROJECT_ID}/releases" 

echo
