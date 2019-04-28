class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: {scope: :creator, :message => "and creator combination already exists"}
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: Date.today.year}

  def self.categories
    return ['movie', 'book', 'album']
  end

  def self.entries(category)
    return Work.where(category: category)
  end

  def self.top_ten(category)
    return entries(category)[0..9]
  end
end
