package main

// See:
// <https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/go-programming-model-handler-types.html>

import (
	"context"
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	Name string `json:"name"`
}
type MyResponse struct {
	Message string `json:"Answer:"`
}

func HandleRequest(ctx context.Context, name MyEvent) (MyResponse, error) {
	// return fmt.Sprintf("Hello %s!", name.Name), nil
	return MyResponse{Message: fmt.Sprintf("Hello %s!", name.Name)}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
