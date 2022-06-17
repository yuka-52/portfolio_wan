require 'rails_helper'

RSpec.describe "Protections", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/protections/index"
      expect(response).to have_http_status(:success)
    end
  end
end
