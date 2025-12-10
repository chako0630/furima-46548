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
- has_many :sells
- has_many :comments


## sellsテーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| item_status   | integer    | null: false                    |
| shipping_fee  | integer    | null: false                    |
| shipping_area | integer    | null: false                    |
| shipping_days | integer    | null: false                    |
| price         | float      | null: false                    |
| commission    | float      | null: false                    |
| profit        | float      | null: false                    |
| favorite      | integer    |                                |
| report        | integer    |                                |
| flag_sold     | integer    | null: false                    |
| sell_user_id  | references | null: false, foreign_key: true |

### Association
- has_many    :comments
- belongs_to :category
- belongs_to :shipping_area
- belongs_to :item_status
- belongs_to :shipping_fee
- belongs_to :shipping_days


## shippingsテーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postscript    | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | text       | null: false                    |
| house_number  | text       | null: false                    |
| building      | text       |                                |
| phone_number  | string     | null: false                    |
| sell_id       | references | null: false, foreign_key: true |
| buy_user_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :sell
- belongs_to :user
- belongs_to :shipping_area


## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | text       | null: false                    |
| sells_id   | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |  

### Association
- belongs_to :sell
- belongs_to :user


## categoriesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| category        | integer    | null: false, unique: true      |
| category_name   | string     | null: false                    |
 

### Association
- has_many    :sells


## shipping_areasテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| area            | integer    | null: false, unique: true      |
| area_name       | string     | null: false,                   |
 

### Association
- has_many    :sells
- has_many    :shippings


## shipping_feesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| fee             | integer    | null: false, unique: true      |
| fee_name        | string     | null: false                    |
 

### Association
- has_many    :sells


## shipping_daysテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| shipping_day    | integer    | null: false, unique: true      |
| day_name        | string     | null: false                    |
 

### Association
- has_many    :sells


## item_statusesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| status          | integer    | null: false, unique: true      |
| status_name     | string     | null: false                    |
 

### Association
- has_many    :sells

