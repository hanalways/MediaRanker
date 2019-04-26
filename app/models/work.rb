class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: {scope: :creator, :message => "and creator combination already exists"}
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: Date.today.year + 1}

  def self.entries(category)
    return Work.where(category: category)
  end
end
