require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /index" do
    it "正常なレスポンスを返すこと" do
      get "/searches/index"
      expect(response).to have_http_status(:success)
    end
  end
end
