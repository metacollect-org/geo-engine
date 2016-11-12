require 'rails_helper'

module Geo
  shared_examples 'a valid place' do
    it 'its Factory is valid' do
      expect(place).to be_valid
    end

    context 'is invalid when @uid is' do
      it 'missing' do
          place.uid = nil
          expect(place).not_to be_valid
      end

      it 'empty' do
          place.uid = ''
          expect(place).not_to be_valid
      end
    end

    context '@uid uniqueness' do
      it 'record has the given uid' do
        expect(place.uid).to eq(uid)
      end

      it 'is violated by another model with the same uid' do
        expect(place).to be_valid
        expect(second).not_to be_valid
      end

      it 'is fulfilled by another model with a different uid' do
        expect(place).to be_valid
        second.uid = 'spookymountain'
        expect(second).to be_valid
      end
    end
  end

  shared_examples 'an ActiveRecord with proper CRUD' do
    it 'has no records before creation' do
      expect(Place.count).to eq(0)
    end

#    it 'has no translation records before creation' do
#      expect(Multilingual::Translation.count).to eq(0)
#    end

    it "has records after creation" do
      place  # create object
      expect(Place.count).to eq(place_count)
    end

#    it 'has translation records after creation' do
#      place  # create object
#      expect(Multilingual::Translation.count).to eq(trans_count)
#    end

    it 'has no records after destruction' do
      place.destroy
      expect(Place.count).to eq(0)
    end

#    it 'has no translation records after destruction' do
#      place.destroy
#      expect(Multilingual::Translation.count).to eq(0)
#    end
  end

  RSpec.describe Place, type: :model do
    context 'with London' do
      it_behaves_like 'a valid place' do
        let(:place) { FactoryGirl.create(:london) }
        let(:second) { FactoryGirl.build(:london) }
        let(:uid) { 'london' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:place) { FactoryGirl.create(:london) }
        let(:place_count) { 1 }
#        let(:trans_count) { 0 }
      end
    end

    context 'with Berlin' do
      it_behaves_like 'a valid place' do
        let(:place) { FactoryGirl.create(:berlin) }
        let(:second) { FactoryGirl.build(:berlin) }
        let(:uid) { 'berlin' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:place) { FactoryGirl.create(:berlin) }
        let(:place_count) { 1 }
#        let(:trans_count) { 0 }
      end
    end

    context 'with Paris' do
      it_behaves_like 'a valid place' do
        let(:place) { FactoryGirl.create(:paris) }
        let(:second) { FactoryGirl.build(:paris) }
        let(:uid) { 'paris' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:place) { FactoryGirl.create(:paris) }
        let(:place_count) { 1 }
#        let(:trans_count) { 0 }
      end
    end
  end
end
