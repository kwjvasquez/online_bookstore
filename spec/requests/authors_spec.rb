# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Authors", type: :request do
  let!(:author) { create(:author) }

  describe "GET /index" do
    before { get authors_path }

    it "renders a successful response" do
      expect(response).to have_http_status(:success)
    end

    it "show a list with all authors" do
      expect(assigns(:authors)).to match([author])
    end
  end
end
