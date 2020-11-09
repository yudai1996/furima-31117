FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    last_name_hira        { "田中" }
    first_name_hira       { "太郎" }
    last_name_kata        { "タナカ" }
    first_name_kata       { "タロウ" }
    day_of_birthday       { Faker::Date.birthday }
  end
end

