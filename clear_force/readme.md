# 説明

指定範囲を一括撤去するスクリプトです。
自社の構造物のみ撤去できます。
公共事業で使用すると他社の構造物も撤去できます。

# 使い方

- ツールーバーのclear_forceをクリックしてスクリプトを起動
- 撤去したい範囲をドラッグ

<img src="doc/1.png">
<img src="doc/2.png">

# 導入

- 解凍したフォルダ(このreadme.txtのあるフォルダ)をpak/toolフォルダに移動する。
- `cursor.clear_force.pak` をpakフォルダに移動する。
- `lib_obj_finder_v1.nut`, `lib_mark_v1.nut`, `lib_filler_v1.nut` をpak/toolフォルダに移動する。
- Simutransを起動してスロープツールにアイコンが表示されていれば導入成功です。

```
pakXYZ
┣━ cursor.clear_force.pak
┣━ tool
┃   ┣━ lib_mark_v1.nut
┃   ┣━ lib_filler_v1.nut
┃   ┣━ clear_force
┃   ┃   ┣━ readme.md
┃   ┃   ┣━ tool.nut
┃   ┃   ┣━ description.tab
```

## 使えない・注意が必要な種類

- 送電線
  - 軌道として認識されません
- トンネル
  - トンネル内で指定される軌道が選択されます
- 橋
  - 橋の速度と同じ軌道が選択されます（橋末端部分に地上軌道がある？）

# スクリプトのパラメーター

|変数名|デフォルト値|説明|
|---|---|---|
|`objArea`|`[[0, 0, -2],[10, 10, 2]]`|オブジェクトを検知する範囲を指定します。<br>始点の各座標は終点の各座標よりも以下になるように指定する必要があります。<br>範囲を広げると検索に時間がかかります。|

```
// ok
local objArea = [[0, 0, 0],[1, 0, 0]];
// ng
local objArea = [[10, 10, 10],[0, 0, 0]];
```

# 既知の問題

- アイコンがスロープツールにしか表示できなかったのでスロープツールに配置されています。
  - 特殊建築物ツールに移したいですね！

# ソース
https://github.com/128na/sugoi-simutrans-squirrel-scripts
