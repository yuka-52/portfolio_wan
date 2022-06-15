require 'rails_helper'

RSpec.describe "Sights", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sights/index"
      expect(response).to have_http_status(:success)
    end
  end

end
