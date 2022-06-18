FactoryBot.define do
  factory :search do
    dog_name { "Pochi" }
    dog_breed { "siba" }
    dog_age { 1 }
    dog_profile { "Text" }
    disappeared_place { "Tokyo" }
    dog_images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
  end
end
