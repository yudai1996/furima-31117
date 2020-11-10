FactoryBot.define do
  factory :item do
    name                   {Faker::Name.name}
    info                   {Faker::Lorem.sentence}
    category_id            {"3"}
    status_id              {"2"}
    shipping_fee_status_id {"2"}
    prefecture_id          {"5"}
    delivery_scheduled_id  {"2"}
    price                  {"4000"}

    association :user #ユーザーデータも同時に作成する為の記述
  end
end
