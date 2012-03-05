Factory.sequence :email do |n|
  "user#{n}@example.com"
end

FactoryGirl.define do
  factory :user do
    name         { Faker::Name.name }
    email        { Factory.next :email }
    identity_url { 'openid.tzi.org/' << email.split("@").first }
  end

  factory :admin, :parent => :user do
    admin true
  end
end