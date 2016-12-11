module Geo
  class Place < ApplicationRecord
    has_many :translations, as: :translatable, class_name: 'Multilingual::Translation', dependent: :destroy

    validates :uid, presence: true,
                     uniqueness: true
    validates_associated :translations
  end
end
