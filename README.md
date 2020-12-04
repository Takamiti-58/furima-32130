
# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| member               | text   |             |
| birth_day            | date   | null: false |
### Association

- has_many :products dependent: :destroy
- belongs_to :buyer dependent: :destroy
- belongs_to :card dependent: :destroy

## buyer テーブル

| Column          | Type     | Options                     |
| --------------- | -------- | --------------------------- |
| last_name       | string   | null: false                 |
| first_name      | string   | null: false                 |
| last_name_kana  | string   | null: false                 |
| first_name_kana | string   | null: false                 |
| post_code       | string   | null: false                 |
| prefecture      | string   | null: false                 |
| city            | string   | null: false                 |
| address         | string   | null: false                 |
| building_name   | string   |                             |
| phone_number    | string   |                             |
| user_id         | integer  |null:false, foreign_key: true|

### Association

- belongs_to :user

## category テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

### Association

- has_many :products

## product テーブル

| Column        | Type    | Options                      |
| ------------- | ------- | ---------------------------- |
| name          | string  | null: false                  |
| price         | integer | null: false                  |
| description   | text    | null: false                  |
| status        | string  | null: false                  |
| size          | string  | null: false                  |
| shipping_cost | string  | null: false                  |
| shipping_days | string  | null: false                  |
| prefecture_id | string  | null: false                  |
| judgment      | string  |                              |
| category_id   | integer | null:false, foreign_key: true|
| brand_id      | integer | null:false, foreign_key: true|
| shipping_id   | integer | null:false, foreign_key: true|
| user_id       | integer | null:false, foreign_key: true|

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to_active_hash:prefecture

## integer テーブル

| Column     | Type     | Options                     |
| ---------- | -------- | --------------------------- |
| image      | string   | null: false                 |
| product_id | integer  |null:false, foreign_key: true|

### Association
- belongs_to :product

## brand テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | index: true |

### Association
- has_many :Products