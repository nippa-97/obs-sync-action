#!/bin/bash

set -e

# OBS util download link
OBS_DOWNLOAD_LINK="https://obs-community-intl.obs.ap-southeast-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz"


if [ -z "$ACCESS_ID" ]; then
    echo "Error: Missing required environment variable ACCESS_ID"
    exit 1
fi

if [ -z "$SECRET_KEY" ]; then
    echo "Error: Missing required environment variable SECRET_KEY"
    exit 1
fi

if [ -z "$END_POINT" ]; then
    echo "Error: Missing required environment variable END_POINT"
    exit 1
fi

if [ -z "obs://$OBS_BUCKET" ]; then
    echo "Error: Missing required environment variable OBS_BUCKET"
    exit 1
fi

if [ -z "$LOCAL_PATH" ]; then
    echo "Error: Missing required environment variable LOCAL_PATH"
    exit 1
fi


echo "Downloading obsutil from $OBS_DOWNLOAD_LINK..."
wget -q $OBS_DOWNLOAD_LINK -O obsutil.tar.gz
mkdir obsutil
tar -xzf obsutil.tar.gz --strip-components=1 -C obsutil
chmod 755 obsutil


export PATH=$PATH:$(pwd)/obsutil

obsutil version


echo "Configuring obsutil..."
obsutil config -i="$ACCESS_ID" -k="$SECRET_KEY" -e="$END_POINT"


echo "Starting sync..."
obsutil sync "$LOCAL_PATH" "obs://$OBS_BUCKET" || { echo "Sync failed"; exit 1; }

echo "Sync completed successfully!"
