require "rails_helper"

feature "a user adds a manufacturer to database", %q(
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot

[x] I must specify a manufacturer name and country.
[x] If I do not specify the required information, I am presented with errors.
[x] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers.

) do

  context "user meets all positive acceptance criteria" do

    scenario "user successfully adds a manufacturer" do

      manufacturer = FactoryGirl.create(:manufacturer)

      visit root_path
      expect(page).to have_link "Add Manufacturer"
      click_link "Add Manufacturer"

      expect(page).to have_content "Fill in the form below to add a manufacturer!"
      fill_in "Manufacturer Name", with: manufacturer.name
      fill_in "Country of Origin", with: manufacturer.country
      click_button "Submit"

      expect(page).to have_content "You have successfully added a manufacturer to the database."
      expect(page).to have_content "All of the Manufacturers"
      expect(page).to have_content manufacturer.name

    end

  end

  context "user makes mistakes while trying to add manufacturer to database" do

    scenario "user does not add manufacturer name correctly" do

      visit new_manufacturer_path

      fill_in "Manufacturer Name", with: ""
      fill_in "Country of Origin", with: "USA"
      click_button "Submit"

      expect(page).to have_content "Name is too short (minimum is 3 characters)"

    end

    scenario "user leaves fields blank" do

      visit new_manufacturer_path
      click_button "Submit"

      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Country can't be blank"

    end

  end

end
