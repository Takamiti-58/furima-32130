FactoryBot.define do
  factory :user_payment do
    post_code              {"123-1235"}
    prefecture_id          {2}
    city                   {"東京都"}
    address                {"青山1-1-1"}
    phone_number           {39033324587}
    token                  {"tok_6ce04855a5cfbe536019148ef8c2"}
  end
end
