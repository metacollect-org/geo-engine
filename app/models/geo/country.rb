module Geo
  class Country < ApplicationRecord
    validates :code, presence: true,
                     length: { is: 2 },
                     uniqueness: true
  end
end
