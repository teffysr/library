FactoryBot.define do
  factory :user do
    name { 'John Doe'}
    identification { '123456789'}
    email { 'john0@example.com'}
    address { '123 Main St'}
    phone { '555-123-4567'}
  end
end
