# 説明

指定座標にいる車両と所属する路線の乗車率を表示するスクリプトです。

# 使い方

1. ツールーバーのvehicle_infoをクリックしてスクリプトを起動
1. 情報を取得したい車両の **先頭車両がいるマス** をクリック
1. メッセージ表に情報が出力されます

<img src="doc/1.png">

# 導入

1. 解凍したフォルダ(このreadme.txtのあるフォルダ)をpak/toolフォルダに移動する。
1. `cursor.vehicle_info.pak` をpakフォルダに移動する。
1. Simutransを起動してスロープツールにアイコンが表示されていれば導入成功です。

```
pakXYZ
┣━ cursor.vehicle_info.pak
┣━ tool
┃   ┣━ vehicle_info
┃   ┃   ┣━ readme.md
┃   ┃   ┣━ tool.nut
┃   ┃   ┣━ description.tab
```

# 既知の問題

- アイコンがスロープツールにしか表示できなかったのでスロープツールに配置されています。
  - 特殊建築物ツールに移したいですね！
- 一時停止中だと車両検索に失敗することがあります
- 車両検索中に該当車両が隣のマスに移動すると検索が失敗します
  - 停車中の車両を狙うと良いです

# ソース
https://github.com/128na/sugoi-simutrans-squirrel-scripts

# 更新履歴

※バージョンはスクリプト集共通の値です。

- v3 初版
