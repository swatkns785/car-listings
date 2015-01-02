class Manufacturer < ActiveRecord::Base

  validates :name,
    presence: true,
    length: { minimum: 3 }

  validates :country,
    presence: true

end
