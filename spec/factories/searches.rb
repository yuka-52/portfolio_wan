FactoryBot.define do
  factory :search do
    dog_name { "MyString" }
    dog_breed { "MyString" }
    dog_age { 1 }
    dog_profile { "MyText" }
    disappeared_place { "MyText" }
    dog_images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg') ] }
  end
end
