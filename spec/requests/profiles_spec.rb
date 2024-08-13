require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /setup" do
    it "returns http success" do
      get "/profiles/setup"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update_setup" do
    it "returns http success" do
      get "/profiles/update_setup"
      expect(response).to have_http_status(:success)
    end
  end
end
