# テーブル設計

## usersテーブル

| Column             | Type   | Option
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_yomi    | string | null: false               |
| last_name_yomi     | string | null: false               |
| birth_date         | date   | null: false               |

## Association
- has_many :items
- has_many :buys

## itemsテーブル

| Column           | Type       | Option
| -----------------| ---------- | ------------------------------ |
| image            | string     | null: false                    |
| item_name        | text       | null: false                    |
| item_description | text       | null: false                    |
| category         | string　　　| null: false                    |
| condition        | string     | null: false                    |
| delivery_charges | string     | null: false                    |
| delivery_from    | string     | null: false                    |
| delivery_time    | string     | null: false                    |
| price            | string　　　| null: false                    |
| user_id          | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :buy


## buysテーブル

| Column        | Type       | Option
| ------------- | ---------- | ------------------------------ |
| card_number   | string　　　| null: false, unique: true      |
| card_valid    | date       | null: false                    |
| security_code | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column           | Type       | Option
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string　　　| null: false                    |
| prefectures      | text       | null: false                    |
| municipalities   | text       | null: false                    |
| house_number     | text       | null: false                    |
| building_name    | text       | null: false                    |
| telephone_number | string　　　| null: false, unique: true      |
| buy_id           | references | null: false, foreign_key: true |

## Association
- belongs_to :buy