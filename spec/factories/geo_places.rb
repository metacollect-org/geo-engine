FactoryGirl.define do
  factory :geo_place, class: 'Geo::Place' do
    trait :place_london do
      uid 'london'
    end

    trait :place_berlin do
      uid 'berlin'
    end

    trait :place_paris do
      uid 'paris'
    end

    factory :london, traits: [:place_london]
    factory :berlin, traits: [:place_berlin]
    factory :paris, traits: [:place_paris]
  end
end
