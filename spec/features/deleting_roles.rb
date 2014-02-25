require 'spec_helper'

feature "Deleting Roles" do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:role) { FactoryGirl.create(:role, project: project) }

  before do
    visit '/'
    click_link project.name
    click_link role.name
  end

  scenario "deleting a role for a project" do
    click_link "Delete Role"

    expect(page).to have_content("Role has been deleted.")
  end
end