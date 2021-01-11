# 説明

指定範囲を指定した架線で埋めるスクリプトです。

# 使い方

1. ツールーバーのwayobj_fillerをクリックしてスクリプトを起動
1. マップ内の `[0,0,-2] - [10,10,2]` の範囲に建設したいプレーヤーで軌道と架線を設置する（1マス以上）
1. 敷設したい範囲をドラッグ
1. 選択範囲のうち敷設可能な軌道上に架線が敷設されます

# 導入

1. 解凍したフォルダ(このreadme.txtのあるフォルダ)をpak/toolフォルダに移動する。
1. `cursor.wayobj_filler.pak` をpakフォルダに移動する。
1. `lib_obj_finder_v2.nut`, `lib_mark_v1.nut`, `lib_filler_v1.nut` をpak/toolフォルダに移動する。
1. Simutransを起動してスロープツールにアイコンが表示されていれば導入成功です。

```
pakXYZ
┣━ cursor.wayobj_filler.pak
┣━ tool
┃   ┣━ lib_obj_finder_v2.nut
┃   ┣━ lib_mark_v1.nut
┃   ┣━ lib_filler_v1.nut
┃   ┣━ wayobj_filler
┃   ┃   ┣━ tool.nut
┃   ┃   ┣━ description.tab
```

# スクリプトのパラメーター

|変数名|デフォルト値|説明|
|---|---|---|
|`area`|`[[0, 0, -2],[10, 10, 2]]`|オブジェクトを検知する範囲を指定します。<br>範囲を広げると検索に時間がかかります。|

# 既知の問題

- アイコンがスロープツールにしか表示できなかったのでスロープツールに配置されています。
  - 特殊建築物ツールに移したいですね！

# ソース
https://github.com/128na/sugoi-simutrans-squirrel-scripts

# 更新履歴

※バージョンはスクリプト集共通の値です。

- v3 初版
