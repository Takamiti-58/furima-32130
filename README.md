
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
- has_many :orders

## buyer テーブル

| Column          | Type     | Options                       |
| --------------- | -------- | ----------------------------- |
| post_code       | string   | null: false                   |
| prefecture_id   | integer  | null: false                   |
| city            | string   | null: false                   |
| address         | string   | null: false                   |
| building_name   | string   |                               |
| phone_number    | string   | null: false                   |
| order_id        | integer  | null: false,foreign_key: true |

### Association

- belongs_to :order


## product テーブル

| Column           | Type    | Options                      |
| ---------------- | ------- | ---------------------------- |
| name             | string  | null: false                  |
| price            | integer | null: false                  |
| description      | text    | null: false                  |
| status_id        | integer | null: false                  |
| shipping_cost_id | integer | null: false                  |
| shipping_days_id | integer | null: false                  |
| prefecture_id    | integer | null: false                  |
| category_id      | integer | null: false                  |
| user_id          | integer | null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- has_one :order

## ordersテーブル
| Column  | Type        | Options                      |
| ------- | ----------- | ---------------------------- |
| user    | references  | null: false,foreign_key: true|
| product | references  | null: false,foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user
- has_one :buyer