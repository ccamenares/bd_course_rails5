require 'rails_helper'

RSpec.feature "Deleting an Article" do

	before do
		@john = User.create(email: "john@example", password: "password")
		@article = Article.create(title: "Title One", body: "Body of article one", user: @john) 
	end

	scenario "A non-owner user attempts to delete an article" do  ###HW SECTION 4 VIDEO 61.
		visit "/"

		click_link @article.title
		expect(page).not_to have_link("Delete Article")
	end

	scenario "A non-signed in user attempts to delete an article" do  ####HW SECTION 4 VIDEO 61.
		visit "/"

		click_link @article.title
		expect(page).not_to have_link("Delete Article")
	end

	scenario "A user deletes an article" do 
		login_as(@john)
		visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Article has been deleted")
		expect(current_path).to eq(articles_path)
	end
	
end