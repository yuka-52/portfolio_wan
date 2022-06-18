FactoryBot.define do
  factory :sight do
    user_id { 1 }
    sight_title { "MyString" }
    sight_profile { "MyText" }
    sight_place { "MyText" }
    sight_date { "2022-06-15" }
    sight_images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
    sight_contact { "MyText" }
  end
end
