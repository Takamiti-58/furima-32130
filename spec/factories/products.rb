FactoryBot.define do
  factory :product do
    name                     {"ゴリラ"}
    price                    {600}
    description              {"見かけによらず大人しい"}
    status_id                {2}
    shipping_cost_id         {2}
    shipping_days_id         {2}
    prefecture_id            {2}
    category_id              {2}
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end