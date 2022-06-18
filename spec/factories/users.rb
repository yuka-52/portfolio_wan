FactoryBot.define do
  factory :user do
    name { "user" }
    email { "user@example.com" }
    password { "test1234" }
    password_confirmation { "test1234" }
  end
end
