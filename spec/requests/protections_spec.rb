require 'rails_helper'

RSpec.describe "Protections", type: :request do
  let!(:protections) { create(:protection, user: user) }
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /protections" do
    it "正常なレスポンスを返すこと" do
      get protections_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /protections" do
    it "保護犬情報が保存される" do
      protection_params = attributes_for(:protection)
      expect(Protection.last.protection_title).to eq(protection_params[:protection_title])
      expect(Protection.last.protection_breed).to eq(protection_params[:protection_breed])
      expect(Protection.last.protection_choker).to eq(protection_params[:protection_choker])
      expect(Protection.last.protection_profile).to eq(protection_params[:protection_profile])
      expect(Protection.last.protection_place).to eq(protection_params[:protection_place])
      expect(Protection.last.protection_date.strftime).to eq(protection_params[:protection_date])
      expect(Protection.last.protection_contact).to eq(protection_params[:protection_contact])
      expect(Protection.last.protection_dogtag).to eq(protection_params[:protection_dogtag])
    end
  end
end
