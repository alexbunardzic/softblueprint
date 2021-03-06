require 'spec_helper'

feature "Creating Projects" do
  before do
    visit '/'
    click_link 'New Project'
  end

  scenario "can create a project" do
    fill_in "Name", with: "Carenet"
    fill_in "Description", with: "Some description"
    click_button "Create Project"

    expect(page).to have_content("Project has been created.")
  end

  scenario "can not create a project wthout a name" do
    click_button "Create Project"

    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
