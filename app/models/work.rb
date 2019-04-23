class Work < ApplicationRecord
  has_many :votes

  def self.entries(category)
    return Work.where(category: category)
  end
end
