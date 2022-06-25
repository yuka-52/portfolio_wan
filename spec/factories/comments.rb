FactoryBot.define do
  factory :comment do
    comment_content { "MyString" }
    user { nil }
    search { nil }
  end
end
