# summon_bell

## riverpodの依存関係を記載したgraph.mdを生成する方法
```
dart pub global run riverpod_graph:riverpod_graph > ./docs/graph.md
```
上記コマンドを入力することでriverpodの依存関係を記載したgraph.mdがdocs配下に生成される  
ただし下記作成されたgraph.mdは下記のように囲む必要がある
```
```mermaid ```
```

## k1LoW/tbls について
DBをもとにER図を生成するツールです。  
https://github.com/k1LoW/tbls
様々な種類のDBに対応しており、現在利用中のsqlite3にも対応しています。

### tblsのインストール
(面倒なためwsl上でbrewを使ってインストールしています。)
```bash
$ brew install k1LoW/tap/tbls
```

### tblsの実行
.tbls.yml( またはtbls.yml) ファイルをリポジトリに追加します。
```bash
# .tbls.yml

# DSN (Database Source Name) to connect database
# 環境変数を使う場合には${環境変数名}と記述する
dsn: "sqlite:///[DBへのパス]"
# Path to generate document
# Default is `dbdoc`
docPath: doc/schema
```
実行  
私の場合環境変数にSummonBellのパスを通しているので下記のように実行しています。
```bash
$ cd $summonbell_path
$ tbls doc
```

現在のドキュメントとDBの作文確認
```bash
tbls diff
```

既存ドキュメントの強制更新
```bash
$ tbls doc --force
```

既存ドキュメントを削除後に新規作成
```bash
$ tbls doc --rm-dist
```
https://qiita.com/k1LoW/items/92d1be1437a259827338

