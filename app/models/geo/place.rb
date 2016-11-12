module Geo
  class Place < ApplicationRecord
    validates :uid, presence: true,
                     uniqueness: true
  end
end
