require "rails_helper"

RSpec.feature "Managers can edit existing projects" do
	let(:user)    { FactoryGirl.create(:user) }
	let(:project) { FactoryGirl.create(:project, name: "Sublime Text 3") }

	before do
		assign_role! user, :manager, project
		login_as user
		visit "/"

		click_link "Sublime Text 3"
		click_link "Edit Project"
	end

	scenario "with valid attributes" do
		fill_in "Name", with: "Sublime Text 4 beta"
		click_button "Update Project"

		expect(page).to have_content "Project has been updated"
		expect(page).to have_content "Sublime Text 4 beta"

	end

	scenario "with providing invalid attributes" do
		fill_in "Name", with: ""
		click_button "Update Project"

		expect(page).to have_content "Project has not been updated"

	end

end
