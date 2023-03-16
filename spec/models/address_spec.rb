# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:complement) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:uf) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:municipe) }
  end

  describe 'address create' do
    subject(:address) { build(:address, municipe:) }

    let!(:municipe) { create(:municipe) }

    before { address.save }

    it { is_expected.to be_persisted }
  end
end
