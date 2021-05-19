# テーブル設計

## users テーブル

| Column       | Type   | Options                   |
| ------------ | -------| ------------------------- |
| nickname     | string | null: false, unique: true |
| email        | string | null: false               |
| password     | string | null: false               |
| name         | string | null: false               |
| name_reading | string | null: false               |
| birthday     | string | null: false               |

### Association

- has_many :products
- has_many :purchasers, through: :user_purchasers

## products テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| product_name    | string     | null: false                    |
| image           | string     | null: false                    |
| price           | string     | null: false                    |
| listing_person  | string     | null: false                    |
| category        | string     | null: false                    |
| product_state   | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| delivery_area   | string     | null: false                    |
| delivery_date   | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one   :purchaser

## purchasers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :users, through: :user_purchasers
- belongs_to  :purchaser

## user_purchasers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| purchaser | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :purchaser