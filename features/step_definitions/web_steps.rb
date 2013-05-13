# Givens
Given "I am on the log in page" do
  visit new_user_session_path
end

Given "that user is logged in" do
  visit "/log_in"

  fill_in 'email', with: @user.email
  fill_in 'password', with: 'pass'

  click_button "Log In"
end

Given "I am on the home page" do
  visit pages_path
end

Given "I am on the new page view" do
  visit new_page_path
end

# Whens

When 'I fill in the following:' do |table|
  table.raw.each do |row|
    fill_in row[0], with: row[1]
  end
end

When /^I press "(.*?)"$/ do |button|
  click_button button
end

When /^I follow "(.*?)"$/ do |link|
  click_link link
end

# Thens

Then /^I should see "(.*?)"$/ do |text|
  within "body" do
    page.should have_content(text)
  end
end
