FactoryGirl.define do
  factory :project do
    name        Faker::Name.name
    description Faker::Lorem.paragraph
  end
end