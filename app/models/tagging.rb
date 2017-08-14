class Tagging < ApplicationRecord
  has_many :tags
  has_many :listing,  through: :tags

end
