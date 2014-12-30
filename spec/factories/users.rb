FactoryGirl.define do
  factory :user do
    first_name 'Von Christian'
    last_name 'Halip'
    sequence(:email) { |n| "email#{n}@example.com" }
    password 'secretpassword'
    # password_confirmation 'secretpassword'
  end

end
