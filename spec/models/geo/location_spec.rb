require 'rails_helper'

module Geo
  shared_examples 'a valid location' do
    it 'its Factory is valid' do
      expect(location).to be_valid
    end
  end

  RSpec.describe Location, type: :model do
    context 'with Prime Minister\'s Office' do
      it_behaves_like 'a valid location' do
        let(:location) { FactoryGirl.create(:gb_office) }
      end
    end
  end
end
