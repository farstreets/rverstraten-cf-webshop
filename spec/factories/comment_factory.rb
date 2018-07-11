FactoryBot.define do

  factory :random_comment, class: Comment do
    id { Faker::Number.number(5).to_i }
    user_id { Faker::Number.number(5).to_i }
    product_id { Faker::Number.number(5).to_i }
    body { Faker::Lorem.sentence }
    rating { Faker::Number.decimal(1,0).to_i/2 }
  end

end
