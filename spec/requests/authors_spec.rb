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

  describe "GET /show" do
    let!(:category) { create(:category) }
    let!(:book) { create(:book, category_id: 1, author_id: 1) }

    before { get author_path(author) }

    it "renders a successful response" do
      expect(response).to have_http_status(:success)
    end

    it "has the current author info" do
      expect(response.body).to match(author.name)
    end

    it "shows a list with all books by the author" do
      expect(author.books).to match([book])
    end
  end
end
