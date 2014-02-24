require 'spec_helper'

feature "Deleting Projects" do
  scenario "Deleting a project" do
    FactoryGirl.create(:project, name: "Proj 3")

    visit '/'
    click_link "Proj 3"
    click_link "Delete Project"

    expect(page).to have_content("Project has been destroyed.")

    visit '/'

    expect(page).to_not have_content("Proj 3")
  end
end