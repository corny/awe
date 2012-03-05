FactoryGirl.define do
  factory :user do
    name       Faker::Name.name
    email      Faker::Internet.email
    openid_url 'openid.tzi.org/'
  end

  factory :admin, :parent => :user do
    admin true
  end
end