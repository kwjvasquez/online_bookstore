# frozen_string_literal: true

require "rails_helper"

RSpec.describe RequestBook, type: :model do
  subject { FactoryBot.create(:request_book, book_id: 1, user_id: 1) }

  let!(:user) { create(:user) }
  let!(:author) { create(:author) }
  let!(:category) { create(:category) }
  let!(:book) { create(:book, author_id: 1, category_id: 1, active: false) }

  describe "associations" do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end

  describe "#state" do
    it { is_expected.to transition_from(:pending).to(:processing).on_event(:review) }
    it { is_expected.to transition_from(:processing).to(:completed).on_event(:ready) }
    it { is_expected.to transition_from(:pending).to(:canceled).on_event(:cancel) }
    it { is_expected.to transition_from(:processing).to(:canceled).on_event(:cancel) }

    context "with the default state" do
      it { is_expected.to have_state(:pending) }
      it { is_expected.to allow_event(:review) }
      it { is_expected.to allow_event(:cancel) }
      it { is_expected.not_to allow_event(:ready) }
      it { is_expected.to allow_transition_to(:processing) }
      it { is_expected.to allow_transition_to(:canceled) }
      it { is_expected.not_to allow_transition_to(:completed) }
    end

    context "with the processing state" do
      before { subject.update(state: "processing") }

      it { is_expected.to have_state(:processing) }
      it { is_expected.to allow_event(:ready) }
      it { is_expected.to allow_event(:cancel) }
      it { is_expected.not_to allow_event(:review) }
      it { is_expected.to allow_transition_to(:completed) }
      it { is_expected.to allow_transition_to(:canceled) }
      it { is_expected.not_to allow_transition_to(:pending) }
    end

    context "with the completed state" do
      before { subject.update(state: "completed") }

      it { is_expected.to have_state(:completed) }
      it { is_expected.not_to allow_event(:review) }
      it { is_expected.not_to allow_event(:ready) }
      it { is_expected.not_to allow_event(:cancel) }
      it { is_expected.not_to allow_transition_to(:pending) }
      it { is_expected.not_to allow_transition_to(:processing) }
      it { is_expected.not_to allow_transition_to(:canceled) }
    end

    context "with the canceled state" do
      before { subject.update(state: "canceled") }

      it { is_expected.to have_state(:canceled) }
      it { is_expected.not_to allow_event(:review) }
      it { is_expected.not_to allow_event(:ready) }
      it { is_expected.not_to allow_event(:cancel) }
      it { is_expected.not_to allow_transition_to(:pending) }
      it { is_expected.not_to allow_transition_to(:processing) }
      it { is_expected.not_to allow_transition_to(:canceled) }
    end

    context "with the invalid state" do
      let!(:invalid_state) { subject.update(state: "invalid") }

      it "returns false" do
        expect(invalid_state).to be_falsey
      end

      it "does not update the state" do
        expect(RequestBook.where(state: "invalid")).to be_empty
      end
    end
  end
end
