FactoryBot.define do
  factory :residence do
    postal_code           { 123-4567 }
    prefecture_id         {"3"}
    city                  { "青森町" }
    house_number          { "青山1-1-1" }
    building              { "マンション"}
    phone_number          { Faker::PhoneNumber.phone_number }
  end
end
