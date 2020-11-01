# アプリ名：lunchmap

## 概要：ランチ場所共有ツール

<dl>
  <dd>ランチを通して社内コミュニケーションのきっかけと地域活性化を目指しています</dd>
  <dd>会社近くのおすすめのランチ場所を共有したり、同じ店に行きたい人を、一目でわかるアプリです</dd>
  <dt>制作背景</dt>
  <dd>社内コミュニケーション不足の課題解決のために、このアプリを開発しました。</dd>
  <dd>前職の職場環境は他社（雇用形態が異なる）方々が、多く在籍していました。</dd>
  <dd>しかし、コミュニケーションが取れる機会がなかった。ランチはどんな形でも必ず取るため、</dd>
  <dd>職場周りのランチ場所は会話のきっかけ作りとなり、好みを知る事で、人柄を知り、</dd>
  <dd>声をかけ易くなり、仕事の効率化が上がると考えたためこのアプリを作りました。</dd>
  <dd>会社や部署事などにアプリ限定で割引クーポンを発行し、飲食店の混雑緩和や地域飲食店貢献を目指し循環型の継続システム</dd>
  <dt>使用方法/アプリ機能</dt>
  <dd>お店情報登録</dd>
</dl>

[![Image from Gyazo](https://i.gyazo.com/7eac64ec33c141b7b6fbbbd793199d6e.png)](https://gyazo.com/7eac64ec33c141b7b6fbbbd793199d6e)

[![Image from Gyazo](https://i.gyazo.com/2a824e2a7ab9f629d0609934d8d89ab3.png)](https://gyazo.com/2a824e2a7ab9f629d0609934d8d89ab3)

[![Image from Gyazo](https://i.gyazo.com/c8ed3bbb669e62ab5ef5fa235e526346.gif)](https://gyazo.com/c8ed3bbb669e62ab5ef5fa235e526346)
<dl>
  <dt>主な機能</dt>
  <dd>店舗情報登録</dd>
  <dd>googlemapsに店舗情報を登録</dd>
  <dd>クーポン利用</dd>
  <dd>コメント機能</dd>
  <dd>タグ検索</dd>
  <dd>いいね登録</dd>
  <dt>今後追加したい機能<dd>
  <dd>社員番号でログイン</dd>
  <dd>管理者画面</dd> 
  <dd>マッチング機能</dd>
  <dd>slackで共有</dd>
  <dd>レコメンド機能</dd>
</dl>

<dl>
  <dt>現時点での課題</dt>
  <dd>検索結果該当なしの場合結果が表示されない</dd>
  <dd>対応</dd>
  <dd>countを使い結果数を表示させることで対応 2020.10.28</dd>
  <dd>タグからリスト一覧に飛ぶ<dd>
  <dt>対策・原因</dt>
  <dd>タグの使い方のおさらい。gemで導入して使い方の理解不足</dd>
  <dd>プロフィールの取得がユーザー別ではなく全取得になる</dd>
  <dt>対策・原因</dt>
  <dd>usersテーブルとの親子関係がコントローラーによって定義出来ていない</dd>
  <dd>topページマップのマーカークリックイベントの表示データが住所でわかりにくい</dd>
  <dt>対策・原因</dt>
  <dd>DBから引き渡すparameterかjs表示させるコード選択によるもの？</dd>
</dl>  


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :shops
- has_many :comments
- has_one :profile

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|favoriteshop|text|null: false|
||string|null: false|
### Association
- belongs_to :user

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
- has_one :map


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :shops_tags
- has_many  :shops ,  through:  :shops_tags

## mapsテーブル
|Column|Type|Options|
|------|----|-------|
|address|text|-------|
|latitude|float|-------|
|longitude|float|-------|
|shop_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :shop


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :shop
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|shop_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :shop
- belongs_to :user

## matchsテーブル
|Column|Type|Options|
|------|----|-------|