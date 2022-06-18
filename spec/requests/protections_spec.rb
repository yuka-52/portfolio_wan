require 'rails_helper'

RSpec.describe "Protections", type: :request do
  describe "GET /index" do
      let(:protection) { create(:protection) }

    it "正常なレスポンスを返すこと" do
      get "/protections/index"
      expect(response).to have_http_status(:ok)
    end
  end
end
