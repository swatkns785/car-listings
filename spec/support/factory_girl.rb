require 'factory_girl'

FactoryGirl.define do

  factory :manufacturer do
    sequence(:name) {|n| "Manufacturer #{n}"}
    country "USA"
  end

  factory :car do
    color "blue"
    year 1998
    mileage 108252
    description "A car for the common man."
  end

end
