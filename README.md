# golmd0

golangでAWS Lambdaを書くテンプレート。

main.go自体は
[Go の AWS Lambda 関数ハンドラー - AWS Lambda](https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/go-programming-model-handler-types.html)
にあるやつを、ちょっとだけ変えたもので、
`{"name":"Dolly"}`みたいなJSONをeventで受け取って、
`{"Answer:":"Hello Dolly!"}`のようなレスポンスを返すもの。


# 手順

このレポジトリをcloneするか、[ghq](https://github.com/motemen/ghq)で取る。

[AWS lambda](https://ap-northeast-1.console.aws.amazon.com/lambda/home)で関数を作成する。
ハンドラ名が`hello`になるので`main`に変更する。

`deploy.sh`を編集する。
- 関数名`golmd0`のところ
- region
- profile`erai`のところ(`erai`はAdministratorAccessの「普段遣いするのは危険な」プロファイル)

同様に`invoke_lambda.sh`を編集する。
- 関数名`golmd0`のところ
- region
- profile`erai`のところ

`./deploy.sh`実行 (upx使ってるので、インストールするなり、コメントアウトしてください)

`./invoke_lambda.sh`実行。
(invocation-type RequestResponseなので、結果が帰ってくる。
大量に実行する場合はEventにしてCloudWatchから取る)


# TODO

lamdaを作るところから、CLIでできないか考える。
(IAM roleのところがむずかしい)
