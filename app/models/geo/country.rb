module Geo
  class Country < ApplicationRecord
    validates :code, presence: true,
                     length: { is: 2 },
                     uniqueness: true,
                     format: { with: /[[:upper:]]/,
                       message: 'only allows uppercase letters' }
  end
end
