FactoryBot.define do
  factory :protection do
    user
    protection_images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
    protection_title { "protection_dog" }
    protection_breed { "siba" }
    protection_profile { "Text" }
    protection_place { "Tokyo" }
    protection_date { "2022-06-14" }
    protection_contact { "Contact" }
    protection_choker { "No" }
    protection_dogtag { "Yes" }
    contacted_institution { "Police" }
  end
end
