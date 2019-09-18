#!/bin/sh
GOOS=linux GOARCH=amd64 go build -o main -ldflags="-w -s"
upx main

zip -r /tmp/golmd0.zip main

aws lambda \
    update-function-code \
    --profile erai \
    --function-name golmd0 \
    --zip-file fileb:///tmp/golmd0.zip \
    --publish

rm -f /tmp/golmd0.zip
