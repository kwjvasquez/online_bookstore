# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tags", type: :request do
  let!(:author) { create(:author) }
  let!(:category) { create(:category) }
  let!(:book) { create(:book, category_id: 1, author_id: 1, tag_list: "tag 1") }
  let!(:tag) { ActsAsTaggableOn::Tag.find(1) }

  describe "GET /index" do
    before { get tags_path }

    it "renders a successful response" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before { get tag_path(tag) }

    it "renders a successful response" do
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "shows the tag name" do
      expect(response.body).to match(tag.name)
    end
  end
end
