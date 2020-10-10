FactoryBot.define do
  factory :review do
    title { 'レビューのタイトル' }
    detail { 'レビューの内容です。' }
    area_id { 3 }
    rate { 5 }
    association :user
    association :cycle
  end
end
