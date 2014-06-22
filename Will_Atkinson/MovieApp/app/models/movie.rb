class Movie < ActiveRecord::Base
  validates :title, :description, presence: true, length: { minimum: 10 }
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :year_released, numericality: { only_integer: true, greater_than: 0 }

end
