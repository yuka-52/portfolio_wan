FactoryBot.define do
  factory :board do
    board_content { "MyString" }
    user { nil }
    sight { nil }
  end
end
