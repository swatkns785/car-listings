class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :make,
    presence: true

  validates :color,
    presence: true

  validates :mileage,
    presence: true,
    numericality: { only_integer: true, message: "The mileage field must only include integers." }

  validates :year,
    presence: true,
    numericality: { greater_than: 1920, less_than: (Date.today.year + 1), only_integer: true }
end
