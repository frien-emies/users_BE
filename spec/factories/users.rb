FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    avatar { Faker::LoremFlickr.image }
  end
end
