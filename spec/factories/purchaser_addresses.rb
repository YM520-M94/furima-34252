FactoryBot.define do
  factory :purchaser_address do
    postal_code   { '123-4567' }
    prefecture_id { 5 }
    city          { '東京都' }
    block         { '1-1' }
    building_name { '東京ハイツ' }
    phone_number  { '09012345678' }
    token         { 'tok_63c5de3e474611fea7b822162869'}
  end
end
