FactoryBot.define do
  factory :cycle do
    name   { 'サービス１' }
    detail { 'サービス１の詳細です' }
    price  { 200 }

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
