Given /^I am logged in as a user$/ do
  @current_user = User.make
  login_as @current_user
end

Given /^I have some stock items$/ do
  @current_user.items << Item.make(3)
end

Given /^another user with some stock items exists$/ do
  @another_user = User.make
  @current_user.items << Item.make!(2)
end

When /^I am at stock list$/ do
  visit user_items_path{@urrent_user}
  save_and_open_page
end

Then /^I should see those items in my stock list$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not see the other user items$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am at adding stock item page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I fullfill the form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see new item in stock list$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am at edit item page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see modifications done in this item$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I delete a stock item$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not see this item in stock list$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I click to edit an item$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be at this item edit page$/ do
  pending # express the regexp above with the code you wish you had
end
