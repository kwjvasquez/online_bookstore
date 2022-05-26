# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Welcomes", type: :request do
  describe "GET /index" do
    before { get new_request_book_path }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /request_books" do
    let!(:author) { create(:author) }
    let!(:category) { create(:category) }
    let!(:book) { create(:book, category_id: 1, author_id: 1) }
    let!(:user) { create(:user) }

    let(:data_request) { { user_id: 1, book_id: 1 } }

    it "creates a new request book" do
      expect do
        post request_books_path, params: { request_book: data_request }
      end.to change(RequestBook, :count).by(1)
    end
  end
end
