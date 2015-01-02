require 'factory_girl'

FactoryGirl.define do

  factory :manufacturer do
    sequence(:name) {|n| "Manufacturer #{n}"}
    country "USA"
  end

end
