# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "My cool post"
    description "Lorem ipsum"
    url "http://makersacademy.com"
  end
end
