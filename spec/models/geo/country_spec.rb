require 'rails_helper'

module Geo
  shared_examples 'a valid country' do
    it 'its Factory is valid' do
      expect(country).to be_valid
    end

    context 'is invalid when @code is' do
      it 'missing' do
          country.code = nil
          expect(country).not_to be_valid
      end

      it 'empty' do
          country.code = ''
          expect(country).not_to be_valid
      end

      it 'one-letter long' do
          country.code = 'A'
          expect(country).not_to be_valid
      end

      it 'three-letters long' do
          country.code = 'ABC'
          expect(country).not_to be_valid
      end

      it 'lowercase' do
          country.code.downcase!
          expect(country).not_to be_valid
      end
    end

    context '@code uniqueness' do
      it 'record has the given code' do
        expect(country.code).to eq(code)
      end

      it 'is violated by another model with the same code' do
        expect(country).to be_valid
        expect(second).not_to be_valid
      end

      it 'is fulfilled by another model with a different two-letter code' do
        expect(country).to be_valid
        second.code = 'FU'
        expect(second).to be_valid
      end
    end
  end

  shared_examples 'an ActiveRecord with proper CRUD' do
    it 'has no records before creation' do
      expect(Country.count).to eq(0)
    end

#    it 'has no translation records before creation' do
#      expect(Multilingual::Translation.count).to eq(0)
#    end

    it "has records after creation" do
      country  # create object
      expect(Country.count).to eq(country_count)
    end

#    it 'has translation records after creation' do
#      country  # create object
#      expect(Multilingual::Translation.count).to eq(trans_count)
#    end

    it 'has no records after destruction' do
      country.destroy
      expect(Country.count).to eq(0)
    end

#    it 'has no translation records after destruction' do
#      country.destroy
#      expect(Multilingual::Translation.count).to eq(0)
#    end
  end

  RSpec.describe Country, type: :model do
    context 'with Great Britain' do
      it_behaves_like 'a valid country' do
        let(:country) { FactoryGirl.create(:great_britain) }
        let(:second) { FactoryGirl.build(:great_britain) }
        let(:code) { 'GB' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:country) { FactoryGirl.create(:great_britain) }
        let(:country_count) { 1 }
#        let(:trans_count) { 0 }
      end
    end

    context 'with Germany' do
      it_behaves_like 'a valid country' do
        let(:country) { FactoryGirl.create(:germany) }
        let(:second) { FactoryGirl.build(:germany) }
        let(:code) { 'DE' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:country) { FactoryGirl.create(:germany) }
        let(:country_count) { 1 }
#        let(:trans_count) { 0 }
      end
    end

    context 'with France' do
      it_behaves_like 'a valid country' do
        let(:country) { FactoryGirl.create(:france) }
        let(:second) { FactoryGirl.build(:france) }
        let(:code) { 'FR' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:country) { FactoryGirl.create(:france) }
        let(:country_count) { 1 }
#        let(:trans_count) { 0 }
      end
    end
  end
end
