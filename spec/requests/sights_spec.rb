require 'rails_helper'

RSpec.describe "Sights", type: :request do
  let!(:sights) { create(:sight, user: user) }
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /sights" do
    it "正常なレスポンスを返すこと" do
      get sights_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /sights" do
    it "目撃犬情報が保存される" do
      sight_params = attributes_for(:sight)
      expect(Sight.last.sight_title).to eq(sight_params[:sight_title])
      expect(Sight.last.sight_profile).to eq(sight_params[:sight_profile])
      expect(Sight.last.sight_place).to eq(sight_params[:sight_place])
      expect(Sight.last.sight_date.strftime).to eq(sight_params[:sight_date])
      expect(Sight.last.sight_contact).to eq(sight_params[:sight_contact])
    end
  end
end
