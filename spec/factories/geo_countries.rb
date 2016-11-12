FactoryGirl.define do
  factory :geo_country, class: 'Geo::Country' do
    trait :code_gb do
      code 'GB'
    end

    trait :code_germany do
      code 'DE'
    end

    trait :code_france do
      code 'FR'
    end

    factory :great_britain, traits: [:code_gb]
    factory :germany, traits: [:code_germany]
    factory :france, traits: [:code_france]
  end
end
