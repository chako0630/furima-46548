FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Name.initials(number: 2) }
    first_name            { Faker::Name.initials(number: 2) }
    last_name_kana        { Faker::Name.initials(number: 2) }
    first_name_kana       { Faker::Name.initials(number: 2) }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
