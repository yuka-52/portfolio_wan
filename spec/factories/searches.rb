FactoryBot.define do
  factory :search do
    dog_name { "MyString" }
    dog_breed { "MyString" }
    dog_age { 1 }
    dog_profile { "MyText" }
    disappeared_place { "MyText" }
    dog_img { "MyString" }
  end
end
