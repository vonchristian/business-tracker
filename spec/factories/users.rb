FactoryGirl.define do
  factory :user do
    first_name 'Von Christian'
    last_name 'Halip'
    sequence(:email) { |n| "#{}person#{n}@example.com" }
    password 'secret12345'
    password_confirmation 'secret12345'

    trait :admin do
      role 'system_administrator'
    end
  end
end
