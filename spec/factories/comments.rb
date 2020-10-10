FactoryBot.define do
  factory :comment do
    text { 'すごく良かったです' }
    association :user
    association :review
  end
end
