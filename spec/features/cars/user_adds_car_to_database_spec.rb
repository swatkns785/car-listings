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
[ ] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
[x] Upon successfully creating a car, I am redirected back to the index of cars.

) do

  scenario "a user successfully adds a car to the database, meeting all acceptance criteria" do

    car = FactoryGirl.create(:car)

    visit root_path
    click_link "Add Vehicle"

    expect(page).to have_content "Fill in the form below to add a car!"
    fill_in "Make", with: car.make
    fill_in "Mileage", with: car.mileage
    fill_in "Year", with: car.year
    fill_in "Color", with: car.color
    fill_in "Description", with: car.description
    click_button "Submit"

    expect(page).to have_content "Your vehicle has been added."
    expect(page).to have_content "All of the Cars"
    expect(page).to have_content car.make
    expect(page).to have_content car.mileage
    expect(page).to have_content car.year
    expect(page).to have_content car.color

  end

  scenario "a user tries to enter a year before 1920" do

    car = FactoryGirl.create(:car)

    visit new_car_path

    fill_in "Make", with: car.make
    fill_in "Mileage", with: car.mileage
    fill_in "Year", with: 1914
    fill_in "Color", with: car.color
    fill_in "Description", with: car.description
    click_button "Submit"

    expect(page).to have_content "Year must be greater than 1920"

  end

end
