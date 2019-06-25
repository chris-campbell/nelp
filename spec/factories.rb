FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@yahoo.com"
    end
    password { 'secretPassword' }
    password_confirmation { 'secretPassword' }
  end

  factory :place do
    association :user
    name { 'Chris' }
    description { 'body of the full text' }
    address { '1234 fake street' }
  end
end
