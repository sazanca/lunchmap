# アプリ名：lunchmap

## 概要：ランチ場所共有ツール

<dl>
  <dd>ランチを通して社内コミュニケーションのきっかけを作る事ができます</dd>
  <dd>会社近くのおすすめのランチ場所を共有したり、同じに店に行きたい人を一目でわかるアプリです</dd>
  <dt>制作背景</dt>
  <dd>社内コミュニケーション不足の課題解決のために、このアプリを開発しました。</dd>
  <dd>前職の職場環境は他社（雇用形態が異なる）方々が多く在籍していました。</dd>
  <dd>しかしコミュニケーションが取れる機会がなかった。ランチはどんな形でも必ず取るため、</dd>
  <dd>職場周りのランチ場所は会話のきっかけ作りとなり、好みを知る事で、人柄を知り、</dd>
  <dd>声をかけ易くなり、仕事の効率化が上がると考えたためこのアプリを作りました。</dd>
  <dt>使用方法/アプリ機能</dt>
  <dd>お店情報登録</dd>
  <dt>社内コミュニケーションツールでの問題点</dt>
  <dd>やりとりが全てツールを通し第三者も見える事でトラブル防止。</dd>
  <dd>一部の人だけが使い、利用率が低い。</dd>
  <dd>解決策→近隣のお店からのクーポンが表示され、予約も取れるようにする。</dd>
  <dd>解決策→福利厚生の一部（社食の代わり）として１割負担。</dd>
</dl>

[![Image from Gyazo](https://i.gyazo.com/7eac64ec33c141b7b6fbbbd793199d6e.png)](https://gyazo.com/7eac64ec33c141b7b6fbbbd793199d6e)

[![Image from Gyazo](https://i.gyazo.com/2a824e2a7ab9f629d0609934d8d89ab3.png)](https://gyazo.com/2a824e2a7ab9f629d0609934d8d89ab3)

<dl>
  <dd>主な機能</dd>
  <dt>店舗情報登録</dt>
  <dd>今後追加したい機能<dd>
  <dt>社員番号でログイン</dt>
  <dt>googlemapsに店舗情報を登録</dt>
  <dt>コメント機能</dt>
  <dt>タグ検索</dt>
</dl>


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
