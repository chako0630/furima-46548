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
- has_one :order_history
- belongs_to :user


## shippingsテーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postscript    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | text       | null: false                    |
| house_number  | text       | null: false                    |
| building      | text       |                                |
| phone_number  | string     | null: false                    |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- has_one :order_history
- belongs_to :item
- belongs_to :user


## order_historysテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | reference  | null: false                    |
| shipping    | reference  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :shipping

