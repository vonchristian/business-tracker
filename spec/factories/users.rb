FactoryGirl.define do
  factory :user do
    first_name 'Von Christian'
    last_name 'Halip'
    sequence(:email) { |n| "email#{n}@gmail.com"}
    password 'secret12345'
  end
end
