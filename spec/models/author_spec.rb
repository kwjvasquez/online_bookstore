# frozen_string_literal: true

require "rails_helper"

RSpec.describe Author, type: :model do
  subject { create(:author) }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
