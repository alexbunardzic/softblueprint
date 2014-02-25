require 'spec_helper'

feature "Creating Roles" do
  before do
    FactoryGirl.create(:project, name: "First project")

    visit '/'
    click_link 'First project'
    click_link 'New Role'
  end

  scenario "Creating a role" do
    fill_in "Name", with: "First role"
    fill_in "Description", with: "First description"
    click_button "Create Role"

    expect(page).to have_content("Role has been created.")
  end

  scenario "Creating a role with invalid attributes is bad" do
    click_button "Create Role"

    expect(page).to have_content("Role has not been created.")
    #expect(page).to have_content("Name cannot be blank.")
    #expect(page).to have_content("Description cannot be blank.")
  end

  scenario "description must be longer than 10 characters" do
    fill_in "Name", with: "something"
    fill_in "Description", with: "sucks"
    click_button "Create Role"

    expect(page).to have_content("Role has not been created")
    expect(page).to have_content("Description is too short")
  end
end