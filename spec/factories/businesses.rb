FactoryGirl.define do
  factory :business do
    sequence(:business_name) { |n| "{n}business-name"}
    sequence(:address_barangay) { |n| "{n}address_barangay"}
    industry_type 'banks'
    business_type 'retailers'
    address_sitio 'Kamelbeng'
    address_municipality 'Tinoc'
    address_province 'Ifugao'
    no_of_employees '2'
    type_of_organization 'corporation'
    asset_size '100000'
    capital '50000'

  end

end
