class Player < ApplicationRecord
  has_many :brands

  validates :name, presence: true, length: {minimum: 4, maximum: 10}
  validates :age, presence: true, numericality: {greater_than: 17, less_than: 60}
end
