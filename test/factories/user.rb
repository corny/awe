FactoryGirl.define do
  factory :user do
    name = Faker::Name.name
    name         Faker::Name.name
    email        Faker::Internet.email
    identity_url 'openid.tzi.org/' << name.downcase.gsub(/\W/,'_')
  end

  factory :admin, :parent => :user do
    admin true
  end
end