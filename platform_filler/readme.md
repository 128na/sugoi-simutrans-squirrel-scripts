
# 説明

指定範囲を指定した駅を並べて埋めるスクリプトです。

# 使い方

- ツールーバーのplatform_fillerをクリックしてスクリプトを起動
- マップ内の `[0,0,-2] - [10,10,2]` の範囲に建設したいプレーヤーで軌道と駅を設置する（1マス以上）
- 敷設したい範囲をドラッグ
- 選択範囲のうち敷設可能な軌道上にホームが敷設されます
- ホームの設置順序は始点側から終点側へ向かって建設されます

<img src="doc/1.png" >
<img src="doc/2.png" >
<img src="doc/3.png" >

始点と終点を逆にするとホームの設置順序が変わります。

# 導入

- 解凍したフォルダ(このreadme.txtのあるフォルダ)をpak/toolフォルダに移動する。
- `cursor.platform_filler.pak` をpakフォルダに移動する。
- `lib_obj_finder_v2.nut`, `lib_mark_v1.nut`, `lib_filler_v1.nut` をpak/toolフォルダに移動する。
- Simutransを起動してスロープツールにアイコンが表示されていれば導入成功です。

```
pakXYZ
┣━ cursor.platform_filler.pak
┣━ tool
┃   ┣━ lib_obj_finder_v2.nut
┃   ┣━ lib_mark_v1.nut
┃   ┣━ lib_filler_v1.nut
┃   ┣━ platform_filler
┃   ┃   ┣━ readme.md
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

- v2 初版
- v3 軌道を敷設せずホーム設置のみに変更
