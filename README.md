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

| Column              | Type       | Option
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| delivery_from_id    | integer    | null: false                    |
| delivery_time_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :buy


## buysテーブル

| Column | Type       | Option
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column           | Type       | Option
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string　　　| null: false                    |
| delivery_from_id | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string　　　| null: false                    |
| buy              | references | null: false, foreign_key: true |

## Association
- belongs_to :buy