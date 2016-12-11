module Geo
  class Country < ApplicationRecord
    has_many :translations, as: :translatable, class_name: 'Multilingual::Translation', dependent: :destroy

    validates :code, presence: true,
                     length: { is: 2 },
                     uniqueness: true,
                     format: { with: /[[:upper:]]{2}/,
                       message: 'only allows uppercase letters' }
    validates_associated :translations

    def valid_zip_code?(zip_code)
      re = Regexp.new(zip_format)
      return !re.match(zip_code).nil?
    end
  end
end
