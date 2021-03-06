require "rails_helper"

RSpec.feature "Admins can create new users" do

	let(:admin) { FactoryGirl.create(:user, :admin) }

	before do
		login_as admin
		visit "/"
		click_link "Admin"
		click_link "User"
		click_link "New User"
	end

	scenario "with valid attributes" do
		fill_in "Email", with: "newuser@example.com"
		fill_in "Password", with: "password"
		click_button "Create User"

		expect(page).to  have_content "User has been created"
	end

	scenario "with valid attributes" do
		fill_in "Email", with: "admin@example.com"
		fill_in "Password", with: "password"
		check "Is an admin?"
		click_button "Create User"

		expect(page).to  have_content "User has been created"
		expect(page).to  have_content "admin@example.com (Admin)"
	end

end