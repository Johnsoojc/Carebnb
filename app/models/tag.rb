class Tag < ApplicationRecord
  belongs_to :listing
  belongs_to :tagging
end
