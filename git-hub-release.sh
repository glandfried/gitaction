#!/bin/bash
title=$1
version=$2
hub release create -m "$title" $version
