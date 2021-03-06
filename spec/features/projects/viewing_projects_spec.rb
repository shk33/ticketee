require "rails_helper"

RSpec.feature "User can view projects" do
  let(:user)    { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: "Internet Explorer") }

  before do
    assign_role! user, :viewer, project
    login_as user
    visit project_url(project)
  end

  scenario "specific project" do
    expect(page).to have_content project.name
    expect(page).to have_content project.description
  end

  scenario "unless they do not have the permissions" do
    FactoryGirl.create(:project, name: "Hidden")
    visit "/"
    expect(page).not_to have_content "Hidden"
  end
end
