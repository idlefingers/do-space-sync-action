#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${SPACE_ACCESS_KEY_ID}
aws_secret_access_key = ${SPACE_SECRET_ACCESS_KEY}" > ~/.aws/credentials

aws s3 sync ${SOURCE_DIR} s3://${SPACE_NAME}/${DEST_DIR} \
            --follow-symlinks \
            --delete \
            --endpoint https://${SPACE_REGION}.digitaloceanspaces.com $*

rm -rf ~/.aws
