# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_reading | string | null: false               |
| last_name_reading  | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :purchasers

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | string     | null: false                    |
| price              | integer    | null: false                    |
| listing_person     | text       | null: false                    |
| category_id        | integer    | null: false                    |
| product_state_id   | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one   :purchaser

## purchasers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchaser
- has_one :addresse

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchaser     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchaser