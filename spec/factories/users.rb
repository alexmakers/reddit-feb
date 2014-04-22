# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alex, class: 'User' do
    email 'alex@example.com'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :mario, class: 'User' do
    email 'mario@example.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
