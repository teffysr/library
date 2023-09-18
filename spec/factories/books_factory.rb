FactoryBot.define do
  factory :book do
    title { 'El maestro de la fuga' }
    author { 'Jonathan Freedland' }
    editorial { 'Editorial Planeta' }
    available { true }
  end
end
