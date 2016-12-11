FactoryGirl.define do
  factory :geo_country, class: 'Geo::Country' do
    factory :great_britain do
      code 'GB'
    end

    factory :germany do
      code 'DE'
    end

    factory :france do
      code 'FR'
    end
  end
end
