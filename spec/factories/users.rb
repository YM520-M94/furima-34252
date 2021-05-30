FactoryBot.define do
  password = "0a"+Faker::Internet.password(min_length: 6)

  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {password}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'一郎'}
    last_name_reading     {'スズキ'}
    first_name_reading    {'イチロウ'}
    birthday              {'2000-01-01'}
    
  end
end