class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name,
    presence: true,
    length: { minimum: 3 }

  validates :country,
    presence: true
end
