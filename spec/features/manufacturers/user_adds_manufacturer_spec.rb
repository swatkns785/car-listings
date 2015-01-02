require "rails_helper"

feature "a user adds a manufacturer to databse", %q(
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot

[ ] I must specify a manufacturer name and country.
[ ] If I do not specify the required information, I am presented with errors.
[ ] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers.

) do

  scenario "user successfully adds a manufacturer", focus: true do

    manufacturer = FactoryGirl.create(:manufacturer)

    visit root_path
    expect(page).to have_link "Add Manufacturer"
    click_link "Add Manufacturer"

    expect(page).to have_content "Fill in the form below to add a manufacturer!"
    fill_in "Manufacturer Name", with: manufacturer.name
    fill_in "Country of Origin", with: manufacturer.country
    click_button "Submit"

    expect(page).to have_content "All of the Manufacturers"
    expect(page).to have_content manufacturer.name

  end

end
