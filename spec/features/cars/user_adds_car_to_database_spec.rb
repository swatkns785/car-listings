require "rails_helper"

feature "a user adds a car to database", %q(
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
Acceptance Criteria:

[x] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
[x] Only years from 1920 and above can be specified.
[x] I can optionally specify a description of the car.
[x] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
[x] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
[x] Upon successfully creating a car, I am redirected back to the index of cars.

) do

  scenario "a user successfully adds a car to the database, meeting all acceptance criteria" do

    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer_id: manufacturer.id)

    visit root_path
    click_link "Add Vehicle"

    expect(page).to have_content "Fill in the form below to add a car!"

    select manufacturer.name, from: "Manufacturer"
    fill_in "Mileage", with: car.mileage
    fill_in "Year", with: car.year
    fill_in "Color", with: car.color
    fill_in "Description", with: car.description

    click_button "Submit"

    expect(page).to have_content "Your vehicle has been added."
    expect(page).to have_content "All of the Cars"
    expect(page).to have_content manufacturer.name
    expect(page).to have_content car.mileage
    expect(page).to have_content car.year
    expect(page).to have_content car.color

  end

  scenario "a user tries to enter a year before 1920" do

    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer_id: manufacturer.id)

    visit new_car_path

    select manufacturer.name, from: "Manufacturer"
    fill_in "Mileage", with: car.mileage
    fill_in "Year", with: 1914
    fill_in "Color", with: car.color
    fill_in "Description", with: car.description
    click_button "Submit"

    expect(page).to have_content "Year must be greater than 1920"

  end

  scenario "a user tries to add non-integers into the mileage field" do

    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer_id: manufacturer.id)

    visit new_car_path

    select manufacturer.name, from: "Manufacturer"
    fill_in "Mileage", with: "This is a string"
    fill_in "Year", with: car.year
    fill_in "Color", with: car.color
    fill_in "Description", with: car.description
    click_button "Submit"

    expect(page).to have_content "The mileage field must only include integers."

  end

  scenario "a user leaves all fields blank" do

    visit new_car_path

    click_button "Submit"

    expect(page).to have_content "Manufacturer can't be blank"
    expect(page).to have_content "Color can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Mileage can't be blank"

  end

end
