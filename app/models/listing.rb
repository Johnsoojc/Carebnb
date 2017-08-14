class Listing < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :taggings, through: :tags

  def all_tags=(names)
    self.taggings = names.downcase.split(",").map do |name|
      Tagging.where(name: name.strip.downcase).first_or_create!
    end
  end

  def all_tags_array=(names)
    self.taggings << names.map do |name|
      Tagging.where(name: name.strip.downcase).first_or_create!
    end
  end

  def all_tags_array
  end


  def all_tags
    self.taggings.map(&:name).join(", ")
  end

  def all_taggings
    @default_taggings = ["Smoker", "Asshole", "Gamer", "Asian"]
  end
end
