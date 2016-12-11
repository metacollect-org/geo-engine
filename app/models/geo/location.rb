module Geo
  class Location < ApplicationRecord
    belongs_to :place, class_name: 'Place'
    belongs_to :country, class_name: 'Country'
    belongs_to :locatable, polymorphic: true

    validates :address, presence: true
    validates :zip_code, presence: true
#    validates :place, existence: true, allow_nil: true
#    validates :country, existence: true, allow_nil: true
    validates :latitude, numericality: true, allow_nil: true
    validates :longitude, numericality: true, allow_nil: true
#    validates :locatable, existence: true, allow_nil: true
  end
end
