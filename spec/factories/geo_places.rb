FactoryGirl.define do
  factory :geo_place, class: 'Geo::Place' do
    factory :london do
      uid 'london'
    end

    factory :berlin do
      uid 'berlin'
    end

    factory :paris do
      uid 'paris'
    end
  end
end
