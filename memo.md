# 参考になりそうなもの

## simutrans/script

各スクリプトの雛形ファイルやユーティリティ関数などがある。

- `simutrans/script/script_base.nut`
  - スクリプト共通のユーティリティ関数や定義など
- `simutrans/script/script_compat.nut`
  - Simutransのバージョン後方互換性用の処理？
- `simutrans/script/new_scenario_template.nut`
  - シナリオ作成用のテンプレ
- `simutrans/script/scenario_base.nut`
  - AIプレーヤー作成用のテンプレ
- `simutrans/script/tool_base.nut`
  - ツールスクリプト作成用のテンプレ
- `simutrans/script/ai_base.nut`
  - AIプレーヤー作成用のテンプレ

## simutrans/ai

AIでできるような操作はこの中から探すと良さそう


# デバッグ

## とりあえず動かす

スクリプト読み込み画面から起動させればアイコンなどの用意は不要。
`tool.nut` と `description.tab` のみで動くのでサクッと試す時は便利。

### tool.nut
```
function work(pl, pos) {
    return "works";
}
```

### description.tab
```
title=テスト
type=one_click
tooltip=テストです
restart=0
menu=
icon=
```


## とりあえずメッセージを出す

`do_work` または `work` 関数内で文字列を返すとツール実行時にダイアログが表示される。

```
function do_work(pl, start, end) {
  return "works";
}
```

## チャット欄にメッセージを出す

`gui.add_message_at` を使用する。

http://dwachs.github.io/simutrans-sqapi-doc/group__ai__only.html#ga17b6dafe0c436c5127434f8973f119a2

```
function do_something() {
  ...
  gui.add_message_at(pl, "works", coord(334, 72));
  ...
}
```

`add_message_at` など類似メソッドがあるが、シナリオ専用なので使えない。

## グローバルスコープに登録されているものを全部出す

http://cedec.cesa.or.jp/2009/ssn_archive/pdf/sep3rd/PG82.pdf

```
function work(pl, pos) {
    foreach(key, val in getroottable()) {
        gui.add_message_at(pl, key + ", " + val, coord(0, 0));
    }
}
```
