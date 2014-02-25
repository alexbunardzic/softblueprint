require 'spec_helper'

feature "Editing Roles" do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:role) { FactoryGirl.create(:role, project: project) }

  before do
    visit '/'
    click_link project.name
    click_link role.name
    click_link "Edit Role"
  end

  scenario "updating a role for a project" do
    #fill_in "Name", with: "Make it really shine!"
    click_button "Update Role"

    expect(page).to have_content("Role has been updated.")

    within("#role h2") do
      expect(page).to have_content role.name
    end
  end

  scenario "updating a role with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Role"

    expect(page).to have_content("Role has not been updated.")
  end
end