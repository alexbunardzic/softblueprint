require 'spec_helper'

feature "Viewing Roles" do
  before do
    sample = FactoryGirl.create(:project, name: "Sample project")
    FactoryGirl.create(:role, project: sample, name: "Make it shine", description: "Oh my!")

    another_sample = FactoryGirl.create(:project, name: "Another sample")
    FactoryGirl.create(:role, project: another_sample, name: "Standard", description: "It's a joke!")

    visit '/'
  end

  scenario "viewing a role for a given project" do
    click_link "Sample project"

    expect(page).to have_content("Make it shine")
    expect(page).to_not have_content("It's a joke!")

    click_link "Make it shine"
    within("#role h2") do
      expect(page).to have_content("Make it shine")
    end

    expect(page).to have_content("Oh my!")
  end
end