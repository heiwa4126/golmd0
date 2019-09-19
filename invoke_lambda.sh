#!/bin/sh
aws lambda invoke \
    --invocation-type RequestResponse \
    --profile erai \
    --function-name golmd0 \
    --region ap-northeast-1 \
    --payload '{"name":"Dolly"}' \
    /tmp/output.json

echo '======='
cat /tmp/output.json
echo
