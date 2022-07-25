FactoryBot.define do
  factory :comment do
    comment_content { "コメント" }
    association :user
    association :search
  end
end
