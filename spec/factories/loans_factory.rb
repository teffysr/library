FactoryBot.define do
  factory :loan do
    association :user
    association :book
    return_date { nil }
    returned { false }
  end
end
