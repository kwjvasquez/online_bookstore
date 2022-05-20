# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "date of birth matcher" do
    let(:date_of_birth) { subject.date_of_birth.to_s }

    it "has the YYYY-MM-DD format" do
      expect(date_of_birth).to match(/\A\d{4}\b-\d{1,2}\b-\d{1,2}\z/)
    end
  end
end
