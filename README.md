# テーブル設計

## users テーブル

| Column                | Type    | Options        |
| --------------------- | ------- | -------------- |
| nickname              | string  | null: false    |
| email                 | string  | null: false    |
| password              | string  | null: false    |
| password_confirmation | string  | null: false    |
| admin                 | boolean | default: false |

### Association
-has_many :reviews
-has_many :comments

## cycle テーブル

| Column | Type    | Options     |
| ------ | ------  | ----------- |
| name   | string  | null: false |
| detail | text    | null: false |
| price  | integer | null: false |

### Association
-has_many :reviews

## review テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| detail  | text       | null: false                    |
| area_id | integer    | null: false                    |
| cycle   | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| rate    | float      | null: false, default: 0        |

### Association
-belongs_to :user
-belongs_to :cycle

## comment テーブル

| Column | Type       | Options                        |
| ------ | -------    | ------------------------------ |
| detail | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |


### Association
-belongs_to :user
-belongs_to :review