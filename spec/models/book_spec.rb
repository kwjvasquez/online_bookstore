# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  subject { create(:book, author_id: 1, category_id: 1) }

  let!(:author) { create(:author) }
  let!(:category) { create(:category) }

  describe "validations" do
    describe "presence" do
      it { is_expected.to validate_presence_of(:code) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:number_of_pages) }
      it { is_expected.to validate_presence_of(:date_published) }
    end

    it { is_expected.to validate_uniqueness_of(:code) }
    it { is_expected.to validate_length_of(:name).is_at_most(30) }
    it { is_expected.to validate_numericality_of(:number_of_pages).only_integer }
    it { is_expected.to allow_value(subject.name).for(:name) }
  end

  describe "matchers" do
    let(:name) { subject.name }
    let(:price) { subject.price.to_f.to_s }

    it "does not accept special characters" do
      expect(name).to match(/\A[a-zA-Z0-9 ]*\z/)
    end

    it "must have two decimal numbers" do
      expect(price).to match(/\A\d{1,4}\.\d{2}\z/)
    end
  end
end
