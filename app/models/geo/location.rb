module Geo
  class Location < ApplicationRecord
    belongs_to :locatable, polymorphic: true
    belongs_to :place, class_name: 'Place'
    belongs_to :country, class_name: 'Country'

    validates :address, presence: true
    validates :zip_code, presence: true
    validates :place, presence: true, allow_nil: true
    validates :country, presence: true, allow_nil: true
    validates :latitude, presence: true, numericality: true
    validates :longitude, presence: true, numericality: true
    validates :locatable, presence: true, allow_nil: true
  end
end
