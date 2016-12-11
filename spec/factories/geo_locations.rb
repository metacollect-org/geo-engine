FactoryGirl.define do
  factory :geo_location, class: 'Geo::Location' do
    place nil
    country nil
    locatable nil

    factory :english_office do
      address 'Prime Minister\'s Office\n10 Downing Street'
      zip_code 'SW1A 2AA'
      latitude 51.503396
      longitude 0.127640
    end

    trait :german_office do
      address 'Bundeskanzleramt\nWilly-Brandt-Straße 1'
      zip_code '10557'
      latitude 52.520207
      longitude 13.369052
    end

    trait :french_office do
      address 'Palais de l\'Elysée\n55, Rue du Faubourg Saint-Honoré'
      zip_code '75008'
      latitude 48.870278
      longitude 2.316389
    end
  end
end
