# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  subject { create(:comment, book_id: 1, user_id: 1) }

  let!(:user) { create(:user) }
  let!(:author) { create(:author) }
  let!(:category) { create(:category) }
  let!(:book) { create(:book, author_id: 1, category_id: 1, active: false) }

  describe "associations" do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_uniqueness_of(:book_id).scoped_to(:user_id) }
  end
end
