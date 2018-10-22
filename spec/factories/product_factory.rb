FactoryBot.define do

  factory :random_product, class: Product do
    id { Faker::Number.number(5).to_i }
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
  end

  factory :no_name_product, class: Product do
    id { Faker::Number.number(5).to_i }
    name { "" }
    description { Faker::Lorem.sentence }
  end

end
