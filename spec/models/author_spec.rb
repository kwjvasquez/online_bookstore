# frozen_string_literal: true

require "rails_helper"

RSpec.describe Author, type: :model do
  describe "validations" do
    subject { Author.create attributes_for(:author) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
