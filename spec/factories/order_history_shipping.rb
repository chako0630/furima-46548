FactoryBot.define do
  factory :order_history_shipping do
    postscript { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }

    association :user
    association :item
  end
end
