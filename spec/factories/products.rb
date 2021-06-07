FactoryBot.define do
  factory :product do

    product            {Faker::Lorem.sentence}
    listing_person     {Faker::Lorem.sentence}
    price              {1000}
    category_id        {3}
    product_state_id   {3}
    delivery_charge_id {3}
    prefecture_id      {3}
    delivery_date_id   {3}
    association :user
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
