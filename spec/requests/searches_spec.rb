require 'rails_helper'

RSpec.describe "Searches", type: :request do
  let!(:user) { create(:user) }
  let!(:searches) { create(:search, user: user) }

  describe "GET /index" do
    before do
      sign_in user
    end

    it "正常なレスポンスを返すこと" do
      get "/searches/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /searches" do
    before do
      sign_in user
    end

    it "迷子犬情報が保存される" do
      search_params = attributes_for(:search)
      expect(Search.last.search_title).to eq(search_params[:search_title])
      expect(Search.last.dog_breed).to eq(search_params[:dog_breed])
      expect(Search.last.dog_age).to eq(search_params[:dog_age])
      expect(Search.last.dog_profile).to eq(search_params[:dog_profile])
      expect(Search.last.disappeared_place).to eq(search_params[:disappeared_place])
      expect(Search.last.disappeared_date.strftime).to eq(search_params[:disappeared_date])
      expect(Search.last.contact).to eq(search_params[:contact])
    end
  end
end
