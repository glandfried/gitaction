#!/bin/bash

PROJECT_ID=$1
TAG_NAME=$2
PRIVATE_TOKEN=$3

if [ "$3" == "" ]; then
    echo "Missing parameter! Parameters are PROJECT_ID, TAG_NAME and PRIVATE_TOKEN.";
    exit 1;
fi

curl --request DELETE --header "Private-Token: ${PRIVATE_TOKEN}" "https://MY_GITLAB_HOSTING.com/api/v4/projects/${PROJECT_ID}/releases/${TAG_NAME}"

echo
