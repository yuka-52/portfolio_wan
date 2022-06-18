require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe "GET /tops/index" do

    it "正常なレスポンスを返すこと" do
      get "/tops/index"
      expect(response).to have_http_status(:success)
    end
  end
end
