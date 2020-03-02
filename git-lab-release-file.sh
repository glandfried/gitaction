#!/bin/bash

PRIVATE_TOKEN="$1"
FILE="$2"
GITLAB_HOSTING="$3"
PROJECT_ID="$4"

if [ "$1" == "" ]; then
    echo 'PRIVATE_TOKEN FILE GITLAB_HOSTING PROJECT_ID';
    exit 1;
fi

curl --request POST --header "Private-Token: PRIVATE_TOKEN" --form "file=FILE" "https://GITLAB_HOSTING/api/v4/projects/PROJECT_ID/uploads"


