FactoryBot.define do
  factory :sight do
    user_id { 1 }
    sight_title { "sight_dog" }
    sight_profile { "Text" }
    sight_place { "Tokyo" }
    sight_date { "2022-06-15" }
    sight_images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
    sight_contact { "Police" }
  end
end
