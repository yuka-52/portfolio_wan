FactoryBot.define do
  factory :board do
    board_content { "コメント" }
    association :user
    association :sight
  end
end
