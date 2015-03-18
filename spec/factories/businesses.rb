FactoryGirl.define do
  factory :business do
    business_name 'awesome business'
    industry_type 'banks'
    business_type 'retailers'
    address_sitio 'Kamelbeng'
    address_barangay 'Poblacion'
    address_municipality 'Tinoc'
    address_province 'Ifugao'
    no_of_employees '2'
    type_of_organization 'corporation'
    asset_size 10_000
    capital 50_000
  end

end
