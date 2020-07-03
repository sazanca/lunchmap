# アプリ名：lunchmap

## 概要：ランチ場所共有ツール

<dl>
  <dt>ランチを通して社内コミュニケーションのきっかけを作りたい。</dt>
  <dt>作成背景</dt>
  <dd>課題を書く
  業務効率化のため
  職場に馴染むまでには個人差がある。IT企業は規模が大きくなるほど、自社社員以外の人が増える</dd>
  <dd>ランチはどんな形でも必ず取る。</dd>
  <dd>職場周りのランチ場所は会話のきっかけ作り</dd>
  <dd>職場環境に早く馴染める人は離職率が低くなる</dd>
  <dd>私自身が、勤務場所が途中から変更になった。</dd>
  <dd>業務内容は変わらないが職場環境が変わることも物がどこにあるか聞かなければ分からないという事が発生する</dd>
  <dd>食べる事が好きな私は近隣のランチ場所を調べては食べに行っていた。そうするとランチ場所の情報交換やおすすめの場所を共有する事で、他部署の人とも仲良くなれた。</dd>
  <dd>仕事以外に会話をした事で仕事として対応するだけでなく、一人の人として対応するようになり、以前よりやり取りがし易くなった</dd>
  <dt>使用方法</dt>
  <dd>入力したお店情報をgooglemapにマーカーで一覧表示をさせて会社からの距離を可視化する</dd>
  <dd>プロフィールにランチに誘ってもOKかどうかを表示させる</dd>
  <dd>やりとりが全てツールを通し第三者も見える事でトラブル防止。</dd>
  <dt>社内コミュニケーションツールでの問題点</dt>
  <dd>一部の人だけが使い、利用率が低い。</dd>
  <dd>解決策→近隣のお店からのクーポンが表示され、予約も取れるようにする。</dd>
  <dd>解決策→福利厚生の一部（社食の代わり）として１割負担。</dd>
</dl>

[![Image from Gyazo](https://i.gyazo.com/7eac64ec33c141b7b6fbbbd793199d6e.png)](https://gyazo.com/7eac64ec33c141b7b6fbbbd793199d6e)

[![Image from Gyazo](https://i.gyazo.com/2a824e2a7ab9f629d0609934d8d89ab3.png)](https://gyazo.com/2a824e2a7ab9f629d0609934d8d89ab3)

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
