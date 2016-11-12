FactoryGirl.define do
  factory :geo_location, class: 'Geo::Location' do
    trait :without_reference do
      place nil
      country nil
      locatable nil
    end

    trait :gb_prime_minister do
      address 'Prime Minister\'s Office\n10 Downing Street'
      zip_code 'SW1A 2AA'
      latitude 51.503396
      longitude 0.127640
    end

    trait :de_chancellor do
      address 'Bundeskanzleramt\nWilly-Brandt-Straße 1'
      zip_code '10557'
      latitude 52.520207
      longitude 13.369052
    end

    trait :fr_president do
      address 'Palais de l\'Elysée\n55, Rue du Faubourg Saint-Honoré'
      zip_code '75008'
      latitude 48.870278
      longitude 2.316389
    end

    factory :gb_office do
      gb_prime_minister
      place do
        FactoryGirl::FactoryRunner.new(:london, @build_strategy.class, []).run
      end
      country do
        FactoryGirl::FactoryRunner.new(:great_britain, @build_strategy.class, []).run
      end
    end

#    factory :de_office do
#      de_chancellor
#      place do
#        FactoryGirl::FactoryRunner.new(:berlin, @build_strategy.class, []).run
#      end
#      country do
#        FactoryGirl::FactoryRunner.new(:berlin, @build_strategy.class, []).run
#      end
#    end

#    factory :gb_office do
#      fr_president
#      place do
#        FactoryGirl::FactoryRunner.new(:berlin, @build_strategy.class, []).run
#      end
#      country do
#        FactoryGirl::FactoryRunner.new(:berlin, @build_strategy.class, []).run
#      end
#    end
  end
end
