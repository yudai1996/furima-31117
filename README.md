# テーブル設計

## usersテーブル

| Colum                       | Type    | Options     |
| --------------------------- | ------- | ----------- |
| nickname                    | string  | null: false |
| email                       | string  | null: false | 
| encrypted_password          | string  | null: false |
| family_name_hira            | string  | null: false |
| first_name_hira             | string  | null: false |
| family_name_kata            | string  | null: false |
| first_name_kata             | string  | null: false |
| day_of_birthday             | date    | null: false |

### Association

- has_many :items
- has_many :orders

-encrypted_password が存在するので、passwordとpassword_confirmationカラムは不要
-date型:自動で何月日を連続で保存(例:2020-11-09)

## itemsテーブル

| Colum                   | Type         | Options           |
| ----------------------- | ------------ | ----------------- |
| name                    | name         | null: false       |
| info                    | text         | null: false       |
| category_id             |  integer     | null: false       |
| status_id               | integer      | null: false       |
| shipping_fee_status_id  | integer      | null: false       |
| prefecture_id           | integer      | null: false       |
| delivery_scheduled_id   | integer      | null: false       |
| price                   | integer      | null: false       |
| user_id                 | references   | foreign_key: true |

### Association

-belongs_to :user

-category, status, shipping_fee_status, prefecture, delivery_scheduledに関しましてはActive Hashを用いるので、その場合のルールいに則る
-imageカラムは作成しない：ActiveStorage使用の為


## ordersテーブル

| Colum              | Type         | Options           |
| ------------------ | ------------ | ----------------- |
| item_id            | integer      | foreign_key: true |
| user_id            | integer      | foreign_key: true |

-外部apiのpay.jpを使用するので、カード情報は保存しない
 テーブルに保存すると漏洩する可能性があるので

### Association

-belongs_to :user
-has_one    :residence



## residencesテーブル

| Colum              | Type         | Options           |
| ------------------ | ------------ | ----------------- |
| postal_code        | string       | null: false       |
| prefectures_id     | integer      | null: false       |
| city               | string       | null: false       |
| house_number       | string       | null: false       |
| building           | string       |                   |
| phone_number       | string       | null: false       |
| order_id           | integer      | foreign_key: true |


-郵便番号は、string型→ハイフンを入力するので、0(頭文字)を受け付けない
-任意入力欄はnillを許可
-アソシエーションを組んでいるのでordersを外部キーで追加

### Association

-belongs_to :order
