FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"ab12345"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太朗"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {"2001-3-29"}
  end
end
