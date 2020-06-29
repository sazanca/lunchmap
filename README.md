## usersテーブル
|Column|Type|Options|
|------|----|-------|
|password|string|null: false|
|username|string|null: false|
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
- has_many :shop,  through:  :shops_tags

## shops_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|shop_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :shops
- belongs_to :tag

## mapsテーブル
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false, foreign_key: true|
|address|----|-------|
|let|----|-------|
|ing|----|-------|
|type|----|-------|
|shop_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :shops
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :shops
- belongs_to :user
