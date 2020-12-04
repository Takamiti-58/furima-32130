
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
| birth_day            | date   | null: false |
### Association

- has_many :products
- has_many :buyers

## buyer テーブル

| Column          | Type     | Options                       |
| --------------- | -------- | ----------------------------- |
| post_code       | string   | null: false                   |
| prefecture      | integer  | null: false                   |
| city            | string   | null: false                   |
| address         | string   | null: false                   |
| building_name   | string   |                               |
| phone_number    | string   | null: false                   |

### Association

- belongs_to :user


## product テーブル

| Column        | Type    | Options                      |
| ------------- | ------- | ---------------------------- |
| name          | string  | null: false                  |
| price         | integer | null: false                  |
| description   | text    | null: false                  |
| status        | string  | null: false                  |
| shipping_cost | string  | null: false                  |
| shipping_days | string  | null: false                  |
| prefecture_id | string  | null: false                  |
| judgment      | string  |                              |
| category_id   | integer | null:false, foreign_key: true|
| user_id       | integer | null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to_active_hash:prefecture
- has_one :order

## ordersテーブル
| Column  | Type        | Options                  |
| ------- | ----------- | ------------------------ |
| user    | integer     | null:false               |
| product | references  | null: false, foreign_key |

### Association
- has_many :products
- has_many :users
- 