require 'spec_helper'

feature "Editing Projects" do
  before do
    FactoryGirl.create(:project, name: "Proj 2")

    visit '/'
    click_link 'Proj 2'
    click_link 'Edit Project'
  end

  scenario "Updating a project" do
    fill_in "Name", with: "Modified project"

    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end

  scenario "updating a project with invalid attributes is bad" do
    fill_in "Name", with: ""

    click_button "Update Project"

    expect(page).to have_content("Project has not been updated.")
  end
end