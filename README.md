## usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nickname            | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |
| birthday            | date    | null: false               |

### Association
- has_many :items


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- has_one :oder_history
- belongs_to :user
- belongs_to :category
- belongs_to :shipping_area
- belongs_to :item_status
- belongs_to :shipping_fee
- belongs_to :shipping_days


## shippingsテーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postscript    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | text       | null: false                    |
| house_number  | text       | null: false                    |
| building      | text       |                                |
| phone_number  | string     | null: false                    |
| sell          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- has_one :oder_history
- belongs_to :items
- belongs_to :user
- belongs_to :shipping_area

## order_historyテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | integer    | null: false, unique: true      |
| shipping_id | integer    | null: false                    |

### Association
- belongs_to :items
- belongs_to :shipping


## categoriesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| category        | integer    | null: false, unique: true      |
| category_name   | string     | null: false                    |
 

### Association
- has_many    :items


## shipping_areasテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| area            | integer    | null: false, unique: true      |
| area_name       | string     | null: false,                   |
 

### Association
- has_many    :items
- has_many    :shippings


## shipping_feesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| fee             | integer    | null: false, unique: true      |
| fee_name        | string     | null: false                    |
 

### Association
- has_many    :items


## shipping_daysテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| shipping_day    | integer    | null: false, unique: true      |
| day_name        | string     | null: false                    |
 

### Association
- has_many    :items


## item_statusesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| status          | integer    | null: false, unique: true      |
| status_name     | string     | null: false                    |
 

### Association
- has_many    :items

