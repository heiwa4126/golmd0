#!/bin/sh
find . -name \*~ -type f | xargs -r rm
rm -f main
go fmt ./...
go vet ./...
