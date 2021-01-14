# Simutrans スクリプト集

範囲操作系のスクリプト集です。


## 導入方法

使用したいスクリプトと共通ライブラリを指定フォルダに入れてください。

1. カーソル（メニューアイコン）ファイル `cursor.スクリプト名.pak` をpakフォルダに設置する
1. ライブラリファイル `lib_ライブラリ名.nut` はpak/toolフォルダに設置する
1. スクリプトフォルダをpak/toolフォルダに設置する

```
pakXYZ
┣━ cursor.スクリプト名１.pak
┣━ cursor.スクリプト名２.pak
┃  ...
┣━ tool
┃   ┣━ lib_obj_finder_v2.nut
┃   ┣━ lib_mark_v1.nut
┃   ┣━ lib_filler_v2.nut
┃   ┣━ スクリプト名１
┃   ┃   ┣━ tool.nut
┃   ┃   ┗━ description.tab
┃   ┣━ スクリプト名２
┃   ┃  ...
```

## スクリプト一覧

|フォルダ名|名前|方式|要求バージョン|要求バージョン(OTRP)|
|---             |---                                    |:---:|---|---  |
|way_filler      |[軌道範囲建設](/way_filler)             |A  |120.1|     |
|grid_filler     |[範囲碁盤目建設](/grid_filler)          |A  |120.1|     |
|wayobj_filler   |[架線範囲建設](/wayobj_filler)          |A  |-    |v29_2|
|platform_filler |[ホーム範囲建設](/platform_filler)      |A  |120.1|     |
|sign_filler     |[標識範囲建設](/sign_filler)            |A  |-    |v29_2|
|clear_once      |[範囲撤去](/clear_once)                 |   |120.1|     |
|clear_force     |[範囲全撤去](/clear_force)              |   |120.1|     |
|vehicle_info    |[車両・路線情報チェッカー](/vehicle_info)|   |120.1|     |

### 方式A：アドオン設置定義方式

マップ内の特定座標に軌道などを設置することで敷設するアドオンを選択させるタイプのスクリプトです。
アドオンやpakセットに依存しないため、高度の柔軟性を維持しつつ臨機応変に利用できます。
詳細は各スクリプトフォルダ内のreadmeを確認してください。


#### パラメーター

|変数名|デフォルト値|説明|
|---|---|---|
|`area`|`[[0, 0, -2],[10, 10, 2]]`|オブジェクトを検知する範囲を指定します。範囲を広げると検索に時間がかかります。|


## 追加予定

思いついたら


## 既知の問題

- アイコンがスロープツールにしか表示できなかったのでスロープツールに配置されています。
  - ※おそらく次回リリースで修正されるっぽいです（v29_2で修正済み）


# ソース
https://github.com/128na/sugoi-simutrans-squirrel-scripts


## メモ

- [memo.md](/memo.md)


# 更新履歴

- [changelog.md](/changelog.md)
