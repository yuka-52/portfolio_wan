FactoryBot.define do
  factory :protection do
    user
    protection_images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
    protection_title { "MyString" }
    protection_breed { "MyString" }
    protection_profile { "MyText" }
    protection_place { "MyText" }
    protection_date { "2022-06-14" }
    protection_contact { "MyText" }
    protection_choker { "MyString" }
    protection_dogtag { "MyString" }
    contacted_institution { "MyText" }
  end
end
