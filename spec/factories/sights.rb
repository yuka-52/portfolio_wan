FactoryBot.define do
  factory :sight do
    user_id { 1 }
    sight_title { "MyString" }
    sight_profile { "MyText" }
    sight_place { "MyText" }
    sight_date { "2022-06-15" }
    sight_images { "" }
    sight_contact { "MyText" }
  end
end
