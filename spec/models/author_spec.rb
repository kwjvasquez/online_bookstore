# frozen_string_literal: true

require "rails_helper"

RSpec.describe Author, type: :model do
  subject { create(:author) }

  describe "associations" do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
