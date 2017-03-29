require "rails_helper"

RSpec.feature "User can view projects" do
	let(:project) { FactoryGirl.create(:project, name: "Internet Explorer") } 

	before do
		visit project_url(project)
	end

	scenario "specific project" do
		expect(page).to have_content project.name
		expect(page).to have_content project.description
	end
end