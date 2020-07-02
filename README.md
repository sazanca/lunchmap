# アプリ名：lunchmap

## 概要：ランチ場所共有ツール社内用


Description
<dl>
  <dt>what</dt>
  <dd>ランチ情報を通じた社内でのコミュニケーションツール</dd>
  <dt>why</dt>
  <dd>出社していれば誰もが取るランチ、あえてランチ飲みに用途を限定する事で投稿しやすくする。</dd>
  <dt>how</dt>
  <dd>入力したお店情報をgooglemapにマーカーで一覧表示をさせて会社からの距離を可視化する</dd>
  <dd>プロフィールにランチに誘ってもOKかどうかを表示させる</dd>
  <dd>やりとりが全てツールを通し第三者も見える事でトラブル防止。</dd>

  <dt>社内コミュニケーションツールでの問題点</dt>
  <dd>一部の人だけが使い、利用率が低い。</dd>
  <dd>解決策→近隣のお店からのクーポンが表示され、予約も取れるようにする。</dd>
  <dd>解決策→福利厚生の一部（社食の代わり）として１割負担。</dd>
</dl>
Usage
社員番号でログイン
お店情報登録
お店情報に紐ずくcommentにメンションを付け個人を誘うか空いてる日で誘う
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :shops
- has_many :comments

## shopsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|menu|text|null: false|
|price|string|null: false|
|time|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :shops_tags
- has_many  :tags,  through:  :shops_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :shops_tags
- has_many  :shops ,  through:  :shops_tags

## shops_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|shop_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## mapsテーブル
|Column|Type|Options|
|------|----|-------|
|latitude|float|-------|
|longitude|float|-------|
|shop_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user
