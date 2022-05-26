# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Books", type: :request do
  let!(:author) { create(:author) }
  let!(:category) { create(:category) }
  let!(:book) { create(:book, category_id: 1, author_id: 1) }

  describe "GET /index" do
    before { get books_path }

    it "renders a successful response" do
      expect(response).to have_http_status(:success)
    end

    it "show a list with all books" do
      expect(assigns(:books)).to match([book])
    end
  end

  describe "GET /show" do
    before { get book_path(book) }

    it "renders a successful response" do
      expect(response).to have_http_status(:success)
    end

    it "has the current book info" do
      expect(response.body).to match(book.code)
      expect(response.body).to match(book.name)
      expect(response.body).to match(book.description)
    end
  end
end
