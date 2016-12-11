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
        let(:location) { FactoryGirl.create(:english_office,
                           place: FactoryGirl.build_stubbed(:london),
                           country: FactoryGirl.build_stubbed(:great_britain),
                           locatable: double('dummy', primary_key: 112)) }
      end
    end
  end
end
