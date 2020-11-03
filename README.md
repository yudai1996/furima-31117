# テーブル設計

## usersテーブル

| Colum                       | Type    | Options     |
| --------------------------- | ------- | ----------- |
| name                        | string  | null: false |
| email                       | string  | null: false |
| password                    | text    | null: false |
| password_confirmation       | text    | null: false |
| family_name_hira            | string  | null: false |
| first_name_hira             | string  | null: false |
| family_name_kata            | string  | null: false |
| first_name_kata             | string  | null: false |
| day_of_birthday             | integer | null: false |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Colum                     | Type         | Options           |
| ------------------------- | ------------ | ----------------- |
| item_name                 | text         | null: false       |
| item_info                 | text         | null: false       |
| item_category             | string       | null: false       |
| item_status               | string       | null: false       |
| shipping_fee_status       | string       | null: false       |
| item_prefecture           | string       | null: false       |
| delivery_scheduled        | string       | null: false       |
| item_price                | integer      | null: false       |
| image                     |              | null: false       |
| user_id                   | references   | foreign_key: true |

### Association

-belongs_to :users


## ordersテーブル

| Colum              | Type         | Options           |
| ------------------ | ------------ | ----------------- |
| card_number        | integer      | null: false       |
| expiration_month   | integer      | null: false       |
| expiration_year    | integer      | null: false       |
| security_code      | integer      | null: false       |
| item_id            | references   | foreign_key: true |
| user_id            | references   | foreign_key: true |




### Association

-belongs_to :users
-belong_to  :prototype
-has_one    :residence



## residencesテーブル

| Colum              | Type         | Options           |
| ------------------ | ------------ | ----------------- |
| postal_code        | integer      | null: false       |
| prefectures        | string       | null: false       |
| city               | text         | null: false       |
| house_number       | text         | null: false       |
| building           | text         | null: false       |
| phone_number       | integer      | null: false       |




### Association

-belongs_to :orders
