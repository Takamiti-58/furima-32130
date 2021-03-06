require 'rails_helper'

RSpec.describe "Products", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/product/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/product/new"
      expect(response).to have_http_status(:success)
    end
  end

end
