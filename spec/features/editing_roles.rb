require 'spec_helper'

feature "Editing Roles" do
  before do
    project = FactoryGirl.create(:project, name: "Sample project")
    role = FactoryGirl.create(:role, project: project, name: "Make it reallty shine!", description: "Oh my!")
    visit '/'
    click_link project.name
    click_link role.name
    click_link "Edit Role"
  end

  scenario "updating a role for a project" do
    fill_in "Name", with: "Make it really shine!"
    click_button "Update Role"

    expect(page).to have_content("Role has been updated.")

    #within("#role h2") do
      #expect(page).to have_content role.name
    #end
  end

  scenario "updating a role with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Role"

    expect(page).to have_content("Role has not been updated.")
  end
end