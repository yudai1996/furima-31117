FactoeryBot.define do
  factory :user do
    nickname              { Faker: :Name.name }
    email                 { Faker: :Internet.free_email }
    password = Faker: :Internet.password(min_length: 6)
    password              { password}
    password_confirmation {password}
    family_name_hira      { Faker: :Name.last_name }
    first_name_hira       { Faker: :Name.first_name }
    family_name_kata      { Faker: :Name.lasr_name }
    first_name_kata       { Faker: :Name.first_name }
    day_of_birthday       { Faker: :Date.birthday }
  end
end